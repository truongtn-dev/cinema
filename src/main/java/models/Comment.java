package models;


public class Comment {
    private int id;                // Cột [id]
    private int accountId;         // Cột [account_id]
    private int filmId;            // Cột [film_id]
    private String content;        // Cột [content]
    private String commentTime;      // Cột [comment_time]

    // Constructor
    public Comment() {}

    public Comment(int id, int accountId, int filmId, String content, String commentTime) {
        this.id = id;
        this.accountId = accountId;
        this.filmId = filmId;
        this.content = content;
        this.commentTime = commentTime;
    }

    // Getter and Setter methods for each property

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    // Optional: Override toString, equals, hashCode if needed
    @Override
    public String toString() {
        return "Comment{" +
               "id=" + id +
               ", accountId=" + accountId +
               ", filmId=" + filmId +
               ", content='" + content + '\'' +
               ", commentTime=" + commentTime +
               '}';
    }
}
