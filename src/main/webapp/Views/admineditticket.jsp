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
                <h1>Suất Chiếu</h1>

                <div class="form-container">

                    <table class="table table-bordered">
                         <thead class="thead-dark">
                            <tr>
                                <th>Tên Phim</th>
                                <th>Phòng Chiếu</th>
                                <th>Thời Gian Chiếu</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="l">
                                <tr>
                                    <td>${l.filmName}</td>
                                    <td>${l.roomName}</td>
                                    <td>${l.date}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div style="height: 200px;">
                    <h1>Thêm Suất Chiếu Cho Phim</h1>
                    <form action="AdminEditTicket" method="post">
                        <div class="form-group">
                            <label for="film">Chọn Phim:</label>
                            <select name="film" class="form-control">
                                <c:forEach items="${filmDao.accFilm}" var="f">
                                    <option value="${f.id}">${f.title}</option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="room">Chọn Phòng Chiếu:</label>
                            <select name="room" class="form-control">
                                <c:forEach items="${roomDao.listRoom}" var="r">
                                    <option value="${r.id}">${r.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="event">Chọn Thời Gian Chiếu:</label>
                            <select name="event" class="form-control">
                                <c:forEach items="${eventDao.listEvent}" var="e">
                                    <option value="${e.id}">${e.startHour}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-success">Insert</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
