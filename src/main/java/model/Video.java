/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.Random;

/**
 *
 * @author Tran Nguyen Nam Thuan CE171497
 */
public class Video {

    private String videoID;
    private String caption;
    private String nameOfMusic;
    private String urlVideo;
    private Date dateUpload;
    private int numberView;
    private int numberLike;
    private String videoType;
    private Users user;

    @Override
    public String toString() {
        return "Video{" + "videoID=" + videoID + ", caption=" + caption + ", nameOfMusic=" + nameOfMusic + ", urlVideo=" + urlVideo + ", dateUpload=" + dateUpload + ", numberView=" + numberView + ", numberLike=" + numberLike + ", videoType=" + videoType + ", user=" + user + '}';
    }

    public Video() {
    }

    public Video(String videoID, String caption, String nameOfMusic, String urlVideo, Date dateUpload, int numberView, int numberLike, String videoType, Users user) {
        this.videoID = videoID;
        this.caption = caption;
        this.nameOfMusic = nameOfMusic;
        this.urlVideo = urlVideo;
        this.dateUpload = dateUpload;
        this.numberView = numberView;
        this.numberLike = numberLike;
        this.videoType = videoType;
        this.user = user;
    }

    public String getVideoID() {
        return videoID;
    }

    public void setVideoID(String videoID) {
        this.videoID = videoID;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public String getNameOfMusic() {
        return nameOfMusic;
    }

    public void setNameOfMusic(String nameOfMusic) {
        this.nameOfMusic = nameOfMusic;
    }

    public String getUrlVideo() {
        return urlVideo;
    }

    public void setUrlVideo(String urlVideo) {
        this.urlVideo = urlVideo;
    }

    public Date getDateUpload() {
        return dateUpload;
    }

    public void setDateUpload(Date dateUpload) {
        this.dateUpload = dateUpload;
    }

    public int getNumberView() {
        return numberView;
    }

    public void setNumberView(int numberView) {
        this.numberView = numberView;
    }

    public int getNumberLike() {
        return numberLike;
    }

    public void setNumberLike(int numberLike) {
        this.numberLike = numberLike;
    }

    public String getVideoType() {
        return videoType;
    }

    public void setVideoType(String videoType) {
        this.videoType = videoType;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }
    
    public void generateRandomVideoID() {
        Random random = new Random();
        int randomNumber = random.nextInt(999999) + 1;
        this.videoID = "vid" + String.format("%06d", randomNumber);
    }

}
