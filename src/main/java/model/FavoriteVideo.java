/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER PC
 */
public class FavoriteVideo {
    private Users user;
    private Video video;

    public FavoriteVideo() {
    }

    public FavoriteVideo(Users username, Video video) {
        this.user = username;
        this.video = video;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }
    
    
}
