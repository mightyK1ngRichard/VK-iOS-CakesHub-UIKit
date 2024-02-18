package handler

import (
	"CakesHubBackend/internal/api/model"
	"CakesHubBackend/internal/api/repository"
	"encoding/json"
	"errors"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
	"net/http"
	"time"
)

var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}
var clients []websocket.Conn

func (h *Handler) NotificationList(ctx *gin.Context) {
	userID := ctx.Param("user_id")
	if userID == "" {
		h.errorHandler(ctx, http.StatusBadRequest, errors.New(`param 'user_id' cannot be empty`))
		return
	}
	conn, err := upgrader.Upgrade(ctx.Writer, ctx.Request, nil)
	if err != nil {
		h.Logger.Errorf("failed to upgrade to WebSocket: %s", err)
		ctx.JSON(http.StatusInternalServerError, gin.H{"error": fmt.Sprintf("failed to upgrade to WebSocket: %s", err)})
		return
	}
	defer func(conn *websocket.Conn) {
		_ = conn.Close()
	}(conn)

	for {
		if err := sendInitialNotifications(conn, h.Repository, userID); err != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{
				"error": fmt.Sprintf("failed to send initial notifications: %s", err),
			})
			return
		}
		time.Sleep(time.Second)
	}
}

// sendInitialNotifications отправляет начальные уведомления при подключении клиента.
func sendInitialNotifications(conn *websocket.Conn, repository *repository.Repository, userID string) error {

	notifications, err := repository.NotificationList(userID)
	if err != nil {
		return fmt.Errorf("failed to retrieve initial notifications: %s", err)
	}

	binaryData, err := json.Marshal(gin.H{
		"count":         len(*notifications),
		"notifications": notifications,
	})
	if err != nil {
		return fmt.Errorf("failed to marshal notifications to binary: %s", err)
	}

	err = conn.WriteMessage(websocket.BinaryMessage, binaryData)
	if err != nil {
		return fmt.Errorf("failed to send initial notifications: %s", err)
	}

	return nil
}

// DeleteNotification godoc
// @Summary Удаление уведомления
// @Description Меняем статус уведомления на прочитано
// @Tags Уведомления
// @Accept json
// @Produce json
// @Param id path int true "ID уведомления"
// @Success 200 {object} model.DeleteNotificationRes "Уведомление прочитано"
// @Failure 400 {object} errorResp "Неверный запрос"
// @Failure 500 {object} errorResp "Внутренняя ошибка сервера"
// @Router /notification/{id} [delete]
func (h *Handler) DeleteNotification(ctx *gin.Context) {
	id := ctx.Param("id")
	if id == "" {
		h.errorHandler(ctx, http.StatusBadRequest, errors.New(`param 'id' cannot be empty`))
		return
	}
	if err := h.Repository.DeleteNotification(id); err != nil {
		h.errorHandler(ctx, http.StatusBadRequest, err)
		return
	}
	ctx.JSON(http.StatusOK, gin.H{"status": "success"})
}

// AddNotification godoc
// @Summary Добавление уведомления
// @Description Добавляет новое уведомление.
// @Tags Уведомления
// @Accept json
// @Produce json
// @Param notification body model.AddNotificationReq true "Информация об уведомлении"
// @Success 200 {object} model.AddNotificationRes "Уведомление успешно добавлено"
// @Failure 400 {object} errorResp "Неверный запрос. Проверьте корректность данных уведомления."
// @Failure 500 {object} errorResp "Внутренняя ошибка сервера"
// @Router /notification [post]
func (h *Handler) AddNotification(ctx *gin.Context) {
	var notification model.Notification
	if err := ctx.BindJSON(&notification); err != nil {
		h.errorHandler(ctx, http.StatusBadRequest, err)
		return
	}
	if notification.ID != 0 {
		h.errorHandler(ctx, http.StatusBadRequest, errors.New(`param id must be empty`))
		return
	}
	notification.Date = time.Now()
	if err := h.Repository.AddNotification(&notification); err != nil {
		h.errorHandler(ctx, http.StatusInternalServerError, err)
		return
	}

	ctx.JSON(http.StatusOK, model.AddNotificationRes{
		Status: "success",
		ID:     notification.ID,
	})
}
