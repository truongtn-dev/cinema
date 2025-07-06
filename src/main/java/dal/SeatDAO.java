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
import java.util.Vector;

/**
 *
 * @author Nguyen Thanh Truong - CE180140
 */
public class SeatDAO {

    private Connection con;
    private String status = "";
    public static SeatDAO INSTANCE = new SeatDAO();

    public SeatDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error ar connection" + e.getMessage();
            }
        }
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Seat> loadSeat(int film_id, String startHour) {
        List<Seat> listSeat = new ArrayList<>();
        String sql = "SELECT DISTINCT s.id, s.seat_number, s.type, s.price, s.roomid "
                + "FROM film AS f "
                + "INNER JOIN ticket_film AS tf ON f.id = tf.filmid "
                + "INNER JOIN room AS r ON tf.roomid = r.id "
                + "INNER JOIN seat AS s ON r.id = s.roomid "
                + "INNER JOIN event AS e ON tf.eventid = e.id "
                + "WHERE f.id = ? AND e.startHour = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, film_id);
            ps.setString(2, startHour);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listSeat.add(new Seat(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        RoomDAO.INSTANCE.getRoomById(rs.getInt(5))
                ));
            }
        } catch (SQLException e) {
            System.err.println("Error at loadSeat: " + e.getMessage());
        }
        return listSeat;
    }

  

}
