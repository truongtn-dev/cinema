/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CinemaDAO;
import models.Account;
import models.Cinema;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminEditCinema", urlPatterns = {"/AdminEditCinema"})
public class AdminEditCinema extends HttpServlet {

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
            out.println("<title>Servlet AdminEditCinema</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminEditCinema at " + request.getContextPath() + "</h1>");
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

        if (taiKhoan != null && taiKhoan.getRole_id() == 0) {  // Checking if the user is admin
            String type_raw = request.getParameter("type");
            String cinema_id_raw = request.getParameter("id");

            if (type_raw != null && cinema_id_raw != null) {
                int type = Integer.parseInt(type_raw);
                int cinema_id = Integer.parseInt(cinema_id_raw);

                if (type == 0) {  // Update
                    Cinema cinema = CinemaDAO.INSTANCE.getCinemaById(cinema_id);
                    request.setAttribute("detailCinema", cinema);
                } else {  // Delete
                    CinemaDAO.INSTANCE.deleteCinemaById(cinema_id);
                }
            }

            CinemaDAO.INSTANCE.loadCinema();
            request.setAttribute("cinema", CinemaDAO.INSTANCE);
            request.getRequestDispatcher("Views/admineditcinema.jsp").forward(request, response);
        } else {
            response.sendRedirect("Home");
        }
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Initialize variables with default values
    int cinema_id = -1;  // Default value for cinema_id
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String phone_number = request.getParameter("phone_number");
    String email = request.getParameter("email");
    String action = request.getParameter("action");  // Get the action parameter

    try {
        // Check if cinema_id is not empty and try to parse it to an integer
        String cinemaIdParam = request.getParameter("cinema_id");
        if (cinemaIdParam != null && !cinemaIdParam.isEmpty()) {
            cinema_id = Integer.parseInt(cinemaIdParam);  // Parsing cinema_id
        }
    } catch (NumberFormatException e) {
        // Handle error if cinema_id is not a valid integer
        System.err.println("Error parsing cinema_id: " + e.getMessage());
    }

    try {
        // Check action type: either "add" or "edit"
        if ("add".equals(action)) {
            // Handle Add Cinema
            CinemaDAO.INSTANCE.addCinema(name, address, phone_number, email);
            System.out.println("Cinema added successfully.");
        } else if ("edit".equals(action)) {
            // Handle Edit Cinema (ensure cinema_id is valid)
            if (cinema_id != -1) {
                CinemaDAO.INSTANCE.updateCinema(cinema_id, name, address, phone_number, email);
                System.out.println("Cinema updated successfully.");
            } else {
                System.err.println("Invalid cinema_id for editing.");
            }
        }
    } catch (Exception e) {
        // Catch any exception during the add or edit process
        System.err.println("Error processing cinema: " + e.getMessage());
    }

    // After processing, refresh the page with the updated information
    doGet(request, response);
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
