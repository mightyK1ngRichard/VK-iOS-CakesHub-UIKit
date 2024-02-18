package main

import (
	"CakesHubBackend/internal/api/config"
	"CakesHubBackend/internal/api/dsn"
	"CakesHubBackend/internal/api/handler"
	api "CakesHubBackend/internal/api/pkg"
	"CakesHubBackend/internal/api/repository"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"
)

// @title CakesHub
// @version 1.0
// @description Маркетплейс по продаже тортов
// @contact.name API Support
// @contact.url https://github.com/mightyK1ngRichard
// @contact.email dimapermyakov55@gmail.com
// @host 192.168.1.37:6070
// @schemes http
// @BasePath /api/v1
func main() {
	logger := logrus.New()
	router := gin.Default()
	conf, err := config.NewConfig(logger)
	if err != nil {
		logger.Fatalf("Error with configuration reading: %s", err)
	}

	postgresString, errPost := dsn.FromEnv()
	if errPost != nil {
		logger.Fatalf("Error of reading postgres line: %s", errPost)
	}
	fmt.Println(postgresString)
	rep, errRep := repository.NewRepository(postgresString, logger)
	if errRep != nil {
		logger.Fatalf("Error from repository: %s", err)
	}
	hand := handler.NewHandler(logger, rep, conf)
	application := api.NewApp(conf, router, logger, hand)
	application.RunApp()
}
