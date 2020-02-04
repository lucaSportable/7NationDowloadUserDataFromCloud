package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"os/exec"
)

func main(){
	fmt.Println("Starting http file sever")
	http.HandleFunc("/",HandleClient)
	err := http.ListenAndServe(":8080",nil)
	if err != nil {
		fmt.Println(err)
	}
}

// TODO: transform this into a pg dumper response

func HandleClient(writer http.ResponseWriter, request *http.Request){

	Filename := request.URL.Query().Get("file")
	if Filename == ""{
		// Get not set, send a 400 bad request
		http.Error(writer, "Get 'file' not specified in url.",400)
		return
	}
	writer.Header().Set("Content-Disposition", "attachment; filename="+Filename+".gz")
	fmt.Println("Client requests: " + Filename)
	// execute command
	if err := DumpPostgres(Filename,writer); err != nil {
		http.Error(writer,"not found: "+err.Error(),404)
		return
	}

	return
}

// DumpPostgres dump from postgres.
func DumpPostgres(databaseName string, writer io.Writer) error{
	// execute command
	cmd := exec.Command("pg_dump", "-Z6", "--dbname=postgresql://metrics_server:"+os.Getenv("SPORTABLEDB")+"@127.0.0.1:5432/"+databaseName)
	cmd.Stdout = writer
	err := cmd.Run()
	return err
}