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
                <h1>Tài Khoản</h1>

                <div class="form-container">
                    <div class="left-column">
                        <table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr>
            
                                    <th>Username</th>
                                    <!--<th>Password</th>-->
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Email</th>
                                    <th>Phone Number</th>
                                    <th>Role ID</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${account.accList}" var="accList">
                                    <tr>                                  
                         
                                        <td>${accList.username}</td>
                                        <!--<td>${accList.password}</td>-->
                                        <td>${accList.first_name}</td>
                                        <td>${accList.last_name}</td>
                                        <td>${accList.email}</td>
                                        <td>${accList.phone_number}</td>
                                        <td>${accList.role_id}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Optional Form (commented out) -->
<!--
                    <div class="right-column">
                        <form action="AdminController" method="post">
                            <input type="hidden" value="${detailaccount.account_id}" name="account_id">
                            <div class="row">  
                                <div class="label">Id: </div>
                                <div class="input"><input type="text" name="account_id" value="${detailaccount.account_id}"></div>
                            </div>
                            <div class="row">  
                                <div class="label">Username:</div>
                                <div class="input"><input type="text" name="username" value="${detailaccount.username}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Password:</div>
                                <div class="input"><input type="text" name="password" value="${detailaccount.password}"></div>
                            </div>
                            <div class="row">
                                <div class="label">First Name:</div>
                                <div class="input"><input type="text" name="first_name"value="${detailaccount.first_name}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Last Name:</div>
                                <div class="input"><input type="text" name="last_name"value="${detailaccount.last_name}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Email:</div>
                                <div class="input"><input type="text" name="email" value="${detailaccount.email}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Phone_number:</div>
                                <div class="input"><input type="text" name="phone_number" value="${detailaccount.phone_number}"></div>
                            </div>
                            <div class="row">
                                <div class="label">Role ID:</div>
                                <div class="input"><input type="text" name="role_id" value="${detailaccount.role_id}"></div>
                            </div>

                            <input type="submit" value="Insert_Update" name="btnInUp">
                        </form>
                    </div>
-->
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies (optional for features like dropdown, modal, etc.) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
