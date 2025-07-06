<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPT Cinema</title>

        <!-- Bootstrap CSS Link -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <!-- Your Custom CSS File -->
        <link rel="stylesheet" href="Css/styleAdmin.css"/>

          <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="https://th.bing.com/th/id/R.e15d750fe41eb99350f0c56e6b66b653?rik=QJI66s2o67Q7jw&pid=ImgRaw&r=0">
    </head>
    <body>
        <%@include file="/components/header.jsp"%>
        <div class="page">
            <div class="sidebar">
                <h2>Menu</h2>
                <ul>
                    <li><a href="AdminController">Tài khoản</a></li>
                    <li><a href="AdminEditFilm">Quản lí phim</a></li>
                    <li><a href="AdminEditRoom">Quản lí phòng chiếu</a></li>
                    <li><a href="AdminEditComment">Quản lí bình luận</a></li>
                    <li><a href="AdminEditCinema">Quản lí rạp phim</a></li>
                    <li><a href="AdminEditTicket">Quản lí suất chiếu</a></li>
                </ul>
            </div>
            <div class="content">
                <h1>Quản lý Bình luận</h1>

                <div class="form-container">
                    <!-- Left Column: Comments Table -->
                    <div class="left-column">
                        <table class="table table-bordered">
                             <thead class="thead-dark">
                                <tr>
                                    <th>Account</th>
                                    <th>Film</th>
                                    <th>Content</th>
                                    <th>Comment Time</th>
                                    <th colspan="2">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${comments}" var="comment">
                                    <tr>
                                        <td>${comment.first_name} ${comment.last_name}</td>
                                        <td>${comment.film_name}</td>
                                        <td>${comment.content}</td>
                                        <td>${comment.commentTime}</td>
                                        <td><a href="AdminEditComment?id=${comment.id}" class="btn btn-primary btn-sm">Update</a></td>
                                        <td><a href="AdminEditComment?type=1&id=${comment.id}" class="btn btn-danger btn-sm">Delete</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Right Column: Comment Form -->
                    <div class="right-column">
                        <form action="AdminEditComment" method="post">
                            <input type="hidden" name="comment_id" value="${comment.id}">
                            
                            <div class="form-group">
                                <label for="comment">Content:</label>
                                <textarea name="comment" class="form-control" rows="5">${comment.content}</textarea>
                            </div>
                                  
                            <button type="submit" class="btn btn-success btn-block">Update</button>
                        </form>
                    </div>

                </div>

            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
