/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.FilmDAO;
import models.Film;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchFilmController", urlPatterns = {"/SearchFilmController"})
public class SearchFilmController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy từ khóa tìm kiếm từ request
        String searchFilm = request.getParameter("searchFilm");

        if (searchFilm == null || searchFilm.trim().isEmpty()) {
            request.setAttribute("searchFilm", "No results found.");
            request.getRequestDispatcher("Views/SearchFilm.jsp").forward(request, response);
            return;
        }

        List<Film> films = FilmDAO.INSTANCE.searchFilmByName(searchFilm);

        request.setAttribute("films", films);
        
        request.setAttribute("searchFilm", searchFilm);

        request.getRequestDispatcher("Views/SearchFilm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
