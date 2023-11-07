/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Tran Nguyen Nam Thuan CE171497
 */
public class VideoDAO extends AbstractDAO<Video> {

    @Override
    public List<Video> readAll() {
        List<Video> videos = new ArrayList<>();
        try {

            String sql = "Select * from [dbo].[VIDEO]";
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                Video video = new Video();
                video.setVideoID(rs.getString("VideoID"));
                video.setCaption(rs.getString("Caption"));
                video.setNameOfMusic(rs.getString("NameOfMusic"));
                video.setUrlVideo(rs.getString("UrlVideo"));
                video.setDateUpload(rs.getDate("DateUpload"));
                video.setNumberView(rs.getInt("NumberView"));
                video.setNumberLike(rs.getInt("NumberLike"));
                video.setVideoType(rs.getString("VideoType"));
                UserDAO ud = new UserDAO();
                video.setUser(ud.findByID(rs.getString("UserID")));
                videos.add(video);
            }

        } catch (SQLException ex) {
        }
        return videos;
    }

    public List<Video> findVideoByUser(String username) {
        List<Video> videos = new ArrayList<>();
        try {
            String sql = "SELECT * FROM video WHERE userID = ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Video video = new Video();
                video.setVideoID(rs.getString("VideoID"));
                video.setCaption(rs.getString("Caption"));
                video.setNameOfMusic(rs.getString("NameOfMusic"));
                video.setUrlVideo(rs.getString("UrlVideo"));
                video.setDateUpload(rs.getDate("DateUpload"));
                video.setNumberView(rs.getInt("NumberView"));
                video.setNumberLike(rs.getInt("NumberLike"));
                video.setVideoType(rs.getString("VideoType"));
                UserDAO userDAO = new UserDAO();

                String videoUsername = rs.getString("UserID");
                Users user = userDAO.findUserByID(videoUsername);
                video.setUser(user);

                videos.add(video);
            }
        } catch (SQLException ex) {

        }

        return videos;
    }

    public List<Video> readAllByNum(int number) {
        List<Video> videos = new ArrayList<>();
        try {

            String sql = "Select TOP (" + number + ") * from [dbo].[VIDEO]";
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                Video video = new Video();
                video.setVideoID(rs.getString("VideoID"));
                video.setCaption(rs.getString("Caption"));
                video.setNameOfMusic(rs.getString("NameOfMusic"));
                video.setUrlVideo(rs.getString("UrlVideo"));
                video.setDateUpload(rs.getDate("DateUpload"));
                video.setNumberView(rs.getInt("NumberView"));
                video.setNumberLike(rs.getInt("NumberLike"));
                video.setVideoType(rs.getString("VideoType"));
                UserDAO ud = new UserDAO();
                video.setUser(ud.findByID(rs.getString("UserID")));
                videos.add(video);
            }

        } catch (SQLException ex) {
        }
        return videos;
    }

    public List<Video> readSome(int number) {
        List<Video> videos = new ArrayList<>();
        try {
            String sql = "";
            if (number != 0) {
                sql = "Select TOP (" + 8 + ") * from [dbo].[VIDEO]"
                        + "where VideoID not in (Select TOP (" + number + ") VideoID from [dbo].[VIDEO])";
            } else {
                sql = "Select TOP (8) * from [dbo].[VIDEO]";
            }
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                Video video = new Video();
                video.setVideoID(rs.getString("VideoID"));
                video.setCaption(rs.getString("Caption"));
                video.setNameOfMusic(rs.getString("NameOfMusic"));
                video.setUrlVideo(rs.getString("UrlVideo"));
                video.setDateUpload(rs.getDate("DateUpload"));
                video.setNumberView(rs.getInt("NumberView"));
                video.setNumberLike(rs.getInt("NumberLike"));
                video.setVideoType(rs.getString("VideoType"));
                UserDAO ud = new UserDAO();
                video.setUser(ud.findByID(rs.getString("UserID")));
                videos.add(video);
            }

        } catch (SQLException ex) {
        }
        return videos;
    }

    public Video findVideoByID(String videoID) {
        String query = "SELECT * FROM VIDEO WHERE VideoID = ?";
        Video video = null;

        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, videoID);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                video = new Video();
                video.setVideoID(resultSet.getString("VideoID"));
                video.setCaption(resultSet.getString("Caption"));
                video.setNameOfMusic(resultSet.getString("NameOfMusic"));
                video.setUrlVideo(resultSet.getString("UrlVideo"));
                video.setDateUpload(resultSet.getDate("DateUpload"));
                video.setNumberView(resultSet.getInt("NumberView"));
                video.setNumberLike(resultSet.getInt("NumberLike"));
                video.setVideoType(resultSet.getString("VideoType"));
                // Lấy thông tin người dùng (Users) liên quan đến video
                UserDAO usersDAO = new UserDAO();
                Users user = usersDAO.findByID(resultSet.getString("UserID"));
                video.setUser(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return video;
    }

    @Override
    public void create(Video v) {
        String sql = "INSERT INTO VIDEO VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, v.getVideoID());
            ps.setNString(2, v.getCaption());
            ps.setNString(3, v.getNameOfMusic());
            ps.setNString(4,"Videos/" + v.getUrlVideo());
            ps.setDate(5, v.getDateUpload());
            ps.setInt(6, v.getNumberView());
            ps.setInt(7, v.getNumberLike());
            ps.setNString(8, v.getVideoType());
            ps.setString(9, v.getUser().getUsername());
            ps.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void update(Video object) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(String id) {
        try {
            String sql = "";
        } catch (Exception e) {
        }
    }

    @Override
    public Video findByID(String id) {
        try {

            String sql = "Select * from [dbo].[VIDEO]"
                    + "where VideoID = \'" + id + "\'";
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            if (rs.next()) {
                Video video = new Video();
                video.setVideoID(rs.getString("VideoID"));
                video.setCaption(rs.getString("Caption"));
                video.setNameOfMusic(rs.getString("NameOfMusic"));
                video.setUrlVideo(rs.getString("UrlVideo"));
                video.setDateUpload(rs.getDate("DateUpload"));
                video.setNumberView(rs.getInt("NumberView"));
                video.setNumberLike(rs.getInt("NumberLike"));
                video.setVideoType(rs.getString("VideoType"));
                UserDAO ud = new UserDAO();
                video.setUser(ud.findByID(rs.getString("UserID")));
                return video;
            }

        } catch (SQLException ex) {
        }
        return null;
    }

    public static void main(String[] args) {
        VideoDAO v = new VideoDAO();
        UserDAO u = new UserDAO();
            LocalDate localDate = LocalDate.now();
            // Chuyển đổi LocalDate thành Date với múi giờ Việt Nam
            java.util.Date date = java.util.Date.from(localDate.atStartOfDay(ZoneId.of("Asia/Ho_Chi_Minh")).toInstant());
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            v.create(new Video("test", "tet", "tst", "tst", sqlDate, 0, 0, "sd", u.findByID("nhuhuynh")));
            System.out.println(v.findVideoByID("test"));
    }
}
