/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DiscountDAO;
import dal.TicketDAO;
import models.Account;
import models.Discount;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Nguyen Thanh Truong - CE180140
 */
public class PaymentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PaymentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String titleFilm = request.getParameter("titlefilm");
        String time = request.getParameter("time");
        String date = request.getParameter("date");
        String room = request.getParameter("room");
        String seat = request.getParameter("seat");

        int money = Integer.parseInt(request.getParameter("money"));

        HttpSession session = request.getSession();
        Account taiKhoan = (Account) session.getAttribute("taiKhoan");

        String[] seats = seat.split(", ");
        // seatid,ticketfilmid  
        String seatid = request.getParameter("seatIdd");
        String ticketfilmid = request.getParameter("ticketfilmid");

        PrintWriter out = response.getWriter();

        request.setAttribute("title", titleFilm);
        request.setAttribute("time", time);
        request.setAttribute("date", date);
        request.setAttribute("room", room);
        request.setAttribute("seat", seat);
        request.setAttribute("money", money);
        request.setAttribute("soluong", seats.length);
        request.setAttribute("taiKhoan", taiKhoan);

        //gui seatID,ticketfilmid
        request.setAttribute("seatId", seatid);
        request.setAttribute("ticketfilmid", ticketfilmid);
        request.getRequestDispatcher("Views/Payment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("applyDiscount".equals(action)) {
            String moneyParam = request.getParameter("money");
            int money = 0;

            if (moneyParam != null && !moneyParam.isEmpty()) {
                try {
                    money = Integer.parseInt(moneyParam); 
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid money value");
                    return;
                }
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Money parameter is required");
                return;
            }

            request.setAttribute("money", money);
            String discountCode = request.getParameter("discount"); 
            DiscountDAO discountDAO = DiscountDAO.INSTANCE;
            double discountAmount = 0;
            boolean discountValid = false;

            // Kiểm tra mã giảm giá
            if (discountDAO.checkDiscountCodeExists(discountCode)) {
                Discount discount = discountDAO.getDiscountByCode(discountCode);
                discountAmount = discount.getDiscountAmount();
                money = (int) (money * (1 - discountAmount / 100)); 
                discountValid = true;
            }

            String seat = request.getParameter("seat");
            String[] seats = seat.split(", ");
            request.setAttribute("discountCode", discountCode);
            request.setAttribute("discountValid", discountValid);
            request.setAttribute("discountAmount", discountAmount);
            request.setAttribute("moneyApplyDiscount", money);
            request.setAttribute("soluong", seats.length);
            request.setAttribute("seat", seat);
            String seatid = request.getParameter("seatId");
            String ticketfilmid = request.getParameter("ticketfilmid");
            request.setAttribute("seatId", seatid);
            request.setAttribute("ticketfilmid", ticketfilmid);

            request.getRequestDispatcher("Views/Payment.jsp").forward(request, response);

        } else if ("payment".equals(action)) {
           HttpSession session = request.getSession();
            Account taiKhoan = (Account) session.getAttribute("taiKhoan");

            if (taiKhoan == null) {
                response.sendRedirect("Login");
                return;
            }

            String seatId = request.getParameter("seatId");
            String ticketfilmid = request.getParameter("ticketfilmid");
            String discountAmountStr = request.getParameter("money");

            int row;
            if (discountAmountStr == null || discountAmountStr.isEmpty()) {
                row = TicketDAO.INSTANCE.insertTicket(taiKhoan.getAccount_id(), seatId, ticketfilmid, 1);
            } else {
                int discountAmount = Integer.parseInt(discountAmountStr); 
                row = TicketDAO.INSTANCE.insertTicket1(taiKhoan.getAccount_id(), seatId, ticketfilmid, 1, discountAmount);
            }
            PrintWriter out = response.getWriter();

            if (row > 0) {
                String alertScript = "<script>alert('Đăng ký vé thành công!');"
                        + "window.location.href='Home';</script>";
                response.setContentType("text/html;charset=UTF-8");

                out.println(alertScript);
            } else {
                response.setContentType("text/html;charset=UTF-8");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Đăng ký vé thất bại</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Đăng ký vé thất bại</h1>");
                out.println("<p>Đã xảy ra lỗi trong quá trình đăng ký vé.</p>");
                out.println("</body>");
                out.println("</html>");
            }
        } else {
            // Nếu không phải hành động thanh toán, chỉ xử lý việc khác (nếu có)
            response.sendRedirect("Home"); // Hoặc xử lý theo logic khác
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
