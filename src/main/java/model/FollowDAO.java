/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Assin
 */
public class FollowDAO extends AbstractDAO<Follow> {

    @Override
    public List<Follow> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void create(Follow object) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

   
    public void update(Follow object) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Follow findByID(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean unFollow(String follower, String following) {
        try {
            PreparedStatement ps = con.prepareStatement("delete from following where following = ? and username=?");
            ps.setString(1, following);
            ps.setString(2, follower);

            PreparedStatement ps2 = con.prepareStatement("delete from follower where follower=? and username=?");
            ps2.setString(1, follower);
            ps2.setString(2, following);

            return ps.executeUpdate() > 0 && ps2.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    public Follow read(String username) {
        Follow fl = new Follow();
        try {
            PreparedStatement ps = con.prepareStatement("select * from folloing a and  follower b where a.username = b.username having username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            HashMap<String, ArrayList<String>> flwing = new HashMap<>();
            flwing.put(username, new ArrayList<String>());
            HashMap<String, ArrayList<String>> flwer = new HashMap<>();
            flwer.put(username, new ArrayList<String>());
            while (rs.next()) {
                flwing.get(username).add(rs.getString("Following"));
                flwer.get(username).add(rs.getString("Follower"));
            }
            fl.setFollower(flwer);
            fl.setFollowing(flwing);
        } catch (SQLException e) {
        }
        return fl;
    }

    public boolean create(String follower, String following) {
        try {
            PreparedStatement ps = con.prepareStatement("insert into follower values(?,?);");
            ps.setString(1, follower);
            ps.setString(2, following);

            PreparedStatement ps2 = con.prepareStatement("insert into following values(?,?);");
            ps2.setString(1, following);
            ps2.setString(2, follower);

            return ps.executeUpdate() > 0 && ps2.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }
}
