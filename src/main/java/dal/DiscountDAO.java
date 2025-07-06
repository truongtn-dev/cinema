package dal;

import models.*;
import java.sql.*;

public class DiscountDAO {

    private Connection con;
    private String status = "";
    public static DiscountDAO INSTANCE = new DiscountDAO();

    public DiscountDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection: " + e.getMessage();
            }
        }
    }

    public boolean checkDiscountCodeExists(String discountCode) {
        boolean exists = false;
        String sql = "SELECT COUNT(*) FROM discount WHERE discount_code = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, discountCode);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    if (count > 0) {
                        exists = true;
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL error while checking discount code: " + e.getMessage());
        }

        return exists;
    }

    public Discount getDiscountByCode(String discountCode) {
        Discount discount = null;
        String sql = "SELECT * FROM discount WHERE discount_code = ?";

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, discountCode);  

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id");
                    double discountAmount = rs.getDouble("discount_amount");
                    discount = new Discount(id, discountCode, discountAmount); // Tạo đối tượng Discount
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return discount;
    }

}
