package model

import "time"

// Notification структура уведомления
type Notification struct {
	ID       int       `gorm:"primaryKey" json:"id"`
	Title    string    `gorm:"not null" json:"title"`
	Text     string    `gorm:"not null" json:"text"`
	Date     time.Time `gorm:"type:date" json:"date"`
	UserID   int       `gorm:"not null" json:"userID"`
	SellerID int       `gorm:"not null" json:"sellerID"`
	IsRead   bool      `gorm:"not null" json:"isRead"`
}
