package main

import (
	"fmt"
	"log"
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
	srand.Fast()
	fmt.Print(motd.Default())
	fmt.Println("Hello World!", args)
	return nil
}
