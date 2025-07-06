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
                <h1>Phòng Chiếu</h1>

                <div class="form-container">
                    <!-- Left Column: Room List -->
                    <div class="left-column">
                        <table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <!--<th>ID</th>-->
                                    <th>Name</th>
                                    <th>Capacity</th> 
                                    <th colspan="2">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${RoomDAO.listRoom}" var="r">
                                    <tr>
                                        <!--<td>${r.id}</td>-->
                                        <td>${r.name}</td>
                                        <td>${r.capacity}</td>
                                        <td><a href="AdminEditRoom?type=0&roomid=${r.id}" class="btn btn-primary btn-sm">Update</a></td>
                                        <td><a href="AdminEditRoom?type=1&roomid=${r.id}" class="btn btn-danger btn-sm">Remove</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Right Column: Room Form -->
                    <div class="right-column">
                        <form action="AdminEditRoom" method="post">
                            <input type="hidden" name="id" value="${detailRoom.id}">
                            
                            <div class="form-group">
                                <label for="name">Name:</label>
                                <input type="text" class="form-control" name="name" value="${detailRoom.name}">
                            </div>
                            
                            <div class="form-group">
                                <label for="capacity">Capacity:</label>
                                <input type="text" class="form-control" name="capacity" value="${detailRoom.capacity}">
                            </div>

                            <!-- Insert/Update Button -->
                            <button type="submit" class="btn btn-success btn-block">Insert/Update</button>
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
