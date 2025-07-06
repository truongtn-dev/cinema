<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h1>Quản lý Rạp Phim</h1>

                <div class="form-container row">
                    <div class="col-md-8">
                        <table class="table table-striped table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Phone Number</th>
                                    <th>Email</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cinema.cinemaList}" var="cinema">
                                    <tr>
                                        <td>${cinema.id}</td>
                                        <td>${cinema.name}</td>
                                        <td>${cinema.address}</td>
                                        <td>${cinema.phoneNumber}</td>
                                        <td>${cinema.email}</td>
                                        <td>
                                            <a class="btn btn-primary btn-sm" href="AdminEditCinema?type=0&id=${cinema.id}">Update</a> |
                                            <a class="btn btn-danger btn-sm" href="AdminEditCinema?type=1&id=${cinema.id}">Remove</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="col-md-4">
                        <form action="AdminEditCinema" method="post">
                            <input type="hidden" value="${detailCinema.id}" name="cinema_id">

                            <div class="form-group">  
                                <label for="name">Name:</label>
                                <input type="text" class="form-control" id="name" name="name" value="${detailCinema.name}">
                            </div>

                            <div class="form-group">
                                <label for="address">Address:</label>
                                <input type="text" class="form-control" id="address" name="address" value="${detailCinema.address}">
                            </div>

                            <div class="form-group">
                                <label for="phone_number">Phone Number:</label>
                                <input type="text" class="form-control" id="phone_number" name="phone_number" value="${detailCinema.phoneNumber}">
                            </div>

                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" value="${detailCinema.email}">
                            </div>

                            <!-- Button for Add Cinema -->
                            <button type="submit" class="btn btn-success btn-block" name="action" onclick="this.form.action = 'AdminEditCinema?action=add';">Add Cinema</button>

                            <!-- Button for Edit Cinema -->
                            <button type="submit" class="btn btn-warning btn-block" name="action" onclick="this.form.action = 'AdminEditCinema?action=edit';">Edit Cinema</button>
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
