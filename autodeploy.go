package main

import (
	"fmt"
	"log"
	"net/http"
	"os/exec"
)

func restartGoTourService(w http.ResponseWriter, r *http.Request) {
	cmdArgs := []string{"-c", "sudo systemctl restart gotour"}
	out, err := exec.Command("/bin/sh", cmdArgs...).Output()
	if err != nil {
		fmt.Fprintf(w, err.Error())
		fmt.Println(err)
	} else {
		fmt.Fprintf(w, string(out))
	}
}

func main() {
	http.HandleFunc("/update-docker-go-tour", restartGoTourService)
	err := http.ListenAndServe(":9090", nil)
	if err != nil {
		log.Fatal("ListenAnServe : ", err)
	}
}
