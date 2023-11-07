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
import model.CommentDAO;
import model.Video;
import model.VideoDAO;

/**
 *
 * @author Tran Nguyen Nam Thuan CE171497
 */
public class TrendingServlet extends HttpServlet {

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
            out.println("<title>Servlet TrendingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TrendingServlet at " + request.getContextPath() + "</h1>");
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
        VideoDAO vd = new VideoDAO();
        HttpSession session1 = request.getSession();
        int numberCurrentColumn=0;
        if(request.getParameter("videolength").equals("0")){
            session1.setAttribute("numberCurrentColumn", 0);
        }
        CommentDAO cd= new CommentDAO();
        if(session1.getAttribute("numberCurrentColumn")!=null){
            numberCurrentColumn= (int) session1.getAttribute("numberCurrentColumn");
        }
            session1.setAttribute("numberCurrentColumn", numberCurrentColumn+8);
        List<Video> listVideo = vd.readSome(numberCurrentColumn);
        String jsonArray = "[";
        for (int i = 0; i < listVideo.size(); i++) {            
            Video video = listVideo.get(i);
            jsonArray += "{\"videoID\":\"" + video.getVideoID()
                     + "\",\"caption\":\"" + video.getCaption()
                     + "\",\"nameOfMusic\":\"" + video.getNameOfMusic()
                     + "\",\"urlVideo\":\"" + video.getUrlVideo()
                     + "\",\"dateUpload\":\"" + video.getDateUpload()
                     + "\",\"numberView\":\"" + video.getNumberView()
                    + "\",\"numberLike\":\"" + video.getNumberLike()
                     + "\",\"videoType\":\"" + video.getVideoType()
                     + "\",\"username\":\"" + video.getUser().getUsername()
                     + "\",\"fullname\":\"" + video.getUser().getFullName()
                     + "\",\"avatar\":\"" + video.getUser().getAvatar()
                    + "\",\"numberOfComment\":\"" +  cd.readAllByVideoID(video.getVideoID()).size()
                     + "\"}";
            if (i < listVideo.size() - 1) {
                jsonArray += ",";
            }
        }
        jsonArray += "]";
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonArray);
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
      HttpSession session = request.getSession();
      session.removeAttribute("numberCurrentColumn");
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
