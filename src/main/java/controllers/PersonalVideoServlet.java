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
import java.util.List;
import model.UserDAO;
import model.Users;
import model.Video;
import model.VideoDAO;

/**
 *
 * @author ACER PC
 */
public class PersonalVideoServlet extends HttpServlet {

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
            out.println("<title>Servlet PersonalVideoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PersonalVideoServlet at Doooooooo " + request.getContextPath() + "</h1>");
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
//        String thisUsername = request.getParameter("Username");
//        HttpSession session = request.getSession();
//        String usernameSession = (String) session.getAttribute("username");
//
//
//        VideoDAO videoDAO = new VideoDAO();
//        UserDAO userDAO = new UserDAO();
//        List<Video> videos = videoDAO.findVideoByUser(thisUsername);
//        request.setAttribute("videos", videos);
//
//        Users thisUser = userDAO.findUserByID(thisUsername);
//        request.setAttribute("username", thisUser.getUsername());
//        request.setAttribute("fullname", thisUser.getFullName());
//        request.setAttribute("avatar", thisUser.getAvatar());
//
//        // Kiểm tra nếu thisUser bằng username, thì set một biến flag
//        boolean canInteract = thisUsername.equals(usernameSession);
//        request.setAttribute("canInteract", canInteract);
//
//        if (!canInteract) {
//            String lock = "fa-lock";
//            request.setAttribute("lock", lock);
//        }
//
//        request.getRequestDispatcher("PersonalHome.jsp").forward(request, response);
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        VideoDAO VideoDAO = new VideoDAO();
        UserDAO userDAO = new UserDAO();

        if (username != null) {
            List<Video> videos = VideoDAO.findVideoByUser(username);

            request.setAttribute("videos", videos);

            Users thisUser = userDAO.findUserByID(username);
            request.setAttribute("username", thisUser.getUsername());
            request.setAttribute("fullname", thisUser.getFullName());
            request.setAttribute("avatar", thisUser.getAvatar());

            boolean canInteract = true;
            request.setAttribute("canInteract", canInteract);

            request.getRequestDispatcher("PersonalHome.jsp").forward(request, response);

        }
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
        // Lấy danh sách cookie từ request
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        VideoDAO VideoDAO = new VideoDAO();
        UserDAO userDAO = new UserDAO();

        if (username != null) {
            List<Video> videos = VideoDAO.findVideoByUser(username);

            request.setAttribute("videos", videos);

            Users thisUser = userDAO.findUserByID(username);
            request.setAttribute("username", thisUser.getUsername());
            request.setAttribute("fullname", thisUser.getFullName());
            request.setAttribute("avatar", thisUser.getAvatar());

            boolean canInteract = true;
            request.setAttribute("canInteract", canInteract);

            request.getRequestDispatcher("PersonalHome.jsp").forward(request, response);

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
