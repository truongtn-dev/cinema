<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPT Cinema</title>
        <link rel="stylesheet" href="Css/styleHome.css"/>
        <link rel="icon" type="image/x-icon" href="https://th.bing.com/th/id/R.e15d750fe41eb99350f0c56e6b66b653?rik=QJI66s2o67Q7jw&pid=ImgRaw&r=0">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <style>
            .search-container {
                position: relative;
                max-width: 500px;
                margin: 0 auto;
            }

            .search-input {
                width: 100%;
                padding: 10px 50px 10px 15px;
                border: 2px solid #ccc;
                border-radius: 25px;
                font-size: 16px;
            }

            .search-input:focus {
                outline: none;
                border-color: #007bff;
            }

            .search-button {
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                background-color: #007bff;
                color: white;
                border: none;
                padding: 8px 15px;
                font-size: 16px;
                border-radius: 25px;
                cursor: pointer;
            }

            .search-button:hover {
                background-color: #0056b3;
            }
        </style>

    </head>
    <body>
        <%@include file="/components/header.jsp"%>
        <div class="film">
            <div id="carouselExampleIndicators" class="carousel slide " data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner " style="height: 100vh">
                    <% int count = 1; %>
                    <c:forEach items="${film.accFilm}" var="film"> 
                        <c:if test="${film.image_backgroundUrl!=null}">
                            <% if (count == 1) { %>
                            <div class="carousel-item active">
                                <img class="d-block w-100 " src="img/${film.image_backgroundUrl}" alt="">
                            </div>                       
                            <%} else {%>
                            <div class="carousel-item ">
                                <img class="d-block w-100 " src="img/${film.image_backgroundUrl}" alt="">
                            </div>
                            <%}%>
                            <% count++;%>
                        </c:if>
                    </c:forEach>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="container mt-5">
                <div class="search-container">
                    <form method="get" action="SearchFilmController">
                        <input type="text" name="searchFilm" class="search-input" placeholder="Search title of film..." />
                        <button type="submit" class="search-button">
                            Search
                        </button>
                    </form>
                </div>
            </div>       

            <div style="height: 70px"></div>
            <!--List-Films-->
            <div class="list-film">
                <!-- Phim đang chiếu -->
                <div class="detail-film">
                    <div class="phim-chieu">
                        <div class="dot"></div>
                        <h3 style="color:white">Phim đang chiếu</h3>
                    </div>
                    <table class="film-showing">
                        <c:set var="count" value="0" />
                        <tr>
                            <c:forEach items="${film.accFilm}" var="film">
                                <c:if test="${film.status == 0}">
                                    <td>
                                        <a href="/Cinema/Films?movie=${film.id}" style="text-decoration: none">
                                            <div class="img-wrapper">
                                                <img src="/Cinema/img/${film.imageUrl}" alt="${film.title}" />
                                            </div>
                                            <div class="film-desc">
                                                <p>${film.category}</p>
                                                <p>${film.publishTime}</p>
                                            </div>
                                            <p class="title-film">${film.title}</p>
                                        </a>
                                    </td>
                                    <c:set var="count" value="${count + 1}" />
                                    <c:if test="${count % 4 == 0}">
                                    </tr><tr>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                            <!-- Nếu hàng cuối chưa đủ 4 cột, thêm cột trống -->
                            <c:if test="${count % 4 != 0}">
                                <c:forEach begin="1" end="${4 - (count % 4)}">
                                    <td></td>
                                </c:forEach>
                            </c:if>
                        </tr>
                    </table>

                    <!-- Phim sắp chiếu -->
                    <div class="phim-chieu">
                        <div class="dot"></div>
                        <h3 style="color:white">Phim sắp chiếu</h3>
                    </div>
                    <table class="film-showing">
                        <c:set var="count" value="0" />
                        <tr>
                            <c:forEach items="${film.accFilm}" var="film">
                                <c:if test="${film.status == 1}">
                                    <td>
                                        <a href="/Cinema/Films?movie=${film.id}" style="text-decoration: none">
                                            <div class="img-wrapper">
                                                <img src="/Cinema/img/${film.imageUrl}" alt="${film.title}" />
                                            </div>
                                            <div class="film-desc">
                                                <p>${film.category}</p>
                                                <p>${film.publishTime}</p>
                                            </div>
                                            <p class="title-film">${film.title}</p>
                                        </a>
                                    </td>
                                    <c:set var="count" value="${count + 1}" />
                                    <c:if test="${count % 4 == 0}">
                                    </tr><tr>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                            <!-- Nếu hàng cuối chưa đủ 4 cột, thêm cột trống -->
                            <c:if test="${count % 4 != 0}">
                                <c:forEach begin="1" end="${4 - (count % 4)}">
                                    <td></td>
                                </c:forEach>
                            </c:if>
                        </tr>
                    </table>
                </div>
            </div>

            <%@include file="/components/footer.jsp"%>
    </body>
</html>
