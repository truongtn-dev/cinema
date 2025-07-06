/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author Admin
 */
public class CommentDTO {

    private int id;
    private int accountId;
    private int filmId;
    private String content;
    private String commentTime;
    private String first_name;
    private String last_name;
    private String film_name;

    public CommentDTO() {
    }

    public CommentDTO(int id, int accountId, int filmId, String content, String commentTime, String first_name, String last_name, String film_name) {
        this.id = id;
        this.accountId = accountId;
        this.filmId = filmId;
        this.content = content;
        this.commentTime = commentTime;
        this.first_name = first_name;
        this.last_name = last_name;
        this.film_name = film_name;
    }

    public CommentDTO(int id, int accountId, int filmId, String content, String commentTime, String first_name, String last_name) {
        this.id = id;
        this.accountId = accountId;
        this.filmId = filmId;
        this.content = content;
        this.commentTime = commentTime;
        this.first_name = first_name;
        this.last_name = last_name;
    }

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

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getFilm_name() {
        return film_name;
    }

    public void setFilm_name(String film_name) {
        this.film_name = film_name;
    }

}
