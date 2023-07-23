package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

type Config struct {
	DB struct {
		User     string
		Password string
		Host     string
		Port     int
	}
	Metric struct {
		Host string
		Port int
	}
	Langs []string
}

// LoadConfig loads the Cue config files, starting in the dirname directory.
func LoadConfig(dirname string) (*Config, error) {
	cueConfig := &load.Config{
		Dir: dirname,
	}

	buildInstances := load.Instances([]string{}, cueConfig)
	runtimeInstances := cue.Build(buildInstances)
	// runtimeInstances := cuecontext.New()
	instance := runtimeInstances[0]

	var config Config
	err := instance.Value().Decode(&config)
	if err != nil {
		return nil, err
	}
	return &config, nil
}

func main() {
	c, err := LoadConfig("config/")
	if err != nil {
		panic("error reading config")
	}
	fmt.Println(c.DB.Host)
}
