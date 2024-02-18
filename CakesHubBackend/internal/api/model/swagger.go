package model

type DeleteNotificationRes struct {
	Status string `json:"status"`
}

type AddNotificationRes struct {
	Status string `json:"status"`
	ID     int    `json:"id"`
}

type AddNotificationReq struct {
	Title    string `gorm:"not null" json:"title" example:"Заголовок"`
	Text     string `gorm:"not null" json:"text" example:"Текст"`
	UserID   int    `gorm:"not null" json:"userID"`
	SellerID int    `gorm:"not null" json:"sellerID"`
}
