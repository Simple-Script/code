package main

import (
	"fmt"
	"time"
)

func main() {
	loc, err := time.LoadLocation("America/Chicago")
	if err != nil {
		fmt.Println("Error loading location:", err)
		return
	}
	cstTime := time.Now().In(loc)
	fmt.Println("Current CST time:", cstTime.Format("2006-01-02 15:04:05"))
}
