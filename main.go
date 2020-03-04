package main

import (
	"fmt"
	"log"
	"os"
)

func main() {
	if err := run(os.Args); err != nil {
		log.Fatalf("error: %v", err)
		os.Exit(1)
	}
}

func run(args []string) error {
	fmt.Println("Hello World!")
	return nil
}
