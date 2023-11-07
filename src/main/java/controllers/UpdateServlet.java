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
import model.UserDAO;
import model.Users;
import model.Video;
import model.VideoDAO;

/**
 *
 * @author acer
 */
public class UpdateServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        request.getRequestDispatcher("Update.jsp").forward(request, response);
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
        int defaultNumber = 0; // Giá trị mặc định
        String caption = request.getParameter("caption");
        String nameOfMusic = request.getParameter("nameOfMusic");
        String urlVideo = request.getParameter("urlVideo");
        String videoType = request.getParameter("videoType");
//        VideoDAO vd = new VideoDAO();
//        UserDAO userDAO = new UserDAO();
//        Cookie[] cookies = request.getCookies();

        try {
            HttpSession session = request.getSession();
            Video video = new Video();
            VideoDAO videoNew = new VideoDAO();
            
            video.generateRandomVideoID();
            String videoID = video.getVideoID();
            UserDAO uDao = new UserDAO();
            Users userU = uDao.findUserByID((String) session.getAttribute("username"));

//            int numberView = defaultNumber;
//            int numberLike = defaultNumber;

//            video.setNumberView(numberView);
//            video.setNumberLike(numberLike);

            LocalDate localDate = LocalDate.now();
            // Chuyển đổi LocalDate thành Date với múi giờ Việt Nam
            Date date = Date.from(localDate.atStartOfDay(ZoneId.of("Asia/Ho_Chi_Minh")).toInstant());
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());

            Video vdNew = new Video(videoID, caption, nameOfMusic, urlVideo, sqlDate, defaultNumber, defaultNumber, videoType, userU);
            videoNew.create(vdNew);
            video = videoNew.findVideoByID(videoID);
            if (video != null) {
                response.sendRedirect("explore");
            } else {
                request.getRequestDispatcher("Update.jsp").forward(request, response);
            }
            
        } catch (ServletException | IOException e) {

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
