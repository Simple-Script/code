package main

import (
	"fmt"
	"log"
	"os"
)

func add(a, b float64) float64 {
	return a + b
}

func subtract(a, b float64) float64 {
	return a - b
}

func multiply(a, b float64) float64 {
	return a * b
}

func divide(a, b float64) float64 {
	if b == 0 {
		log.Fatal("Cannot divide by zero")
	}
	return a / b
}

func main() {
	var a, b float64
	var operator string

	fmt.Println("Enter first number:")
	_, err := fmt.Scan(&a)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Enter second number:")
	_, err = fmt.Scan(&b)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Enter operator (+, -, *, /):")
	_, err = fmt.Scan(&operator)
	if err != nil {
		log.Fatal(err)
	}

	var result float64
	switch operator {
	case "+":
		result = add(a, b)
	case "-":
		result = subtract(a, b)
	case "*":
		result = multiply(a, b)
	case "/":
		result = divide(a, b)
	default:
		log.Fatal("Invalid operator")
	}

	fmt.Printf("Result: %.2f\n", result)
	os.Exit(0)
}
