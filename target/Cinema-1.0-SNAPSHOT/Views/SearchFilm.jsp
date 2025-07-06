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
            <div class="container mt-10">
                <div class="search-container" style="margin-top: 83px">
                    <form method="get" action="SearchFilmController">
                        <input type="text" name="searchFilm" class="search-input" placeholder="search..." />
                        <button type="submit" class="search-button">
                            Search
                        </button>
                    </form>
                </div>
            </div>
            <div style="height: 70px"></div>
            <!-- Search film -->

            <!--List-Films-->
            <div class="list-film">
                <!--phim dang chieu-->
                <div class="detail-film">
                    <div class="phim-chieu">
                        <div class="dot"></div> 
                        <h3 style="color:white">Phim tìm kiếm: ${searchFilm}</h3>
                    </div>
                    <table class="film-showing">              
                        <c:set var="count" value="0"/>
                        <c:if test="${empty films}">
                            <h1 style="color: red;">Xin lỗi! Hiện tại không có phim bạn tìm kiếm</h1> <!-- Hiển thị lỗi nếu films là null hoặc empty -->
                        </c:if>

                        <c:forEach items="${films}" var="film">
                            <c:if test="${film != null && film.status == 0}">
                                <c:choose>
                                    <c:when test="${count % 4 == 0}">
                                        <tr>
                                        </c:when>
                                    </c:choose>
                                    <td>
                                        <a href="/Cinema/Films?movie=${film.id}" style="text-decoration: none">
                                            <div class="img-wrapper">
                                                <img src="img/${film.imageUrl}" alt="${film.title}" />
                                            </div>
                                            <div class="film-desc">
                                                <p>${film.category != null ? film.category : 'N/A'}</p>  <!-- Kiểm tra null cho category -->
                                                <p>${film.publishTime != null ? film.publishTime : 'N/A'}</p>  <!-- Kiểm tra null cho publishTime -->
                                            </div>
                                            <p class="title-film">${film.title != null ? film.title : 'Untitled'}</p>  <!-- Kiểm tra null cho title -->
                                        </a>
                                    </td>
                                    <c:choose>
                                        <c:when test="${count % 4 == 3}">
                                        </tr>
                                    </c:when>
                                </c:choose>
                                <c:set var="count" value="${count + 1}"/>
                            </c:if>
                        </c:forEach>

                        <c:if test="${count % 4 != 0}">
                            <c:forEach begin="1" end="${4 - (count % 4)}">
                                <td></td>
                            </c:forEach>
                            </tr>
                        </c:if>

                    </table>
                </div>
            </div>
        </div>

        <%@include file="/components/footer.jsp"%>
    </body>
</html>
