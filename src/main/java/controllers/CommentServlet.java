/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import model.Comment;
import model.CommentDAO;
import model.UserDAO;
import model.Users;
import model.Video;
import model.VideoDAO;

/**
 *
 * @author Tran Nguyen Nam Thuan CE171497
 */
public class CommentServlet extends HttpServlet {

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
            out.println("<title>Servlet CommentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CommentServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        int numberCurrentColumn = 8;
        if (session.getAttribute("numberCurrentColumn") != null) {
            numberCurrentColumn = (int) session.getAttribute("numberCurrentColumn");
        }
        String videoID = request.getParameter("videoID");
        VideoDAO vd = new VideoDAO();
        List<Video> listVideo = vd.readAllByNum(numberCurrentColumn);
        Video video = vd.findByID(videoID);
        request.setAttribute("video", video);
        request.setAttribute("listVideo", listVideo);
        String display = "block";
        if (video.getVideoID().equals(listVideo.get(0).getVideoID())) {
            display = "none";
        }
        request.setAttribute("display", display);
        request.getRequestDispatcher("Comment.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        String currentVideoID = request.getParameter("currentVideoID");
        String add_comment = request.getParameter("add_comment");
        if (add_comment == null) {
            CommentDAO cd = new CommentDAO();
            UserDAO ud = new UserDAO();
            List<Comment> listComment = cd.readAllByVideoID(currentVideoID);
            String jsonArray = "[";
            for (int i = 0; i < listComment.size(); i++) {
                Comment comment = listComment.get(i);
                Users user = ud.findByID(comment.getUserID());
                jsonArray += "{\"videoID\":\"" + comment.getVideoID()
                        + "\",\"dateCmt\":\"" + comment.getDateCmt()
                        + "\",\"userID\":\"" + comment.getUserID()
                        + "\",\"cmt\":\"" + comment.getCmt()
                        + "\",\"username\":\"" + user.getUsername()
                        + "\",\"password\":\"" + user.getPassword()
                        + "\",\"email\":\"" + user.getEmail()
                        + "\",\"fullName\":\"" + user.getFullName()
                        + "\",\"gender\":\"" + user.getGender()
                        + "\",\"address\":\"" + user.getAddress()
                        + "\",\"avatar\":\"" + user.getAvatar()
                        + "\"}";
                if (i < listComment.size() - 1) {
                    jsonArray += ",";
                }
            }
            jsonArray += "]";
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray);
        } else {
            CommentDAO cm = new CommentDAO();
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            LocalDate localDate = LocalDate.now();
            // Chuyển đổi LocalDate thành Date với múi giờ Việt Nam
            Date date = Date.from(localDate.atStartOfDay(ZoneId.of("Asia/Ho_Chi_Minh")).toInstant());
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            Comment cmt = new Comment(currentVideoID, sqlDate, username, add_comment);
            cm.create(cmt);
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
