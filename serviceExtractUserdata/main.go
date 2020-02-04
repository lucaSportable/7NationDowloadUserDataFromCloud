package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"serviceExtractUserData/dbReplica"
	"strings"
	"time"
)


// TODO: consider the authentication token, caching of the operation itself.


func localUserData(w http.ResponseWriter, r*http.Request) {
	segs := strings.Split(r.URL.Path, "/")
	if len(segs) < 3 {
		w.WriteHeader(http.StatusNotFound)
		fmt.Fprint(w, "Not enough arguments")
		return
	}
	userId := segs[2]

	if err :=dbReplica.ExportUserData(userId,w);err != nil {
		http.Error(w, err.Error(), 500)
		return
	}
	w.Header().Set("Content-Disposition", "attachment; filename="+userId+time.Now().String()+".gz")
}


func main(){
	var addr = flag.String("host", ":8080", "The addr of the application.")
	flag.Parse() // parse the flags

	// routes
	http.HandleFunc("/localUserData/",localUserData)

	// start the web server
	log.Println("Starting web server on", *addr)
	if err := http.ListenAndServe(*addr, nil); err != nil {
		log.Fatal("ListenAndServe:", err)
	}

}
