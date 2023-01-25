// package main

// import (
// 	"github.com/gin-gonic/gin"
// )

// func main() {
// 	r := gin.Default()
// 	r.LoadHTMLGlob("templates/*")
// 	r.GET("/", func(c *gin.Context) {
// 		c.HTML(200, "girl_profile.tmpl", gin.H{
// 			"name":     "Sophia",
// 			"age":      "23",
// 			"location": "Los Angeles",
// 			"photos":   []string{"girl1.jpg", "girl2.jpg", "girl3.jpg"},
// 		})
// 	})
// 	r.Run()
// }
