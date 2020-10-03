package main

import (
	"fmt"
	"math/rand"
	"os"

	"moul.io/motd"
	"moul.io/srand"
	"moul.io/u"
	"moul.io/zapconfig"
)

func main() {
	if err := run(os.Args); err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(1)
	}
}

func run(args []string) error {
	rand.Seed(srand.Fast())
	fmt.Print(motd.Default())
	logger, err := zapconfig.Configurator{}.Build()
	if err != nil {
		return err
	}
	logger.Info("Hello World!")
	fmt.Println("args", u.JSON(args))
	return nil
}
