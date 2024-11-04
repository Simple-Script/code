package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
)

func downloadFile(url string, filepath string) error {
	response, err := http.Get(url)
	if err != nil {
		return err
	}
	defer response.Body.Close()

	out, err := os.Create(filepath)
	if err != nil {
		return err
	}
	defer out.Close()

	_, err = io.Copy(out, response.Body)
	return err
}

func main() {
	url := "https://example.com/file.txt"
	filepath := "file.txt"

	err := downloadFile(url, filepath)
	if err != nil {
		fmt.Printf("Error downloading file: %v\n", err)
		return
	}

	fmt.Println("File downloaded successfully")
}
