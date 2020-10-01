package main

import (
	"fmt"
	"log"
	"math/rand"
	"os"

	"moul.io/motd"
	"moul.io/srand"
	"moul.io/zapconfig"
)

func main() {
	if err := run(os.Args); err != nil {
		log.Fatalf("error: %v", err)
		os.Exit(1)
	}
}

func run(args []string) error {
	logger, err := zapconfig.Configurator{}.BuildLogger()
	if err != nil {
		return err
	}
	rand.Seed(srand.Fast())
	fmt.Print(motd.Default())
	logger.Info("Hello World!")
	if len(args) > 1 {
		fmt.Println("args", args)
	}
	return nil
}
