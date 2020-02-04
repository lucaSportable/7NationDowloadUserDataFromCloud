package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"strconv"
)

func main(){
	fmt.Println("Starting http file sever")
	http.HandleFunc("/",HandleClient)
	err := http.ListenAndServe(":8080",nil)
	if err != nil {
		fmt.Println(err)
	}
}

// transform this into a pg dumper response

func HandleClient(writer http.ResponseWriter, request *http.Request){

	Filename := request.URL.Query().Get("file")
	if Filename == ""{
		// Get not set, send a 400 bad request
		http.Error(writer, "Get 'file' not specified in url.",400)
		return
	}
	fmt.Println("Client requests: " + Filename)

	Openfile, err := os.Open(Filename)
	defer Openfile.Close()
	if err != nil {
		http.Error(writer,"File not found.",404)
		return
	}

	FileHeader := make([]byte,512)
	Openfile.Read(FileHeader)
	FileContentType := http.DetectContentType(FileHeader)
	FileStat, _ := Openfile.Stat()
	FileSize := strconv.FormatInt(FileStat.Size(), 10)

	writer.Header().Set("Content-Disposition", "attachment; filename="+Filename)
	writer.Header().Set("Content-Type", FileContentType)
	writer.Header().Set("Content-Length", FileSize)

	Openfile.Seek(0,0)
	io.Copy(writer,Openfile)
	return
}