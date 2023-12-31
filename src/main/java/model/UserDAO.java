/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Tran Nguyen Nam Thuan CE171497
 */
public class UserDAO extends AbstractDAO<Users> {

    @Override
    public List<Users> readAll() {
        List<Users> users = new ArrayList<>();
        try {
            String sql = "Select * from [dbo].[USERS]";
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                Users user = new Users();
                user.setUsername(rs.getString("UserName"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("Email"));
                user.setFullName(rs.getString("Fullname"));
                user.setGender(rs.getString("Gender"));
                user.setBirthDate(rs.getDate("Birthdate"));
                user.setAddress(rs.getString("Address"));
                user.setAvatar(rs.getString("Avatar"));
                users.add(user);
            }
        } catch (SQLException ex) {
        }
        return users;
    }

    @Override
    public void create(Users object) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void update(Users edit) {

    }

    @Override
    public void delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Users findByID(String id) {
        try {

            String sql = "Select * from [dbo].[USERS]"
                    + "where UserName =\'" + id + "\'";
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            if (rs.next()) {
                Users user = new Users();
                user.setUsername(rs.getString("UserName"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("Email"));
                user.setFullName(rs.getString("Fullname"));
                user.setGender(rs.getString("Gender"));
                user.setBirthDate(rs.getDate("Birthdate"));
                user.setAddress(rs.getString("Address"));
                user.setAvatar(rs.getString("Avatar"));
                return user;
            }

        } catch (SQLException ex) {
        }
        return null;
    }

    public Users findUserByID(String id) {
        try {

            String sql = "Select * from [dbo].[USERS]"
                    + "where UserName =\'" + id + "\'";
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            if (rs.next()) {
                Users user = new Users();
                user.setUsername(rs.getString("UserName"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("Email"));
                user.setFullName(rs.getString("Fullname"));
                user.setGender(rs.getString("Gender"));
                user.setBirthDate(rs.getDate("Birthdate"));
                user.setAddress(rs.getString("Address"));
                user.setAvatar(rs.getString("Avatar"));
                return user;
            }

        } catch (SQLException ex) {
        }
        return null;
    }

    public boolean updateProfile(Users u) {
        try {
            PreparedStatement ps = con.prepareStatement("exec update_user ?,?,?,?,?,?,?,?");
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setNString(4, u.getFullName());
            ps.setNString(5, u.getGender());
            ps.setDate(6, u.getBirthDate());
            ps.setNString(7, u.getAddress());
            ps.setNString(8, u.getAvatar());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    public boolean deleteAccount(String id) {
        try {
            PreparedStatement ps = con.prepareStatement("delete from users where username=?");
            ps.setString(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return false;
    }

    public Users login(String username, String pass) {
        Users user;
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("exec login " + username + "," + pass);

            if (rs.next()) {
                user = new Users();
                user.setUsername(rs.getString("UserName"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("Email"));
                user.setFullName(rs.getString("Fullname"));
                user.setGender(rs.getString("Gender"));
                user.setBirthDate(rs.getDate("Birthdate"));
                user.setAddress(rs.getString("Address"));
                user.setAvatar(rs.getString("Avatar"));
                return user;
            }

        } catch (SQLException ex) {
        }
        return null;
    }

    public boolean changePass(String user, String newPass) {
        try {
            PreparedStatement ps = con.prepareStatement("update users set password=? where username=?");
            ps.setString(1, newPass);
            ps.setString(2, user);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    public boolean changeEmail(String user, String newEmail) {
        try {
            PreparedStatement ps = con.prepareStatement("update users set email=? where username=?");
            ps.setString(1, newEmail);
            ps.setString(2, user);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(new UserDAO().findUserByID("nhuhuynh"));
    }
}
