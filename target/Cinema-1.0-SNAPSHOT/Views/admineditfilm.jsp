<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí Phim</title>
        
        <!-- Bootstrap CSS Link -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Your Custom CSS File -->
        <link rel="stylesheet" href="Css/styleAdminEditFilm.css"/>
          <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
                <h1>Quản lí Phim</h1>

                <!-- Film Selection Form -->
                <form action="AdminEditFilm" method="get">
                    <div class="form-container mb-4">
                        <label style="font-size: 20px;">Chọn phim để lấy thông tin:</label>
                        <select name="film" class="form-control">
                            <c:forEach items="${filmDao.accFilm}" var="f">
                                <option>${f.title}</option>
                            </c:forEach>
                        </select>
                        <br>
                        <button type="submit" class="btn btn-primary mt-3">Submit</button>
                    </div>
                </form>

                <!-- Film Details Form -->
                <h2>${detailFilm.title}</h2>
                <form action="AdminEditFilm" method="post">
                    <input type="hidden" name="filmid" value="${detailFilm.id}">

                    <div class="table-responsive">
                        <table class="table table-bordered">

                            <!-- Title -->
                            <tr>
                                <td><label for="title">Title:</label></td>
                                <td><input type="text" class="form-control" id="title" name="title" value="${detailFilm.title}"></td>
                            </tr>

                            <!-- Category -->
                            <tr>
                                <td><label for="category">Category:</label></td>
                                <td><input type="text" class="form-control" id="category" name="category" value="${detailFilm.category}" maxlength="50"></td>
                            </tr>

                            <!-- Length -->
                            <tr>
                                <td><label for="length">Length:</label></td>
                                <td><input type="text" class="form-control" id="length" name="length" value="${detailFilm.length}"></td>
                            </tr>

                            <!-- Description -->
                            <tr>
                                <td><label for="description">Description:</label></td>
                                <td><textarea class="form-control" id="description" name="description">${detailFilm.description}</textarea></td>
                            </tr>

                            <!-- Age Limit -->
                            <tr>
                                <td><label for="age_limit">Age Limit:</label></td>
                                <td><input type="text" class="form-control" id="age_limit" name="age_limit" value="${detailFilm.ageLimit}"></td>
                            </tr>

                            <!-- Director -->
                            <tr>
                                <td><label for="director">Director:</label></td>
                                <td><input type="text" class="form-control" id="director" name="director" value="${detailFilm.director}"></td>
                            </tr>

                            <!-- Actor -->
                            <tr>
                                <td><label for="actor">Actor:</label></td>
                                <td><input type="text" class="form-control" id="actor" name="actor" value="${detailFilm.actors}"></td>
                            </tr>

                            <!-- Warning Text -->
                            <tr>
                                <td><label for="warning_text">Warning Text:</label></td>
                                <td><textarea class="form-control" id="warning_text" name="warning_text">${detailFilm.warningText}</textarea></td>
                            </tr>

                            <!-- Publish Time -->
                            <tr>
                                <td><label for="publish_time">Publish Time:</label></td>
                                <td><input type="date" class="form-control" id="publish_time" name="publish_time" value="${detailFilm.publishTime}"></td>
                            </tr>

                            <!-- Origin -->
                            <tr>
                                <td><label for="origin">Origin:</label></td>
                                <td><input type="text" class="form-control" id="origin" name="origin" value="${detailFilm.origin}" maxlength="50"></td>
                            </tr>

                            <!-- Image Link -->
                            <tr>
                                <td><label for="img">Image Link:</label></td>
                                <td><input type="text" class="form-control" id="img" name="img" value="${detailFilm.imageUrl}" maxlength="255"></td>
                            </tr>

                            <!-- Background Image Link -->
                            <tr>
                                <td><label for="img_background">Background Image Link:</label></td>
                                <td><input type="text" class="form-control" id="img_background" name="img_background" value="${detailFilm.image_backgroundUrl}" maxlength="255"></td>
                            </tr>

                            <!-- Status -->
                            <tr>
                                <td><label for="status">Status:</label></td>
                                <td><input type="number" class="form-control" id="status" name="status" value="${detailFilm.status}"></td>
                            </tr>

                        </table>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-success btn-block" style="margin-top: 20px;">Insert/Update</button>
                </form>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
