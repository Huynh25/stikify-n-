/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.HashMap;
import java.util.ArrayList;

/**
 *
 * @author Assin
 */
public class Follow {

    private HashMap<String, ArrayList<String>> follower;
    private HashMap<String, ArrayList<String>> following;

    public HashMap<String, ArrayList<String>> getFollower() {
        return follower;
    }

    public void setFollower(HashMap<String, ArrayList<String>> follower) {
        this.follower = follower;
    }

    public HashMap<String, ArrayList<String>> getFollowing() {
        return following;
    }

    public void setFollowing(HashMap<String, ArrayList<String>> following) {
        this.following = following;
    }

}
