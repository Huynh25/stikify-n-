/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Tran Nguyen Nam Thuan CE171497
 */
public class Comment {
    private String videoID;
    private Date dateCmt;
    private String userID;
    private String cmt;

    public Comment() {
    }

    @Override
    public String toString() {
        return "Comment{" + "videoID=" + videoID + ", dateCmt=" + dateCmt + ", userID=" + userID + ", cmt=" + cmt + '}';
    }

    public Comment(String videoID, Date dateCmt, String userID, String cmt) {
        this.videoID = videoID;
        this.dateCmt = dateCmt;
        this.userID = userID;
        this.cmt = cmt;
    }

    public String getVideoID() {
        return videoID;
    }

    public void setVideoID(String videoID) {
        this.videoID = videoID;
    }

    public Date getDateCmt() {
        return dateCmt;
    }

    public void setDateCmt(Date dateCmt) {
        this.dateCmt = dateCmt;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }
    
}
