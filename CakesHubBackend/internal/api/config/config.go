package config

import (
	"github.com/joho/godotenv"
	"github.com/sirupsen/logrus"
	"github.com/spf13/viper"
	"os"
)

type Config struct {
	ServiceHost string
	ServicePort int
}

func NewConfig(log *logrus.Logger) (*Config, error) {
	var err error

	configName := "config"
	_ = godotenv.Load()
	if os.Getenv("CONFIG_NAME") != "" {
		configName = os.Getenv("CONFIG_NAME")
	}

	viper.SetConfigName(configName)
	viper.SetConfigType("toml")
	viper.AddConfigPath("config")
	viper.AddConfigPath(".")
	viper.WatchConfig()

	if err = viper.ReadInConfig(); err != nil {
		return nil, err
	}

	cfg := &Config{}
	if err = viper.Unmarshal(cfg); err != nil {
		return nil, err
	}

	log.Info("config parsed")
	return cfg, nil
}
