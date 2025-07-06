/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CommentDAO;
import models.Account;
import dto.CommentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminEditComment", urlPatterns = {"/AdminEditComment"})
public class AdminEditComment extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminEditComment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminEditComment at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        Account taiKhoan = (Account) session.getAttribute("taiKhoan");

        if (taiKhoan != null && taiKhoan.getRole_id() == 0) { // Kiểm tra admin
            String typeRaw = request.getParameter("type");
            String commentIdRaw = request.getParameter("id");

            // Xử lý xóa comment
            if (typeRaw != null && commentIdRaw != null) {
                int type = Integer.parseInt(typeRaw);
                int commentId = Integer.parseInt(commentIdRaw);
                if (type == 1) {
                    CommentDAO.getInstance().deleteComment(commentId);
                }
            }

            // Lấy bình luận để hiển thị cho người dùng
            if (commentIdRaw != null) {
                int commentId = Integer.parseInt(commentIdRaw);
                CommentDTO comment = CommentDAO.getInstance().getCommentById(commentId);
                request.setAttribute("comment", comment);
            }

            // Lấy tất cả các bình luận
            List<CommentDTO> comments = CommentDAO.getInstance().getAllComments();
            request.setAttribute("comments", comments);

            request.getRequestDispatcher("Views/admineditcomment.jsp").forward(request, response);
        } else {
            response.sendRedirect("Home");
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
        int commentId = Integer.parseInt(request.getParameter("comment_id"));
        String content = request.getParameter("comment");

        CommentDAO.getInstance().updateComment(commentId, content);

        // Sau khi cập nhật, chuyển hướng lại đến trang quản lý bình luận
        response.sendRedirect("AdminEditComment");
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
