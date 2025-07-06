package dal;

import models.Comment;
import dto.CommentDTO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CommentDAO {

    private Connection con;
    private String status = "";
    private static CommentDAO INSTANCE;

    public CommentDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection: " + e.getMessage();
        }
    }

    public static CommentDAO getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new CommentDAO();
        }
        return INSTANCE;
    }

    // Getter and Setter methods
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public CommentDTO getCommentById(int commentId) {
        CommentDTO comment = null;
        String sql = "SELECT c.id, c.account_id, c.film_id, c.content, c.comment_time, "
                + "a.first_name, a.last_name, f.title "
                + "FROM comment c "
                + "JOIN account a ON c.account_id = a.id "
                + "JOIN film f ON c.film_id = f.id "
                + "WHERE c.id = ?";  // Thêm điều kiện WHERE để lọc theo ID của bình luận

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, commentId);  // Gán giá trị commentId vào câu lệnh SQL

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Nếu tìm thấy kết quả, lấy dữ liệu và tạo CommentDTO
                    comment = new CommentDTO(
                            rs.getInt("id"),
                            rs.getInt("account_id"),
                            rs.getInt("film_id"),
                            rs.getString("content"),
                            rs.getString("comment_time"),
                            rs.getString("first_name"),
                            rs.getString("last_name"),
                            rs.getString("title") // Lấy tên phim
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();  // In lỗi nếu có vấn đề với truy vấn SQL
        }
        return comment;  // Nếu không có bình luận, sẽ trả về null
    }

    public List<CommentDTO> getAllComments() {
        List<CommentDTO> commentList = new ArrayList<>();
        String sql = "SELECT c.id, c.account_id, c.film_id, c.content, c.comment_time, "
                + "a.first_name, a.last_name, f.title "
                + "FROM comment c "
                + "JOIN account a ON c.account_id = a.id "
                + "JOIN film f ON c.film_id = f.id "
                + "ORDER BY c.comment_time DESC";  // Thêm phim và sắp xếp theo thời gian

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CommentDTO comment = new CommentDTO(
                            rs.getInt("id"),
                            rs.getInt("account_id"),
                            rs.getInt("film_id"),
                            rs.getString("content"),
                            rs.getString("comment_time"),
                            rs.getString("first_name"),
                            rs.getString("last_name"),
                            rs.getString("title") // Lấy tên phim
                    );
                    commentList.add(comment);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commentList;
    }

    public List<CommentDTO> getAllCommentByFilm(int filmId) {
        List<CommentDTO> commentDTOList = new ArrayList<>();
        String sql = "SELECT c.id, c.account_id, c.film_id, c.content, c.comment_time, "
                + "a.first_name, a.last_name "
                + "FROM comment c "
                + "JOIN account a ON c.account_id = a.id "
                + "WHERE c.film_id = ? "
                + "ORDER BY c.comment_time DESC";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, filmId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CommentDTO commentDTO = new CommentDTO(
                            rs.getInt("id"),
                            rs.getInt("account_id"),
                            rs.getInt("film_id"),
                            rs.getString("content"),
                            rs.getString("comment_time"),
                            rs.getString("first_name"),
                            rs.getString("last_name")
                    );
                    commentDTOList.add(commentDTO);
                }
            }
        } catch (SQLException e) {
            status = "Error at getting comments: " + e.getMessage();
        }

        return commentDTOList;
    }

    public boolean addComment(Comment comment) {
        boolean isAdded = false;
        String sql = "INSERT INTO comment (account_id, film_id, content, comment_time) "
                + "VALUES (?, ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, comment.getAccountId());
            ps.setInt(2, comment.getFilmId());
            ps.setString(3, comment.getContent());
            ps.setString(4, comment.getCommentTime());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isAdded = true;
            }
        } catch (SQLException e) {
            status = "Error at adding comment: " + e.getMessage();
            System.out.println(status);
        }
        return isAdded;
    }

    public void updateComment(int commentId, String content) {
        String sql = "UPDATE comment SET content = ? WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, content);
            ps.setInt(2, commentId);
            ps.executeUpdate();
        } catch (SQLException e) {
            status = "Error at updating comment: " + e.getMessage();
            System.out.println(status);
        }
    }

    public boolean deleteComment(int commentId) {
        boolean isDeleted = false;
        String sql = "DELETE FROM comment WHERE id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, commentId);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;
            }
        } catch (SQLException e) {
            status = "Error at deleting comment: " + e.getMessage();
            System.out.println(status);
        }
        return isDeleted;
    }

    public static void main(String[] args) {
        // Tạo đối tượng CommentDAO
        CommentDAO commentDAO = CommentDAO.getInstance();

        // Gọi hàm getAllComments() để lấy danh sách các bình luận
        List<CommentDTO> comments = commentDAO.getAllComments();

        // Kiểm tra xem danh sách có null không
        if (comments != null && !comments.isEmpty()) {
            // Duyệt qua các bình luận và in ra thông tin
            for (CommentDTO comment : comments) {
                System.out.println("Comment ID: " + comment.getId());
                System.out.println("User: " + comment.getFirst_name() + " " + comment.getLast_name());
                System.out.println("Film: " + comment.getFilm_name());
                System.out.println("Content: " + comment.getContent());
                System.out.println("Comment Time: " + comment.getCommentTime());
                System.out.println("-------------------------------------");
            }
        } else {
            System.out.println("No comments found.");
        }
    }

}
