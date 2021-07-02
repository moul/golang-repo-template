package main

import (
	"errors"
	"flag"
	"testing"

	"go.uber.org/goleak"
)

func TestRun(t *testing.T) {
	err := run([]string{"-h"})
	if !errors.Is(err, flag.ErrHelp) {
		t.Fatalf("err should be flag.ErrHelp, got %v", err)
	}
}

func TestMain(m *testing.M) {
	goleak.VerifyTestMain(m)
}
