package main

import (
	"testing"

	"go.uber.org/goleak"
)

func TestRun(t *testing.T) {
	err := run(nil)
	if err != nil {
		t.Fatalf("err should be nil: %v", err)
	}
}

func TestMain(m *testing.M) {
	goleak.VerifyTestMain(m)
}
