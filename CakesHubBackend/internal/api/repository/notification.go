package repository

import (
	"CakesHubBackend/internal/api/model"
)

func (r *Repository) NotificationList(userID string) (*[]model.Notification, error) {
	var notification []model.Notification
	result := r.db.
		Where(`is_read = ? AND user_id = ?`, false, userID).
		Find(&notification)
	return &notification, result.Error
}

func (r *Repository) DeleteNotification(id string) error {
	var notification model.Notification
	if err := r.db.First(&notification, id).Error; err != nil {
		return err
	}
	notification.IsRead = true
	return r.db.Save(notification).Error
}

func (r *Repository) AddNotification(notification *model.Notification) error {
	return r.db.Create(notification).Error
}
