/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import models.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CinemaDAO {

    private Connection con;
    private List<Cinema> cinemaList;
    public static CinemaDAO INSTANCE = new CinemaDAO();

    public CinemaDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public List<Cinema> getCinemaList() {
        return cinemaList;
    }

    public void loadCinema() {
        cinemaList = new ArrayList<>();
        String sql = "SELECT * FROM cinema";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cinemaList.add(new Cinema(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Cinema getCinemaById(int id) {
        String sql = "SELECT * FROM cinema WHERE id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Cinema(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addCinema(String name, String address, String phone, String email) {
        String sql = "INSERT INTO cinema (name, address, phone_number, email) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCinema(int id, String name, String address, String phone, String email) {
        String sql = "UPDATE cinema SET name=?, address=?, phone_number=?, email=? WHERE id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCinemaById(int id) {
        String sql = "DELETE FROM cinema WHERE id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        // Create an instance of CinemaDAO
        CinemaDAO cinemaDAO = CinemaDAO.INSTANCE;

        // Add a new cinema to the database
        cinemaDAO.addCinema("Cinema XYZ", "123 Cinema Street", "555-1234", "contact@xyzcinema.com");

        // Optionally, load and print the list of cinemas after adding the new one
        cinemaDAO.loadCinema();
        List<Cinema> cinemas = cinemaDAO.getCinemaList();

        if (cinemas != null && !cinemas.isEmpty()) {
            for (Cinema cinema : cinemas) {
                System.out.println(cinema);  // This will call the toString() method of Cinema
            }
        } else {
            System.out.println("No cinemas found.");
        }
    }
}
