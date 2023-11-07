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
public class CommentDAO extends AbstractDAO<Comment>{

    @Override
    public List<Comment> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public List<Comment> readAllByVideoID(String videoID){
        List<Comment> comments = new ArrayList<>();
        try {

            String sql = "Select * from [dbo].[COMMENT]"
                    + "where VideoID = \'"+videoID+"\'";
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                Comment comment = new Comment();
                comment.setVideoID(rs.getString("VideoID"));
                comment.setDateCmt(rs.getDate("DateCmt"));
                comment.setUserID(rs.getString("UserID"));
                comment.setCmt(rs.getString("Cmt"));
                comments.add(comment);
            }

        } catch (SQLException ex) {
        }
        return comments;
    }
    @Override
    public void create(Comment c) {
         String sql = "INSERT INTO [dbo].[COMMENT]\n"
                + "           ([VideoID]\n"
                + "           ,[DateCmt]\n"
                + "           ,[UserID]\n"
                + "           ,[Cmt])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)\n";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, c.getVideoID());
            ps.setDate(2, c.getDateCmt());
            ps.setString(3, c.getUserID());
            ps.setString(4, c.getCmt());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    public void update(Comment object) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Comment findByID(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
