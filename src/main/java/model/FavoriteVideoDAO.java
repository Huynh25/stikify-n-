/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ACER PC
 */
public class FavoriteVideoDAO extends AbstractDAO<FavoriteVideo>{

    @Override
    public List<FavoriteVideo> readAll() {
        UserDAO userDAO = new UserDAO();
        VideoDAO videoDAO = new VideoDAO();
        List<FavoriteVideo> favoriteVideos = new ArrayList<>();
        String query = "SELECT * FROM [FAVOURITE_VIDEO]";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                FavoriteVideo favoriteVideo = new FavoriteVideo();
                // Lấy thông tin về username và video từ ResultSet
                Users user = userDAO.findUserByID(resultSet.getString("UserID"));
                user.setUsername(resultSet.getString("UserID")); // Tên cột trong bảng [FAVOURITE_VIDEO]
                favoriteVideo.setUser(user);

                Video video = videoDAO.findVideoByID(resultSet.getString("VideoID"));
                video.setVideoID(resultSet.getString("VideoID")); // Tên cột trong bảng [FAVOURITE_VIDEO]
                favoriteVideo.setVideo(video);

                favoriteVideos.add(favoriteVideo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return favoriteVideos;
    }

    public void create(FavoriteVideo favoriteVideo) {
        String query = "INSERT INTO [FAVOURITE_VIDEO] ([UserID], [VideoID]) VALUES (?, ?)";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, favoriteVideo.getUser().getUsername());
            preparedStatement.setString(2, favoriteVideo.getVideo().getVideoID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(String username, String videoID) {
        String query = "DELETE FROM [FAVOURITE_VIDEO] WHERE Username = ? AND VideoID = ?";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, videoID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    public void update(FavoriteVideo object) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public FavoriteVideo findByID(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public void deleteByFavoriteVideo(FavoriteVideo favoriteVideo) {
    String query = "DELETE FROM [FAVOURITE_VIDEO] WHERE [UserID] = ? AND [VideoID] = ?";
    try {
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setString(1, favoriteVideo.getUser().getUsername());
        preparedStatement.setString(2, favoriteVideo.getVideo().getVideoID());
        preparedStatement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    public boolean isVideoLikedByUser(String username, String videoID) {
    String query = "SELECT * FROM [FAVOURITE_VIDEO] WHERE [UserID] = ? AND [VideoID] = ?";
    try {
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, videoID);
        ResultSet resultSet = preparedStatement.executeQuery();

        // Nếu có dòng dữ liệu trả về, tức là video đã được người dùng thích
        return resultSet.next();
    } catch (SQLException e) {
        e.printStackTrace();
        return false; // Xảy ra lỗi, trả về false (video không được thích)
    }
}
    
    public List<Video> getVideosLikedByUser(String username) {
    VideoDAO vDAO = new VideoDAO();
    List<Video> likedVideos = new ArrayList<>();
    String query = "SELECT [VideoID] FROM [FAVOURITE_VIDEO] WHERE [UserID] = ?";
    
    try {
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setString(1, username);
        ResultSet resultSet = preparedStatement.executeQuery();
        
        while (resultSet.next()) {
            String videoID = resultSet.getString("VideoID");
            Video video = vDAO.findVideoByID(videoID); // Assuming you have a VideoDAO
            if (video != null) {
                likedVideos.add(video);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return likedVideos;
}
    public int calculateTotalLikesForUserVideos(String username) {
    List<FavoriteVideo> FavoriteVideos = readAll();
    int totalLikes = 0;

    for (FavoriteVideo favoriteVideo : FavoriteVideos) {
        // Kiểm tra xem video này thuộc người dùng hiện tại
        if (favoriteVideo.getVideo().getUser().getUsername().equals(username)) {
            totalLikes++;
        }
    }

    return totalLikes;
}
    
    public int calculateTotalEachVideo(String videoID) {
    List<FavoriteVideo> FavoriteVideos = readAll();
    int totalLikes = 0;

    for (FavoriteVideo favoriteVideo : FavoriteVideos) {
        // Kiểm tra xem video này thuộc người dùng hiện tại
        if (favoriteVideo.getVideo().getVideoID().equals(videoID)) {
            totalLikes++;
        }
    }

    return totalLikes;
}
    
    public static void main(String[] args) {
        FavoriteVideoDAO fDAO = new FavoriteVideoDAO();
        UserDAO uDAO = new UserDAO();
        VideoDAO vDAO = new VideoDAO();
        Users user = uDAO.findUserByID("giahuy");
        System.out.println(user.toString());
        Video video = vDAO.findVideoByID("vid1");
        FavoriteVideo fVideo = new FavoriteVideo(user, video);
        fDAO.create(fVideo);
        List<FavoriteVideo> list = fDAO.readAll();
        for (FavoriteVideo favoriteVideo : list) {
            System.out.println(favoriteVideo.getVideo().getUser().getUsername());
        }
        System.out.println(fDAO.calculateTotalLikesForUserVideos("nhuhuynh"));

       
    }
}
