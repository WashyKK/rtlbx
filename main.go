package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Println("Hello, World!")
	time.Sleep(2 * time.Second)
	
	fmt.Println("Goodbye, World!")

	fmt.Println("Current time:", time.Now().Format(time.RFC3339))

	fmt.Println("Time:", time.Now().Format(time.RFC3339))

}
