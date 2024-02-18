package handler

import (
	_ "CakesHubBackend/docs"
	"CakesHubBackend/internal/api/config"
	"CakesHubBackend/internal/api/repository"
	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"
	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
)

const (
	baseURL            = "api/v1"
	notification       = baseURL + "/notification/:user_id"
	addNotification    = baseURL + "/notification"
	deleteNotification = baseURL + "/notification/:id"
)

type Handler struct {
	Logger     *logrus.Logger
	Repository *repository.Repository
	Config     *config.Config
}

func NewHandler(
	l *logrus.Logger,
	r *repository.Repository,
	conf *config.Config,
) *Handler {
	return &Handler{
		Logger:     l,
		Repository: r,
		Config:     conf,
	}
}

func (h *Handler) RegisterHandler(router *gin.Engine) {
	router.GET(notification, h.NotificationList)
	router.POST(addNotification, h.AddNotification)
	router.DELETE(deleteNotification, h.DeleteNotification)
	registerStatic(router)
}

func registerStatic(router *gin.Engine) {
	router.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
}

// MARK: - ERROR RESPONSE

type errorResp struct {
	Status      string `json:"status" example:"error"`
	Description string `json:"description" example:"Описание ошибки"`
}

func (h *Handler) errorHandler(ctx *gin.Context, errorStatusCode int, err error) {
	h.Logger.Error(err.Error())

	ctx.JSON(errorStatusCode, errorResp{
		Status:      "error",
		Description: err.Error(),
	})
}
