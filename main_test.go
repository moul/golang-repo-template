package main

import "testing"

func TestRun(t *testing.T) {
	err := run(nil)
	if err != nil {
		t.Fatalf("err should be nil: %v", err)
	}
}
