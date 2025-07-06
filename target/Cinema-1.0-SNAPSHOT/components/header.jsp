<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Css/styleHeader.css"/>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;700&display=swap" rel="stylesheet"> <!-- Thêm dòng này -->
        <style>
            body {
                font-family: 'Montserrat', sans-serif; /* Sử dụng font Montserrat */
            }
        </style>
    </head>
    <body>
        <div class="navbar1">
            <div class="container1">
                <div class="logo1">
                    <a href="/Cinema/Home">
                        <img src="img/FPT.svg.png" alt="logoFPT">
                    </a>
                </div>
                <nav class="main-nav1">
                    <a style="color: #e63757;" href="/Cinema/Home">Trang chủ</a>
                    <a href="#">Lịch chiếu</a>
                    <a href="News">Tin tức</a>
                    <a href="#">Giá vé</a>
                    <a href="#">Liên hoan phim</a>
                    <a href="#">Giới thiệu</a>
                </nav>
                <c:if test="${sessionScope.taiKhoan == null}">
                    <div class="auth-btn1">
                        <a href="/Cinema/Register"><button class="register1">Đăng ký</button></a>
                        <a href="/Cinema/Login"><button class="login1">Đăng nhập</button></a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.taiKhoan != null}">
                    <div class="auth-btn1">
                        <div class="dropdown1">
                            <div class="dropdown-title1">
                                <span style="margin-right:10px" class="material-symbols-outlined">
                                    person
                                </span>
                                <div class="username1">${sessionScope.taiKhoan.first_name}
                                    ${sessionScope.taiKhoan.last_name}</div>
                            </div>
                            <div class="dropdown-content1">
                                <a href="Profile">Thông tin cá nhân</a>
                                <a href="Logout">Đăng xuất</a>
                                <a href="History"> Lịch sử mua vé</a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </body>
</html>
