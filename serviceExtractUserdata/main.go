package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"serviceExtractUserData/dbreplica"
	"strings"
	"time"
)

// TODO: consider the authentication token, caching of the operation itself.
var Cb chan bool

func init() {
	Cb = make(chan bool, 1)
}

// middleware cs

func CriticalSection(f func(w http.ResponseWriter, r *http.Request)) func(http.ResponseWriter, *http.Request) {
	// get token either from url or Auth header
	return func(w http.ResponseWriter, r *http.Request) {
		Cb <- true
		f(w, r)
		defer func() { <-Cb }()
	}
}

func localUserData(w http.ResponseWriter, r *http.Request) {
	start := time.Now()
	segs := strings.Split(r.URL.Path, "/")
	if len(segs) < 3 {
		w.WriteHeader(http.StatusNotFound)
		fmt.Fprint(w, "Not enough arguments")
		return
	}
	userId := segs[2]

	if len(userId) == 0 {
		http.Error(w,fmt.Sprintf("Wrong User Id= %s",userId),http.StatusForbidden)
		return
	}
	sendFile := userId + ".gz" //time.Now().String()+".gz"
	w.Header().Set("Content-Disposition", "attachment; filename="+sendFile)

	if err := dbreplica.ExportUserData(userId, w); err != nil {
		http.Error(w, err.Error(), 500)
		return
	}
	fmt.Println("totalEndpoint:" + time.Now().Sub(start).String())

}

func main() {
	var addr = flag.String("host", ":8080", "The addr of the application.")
	flag.Parse() // parse the flags

	// routes
	http.HandleFunc("/localUserData/", CriticalSection(localUserData))

	// start the web server
	log.Println("Starting web server on", *addr)
	if err := http.ListenAndServe(*addr, nil); err != nil {
		log.Fatal("ListenAndServe:", err)
	}

}
