/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.FavoriteVideo;
import model.FavoriteVideoDAO;
import model.UserDAO;
import model.Users;
import model.Video;
import model.VideoDAO;
//import org.json.JSONObject;

/**
 *
 * @author ACER PC
 */
public class LikeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LikeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LikeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FavoriteVideoDAO favoriteVideoDAO = new FavoriteVideoDAO();
        UserDAO userDAO = new UserDAO();
        VideoDAO videoDAO = new VideoDAO();

        String videoID = request.getParameter("videoID");
        Video thisVideo = videoDAO.findVideoByID(videoID);

        Cookie[] cookies = request.getCookies();

        String username = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                // Kiểm tra nếu tên cookie là "Username"
                if (cookie.getName().equals("Username")) {
                    username = cookie.getValue();
                    break; // Tìm thấy username, thoát khỏi vòng lặp
                }
            }
        }

        Users thisUser = userDAO.findUserByID(username);
        FavoriteVideo favoriteVideo = new FavoriteVideo(thisUser, thisVideo);
        boolean isliked = favoriteVideoDAO.isVideoLikedByUser(username, videoID);

        System.out.println(isliked);

        String action = request.getParameter("action");

        if (videoID != null && action != null) {
//            if (action.equals("like")) {
//                favoriteVideoDAO.create(favoriteVideo);
//            } else if (action.equals("unlike") || islike) {
//                favoriteVideoDAO.deleteByFavoriteVideo(favoriteVideo);
//            }

            if (action.equals("unlike") || isliked) {
                favoriteVideoDAO.deleteByFavoriteVideo(favoriteVideo);

            } else if (action.equals("like")) {
                favoriteVideoDAO.create(favoriteVideo);
            }

            // Kiểm tra xem video đã được thích hay chưa
//        boolean isLiked = favoriteVideoDAO.isVideoLikedByUser(username, videoID);
//            JSONObject jsonResponse = new JSONObject();
//            jsonResponse.put("isLiked", !isliked);  // Đảo ngược trạng thái "like" và "unlike"
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write(jsonResponse.toString());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
