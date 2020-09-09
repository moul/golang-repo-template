package main

import (
	"fmt"
	"log"
	"math/rand"
	"os"

	"moul.io/motd"
	"moul.io/srand"
)

func main() {
	if err := run(os.Args); err != nil {
		log.Fatalf("error: %v", err)
		os.Exit(1)
	}
}

// nolint:unparam
func run(args []string) error {
	rand.Seed(srand.Fast())
	fmt.Print(motd.Default())
	fmt.Println("Hello World!")
	if len(args) > 1 {
		fmt.Println("args", args)
	}
	return nil
}
