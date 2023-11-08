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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.List;
import model.UserDAO;
import model.Users;

/**
 *
 * @author HuynhLNCE171797
 */
public class editProfile extends HttpServlet {

    private Users userEdit;

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
            out.println("<title>Servlet editProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editProfile at " + request.getContextPath() + "</h1>");
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
        //String thisUsername = request.getParameter("Username");
        HttpSession session = request.getSession();
        String currentUser = (String) session.getAttribute("username");

        UserDAO userDAO = new UserDAO();
        userEdit = userDAO.findUserByID(currentUser);
//        request.setAttribute("userEdit", userEdit);
//
//        Users thisUser = userDAO.findUserByID(thisUsername);
//        request.setAttribute("username", thisUser.getUsername());
//        request.setAttribute("fullname", thisUser.getFullName());
//        request.setAttribute("avatar", thisUser.getAvatar());
//        request.setAttribute("password", thisUser.getPassword());
//        request.setAttribute("email", thisUser.getEmail());
//        request.setAttribute("gender", thisUser.getGender());
//        request.setAttribute("Birthdate", thisUser.getBirthDate());
//        request.setAttribute("address", thisUser.getAddress());

        request.getRequestDispatcher("editProfile.jsp").forward(request, response);
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
//        processRequest(request, response);
        String action = request.getParameter("action");
        UserDAO uDAO = new UserDAO();
        switch (action) {
            case "changePass":
                String newPass = request.getParameter("newPass");
                if (uDAO.changePass(userEdit.getUsername(), getMD5Hash(newPass))) {
                    response.sendRedirect("PersonalVideoServlet");
                } else {
                    request.setAttribute("error", "Cannot change your password");
                }
                break;
            case "changeEmail":
                String newEmail = request.getParameter("newEmail");
                if (uDAO.changePass(userEdit.getUsername(), newEmail)) {
                    response.sendRedirect("PersonalVideoServlet");
                } else {
                    request.setAttribute("error", "Cannot change your Email");
                }
                break;
            default:
                String fullname = request.getParameter("fullname");
                String gender = request.getParameter("gender");
                String avt = request.getParameter("avt");
                Date birth = Date.valueOf(request.getParameter("birth"));
                String address = request.getParameter("address");
                userEdit.setFullName(fullname);
                userEdit.setGender(gender);
                userEdit.setAvatar(avt);
                userEdit.setBirthDate(birth);
                userEdit.setAddress(address);

                UserDAO editP = new UserDAO();
                boolean OK = editP.updateProfile(userEdit);
                if (OK) {
                    response.sendRedirect("PersonalVideoServlet");
                } else {
                    request.getRequestDispatcher("editProfile.jsp").forward(request, response);
                }
                break;
        }

    }

    public static String getMD5Hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array to a string representation
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                String hex = Integer.toHexString(0xFF & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
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
