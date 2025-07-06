<%@page import="dal.*"%>
<%@page import="models.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPT Cinema</title>
        <link rel="stylesheet" href="Css/styleMovies.css"/>
        <link rel="icon" type="image/x-icon" href="https://th.bing.com/th/id/R.e15d750fe41eb99350f0c56e6b66b653?rik=QJI66s2o67Q7jw&pid=ImgRaw&r=0">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <style>
            .comment {
                margin-bottom: 20px;
                padding:0px 150px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .comment-container {
                display: flex;
                align-items: flex-start;
                gap: 15px; /* Tạo khoảng cách giữa ảnh đại diện và nội dung */
            }

            .comment-image {
                flex-shrink: 0; /* Đảm bảo ảnh đại diện không bị co lại */
            }

            .comment-image img {
                border-radius: 50%;
                width: 50px;
                height: 50px;
                object-fit: cover; /* Đảm bảo ảnh không bị méo */
            }

            .comment-text {
                max-width: 80%; /* Hạn chế chiều rộng của nội dung bình luận */
                line-height: 1.5;
                text-align: left;

            }

            .comment-text p {
                margin: 5px 0;
            }

            .comment-text strong {
                font-size: 1.1rem;
                color: #777;
                font-weight: 600;
            }

            .comment-text em {
                font-size: 0.9rem;
                color: #777;
            }

            .comment hr {
                border: 0;
                height: 1px;
                background-color: #e0e0e0;
                margin-top: 15px;
            }
            #commentForm {
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                margin-top: 30px;
                max-width: 100%;
                padding: 0px 150px
            }

            #commentForm textarea {
                width: 100%;
                padding: 10px;
                font-size: 1rem;
                font-family: 'Montserrat', sans-serif; /* Sử dụng font Montserrat */
                border-radius: 5px;
                border: 1px solid #ddd;
                resize: vertical;
                box-sizing: border-box;
                margin-bottom: 15px;
                background-color: #fff;
            }

            #commentForm input[type="submit"] {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 1rem;
                font-family: 'Montserrat', sans-serif; /* Sử dụng font Montserrat */
                font-weight: bold;
                background: wheat;
                transition: background-color 0.3s ease;
            }

            #commentForm input[type="submit"]:hover {
                background: linear-gradient(210deg,#fe6969,#e30713);
            }

            #commentForm input[type="submit"]:disabled {
                background-color: #ccc;
                cursor: not-allowed;
            }


        </style>

    </head>
    <body>
        <%@include file="/components/header.jsp"%>
        ${filmdetail}
        <div class="img"></div>
        <input id="taikhoan" type="hidden" value="${taiKhoan.account_id}">

        <c:forEach items="${film_detail}" var="filmdetail">
            <c:set var="filmId" value="${filmdetail.id}"  />
            <input id="filmId" type="hidden" value="${filmdetail.id}" name="filmid">

            <div class="movie-card">
                <div class="movie-image">
                    <img src="img/${filmdetail.imageUrl}" width="300px" alt="${filmdetail.title}">
                </div>
                <div class="movie-info">
                    <div class="movie-details-left">
                        <div class="movie-title">
                            <h2>${filmdetail.title}</h2>
                            <c:set var="filmTitle" value="${filmdetail.title}" />
                            <div class="movie-format">2D</div>
                        </div>
                        <p class="movie-origin-category">${filmdetail.origin} - ${filmdetail.category}</p>
                        <div class="movie-release">
                            <p>Khởi chiếu: ${filmdetail.publishTime}</p>
                        </div>
                        <p> Thời lượng: ${filmdetail.length} phút</p>
                        <div class="movie-description">
                            <p>${filmdetail.description}</p>
                        </div>
                        <div class="movie-warning" style="margin-bottom: 30px">
                            <p>${filmdetail.warningText}</p>
                        </div>
                        <div class="movie-actions" style="margin-top: 15px">
                            <!--<button class="details-button">Chi tiết nội dung</button>-->
                            <a href="https://www.youtube.com/watch?v=NOhDyUmT9z0" class="trailer-button" target="_blank" style="text-decoration: none">
                                Xem trailer
                            </a>
                        </div>
                    </div>
                    <div class="movie-details-right">
                        <div class="movie-duration-director">

                            <p style="font-weight: bold">Đạo diễn</p>
                            <p style="color:#e63757"> ${filmdetail.director}</p>

                        </div>
                        <div class="movie-cast">
                            <p style="font-weight: bold">Diễn viên</p>
                            <p style="color:#e63757"> ${filmdetail.actors}</p>

                        </div>
                    </div>
                </div>
            </div>

        </c:forEach>
        <div class="date">
            <c:forEach items="${eventDao.dateFilm}" var="df" >
                <p class="detal-date">${df.date}</p>
                <c:set var="date" value="${df.date}"  />
            </c:forEach>
        </div>
        <div class="time">
            <c:forEach items="${eventDao.eventFilm}" var="ef" >
                <p><a class="detal-time" href="/Cinema/Films?movie=${filmId}&time=${ef.startHour}">${ef.startHour}</a></p>
                </c:forEach>
        </div>

        <div class="seat">      
            <div style="display: flex; justify-content: space-evenly">
                <h2>Giờ chiếu: ${startHour}  </h2>
                <c:if test="${startHour!=null}">
                    <h3 style="border:1px solid red;border-radius: 10px;padding: 10px ">Thời gian chọn ghế: <span id="time"></span> </h3>
                </c:if>
            </div>
            <img src="https://chieuphimquocgia.com.vn/_next/image?url=%2Fimages%2Fscreen.png&w=1920&q=75" alt="alt"/>
            <h2 >Phòng chiếu ${loadSeat[0].room_id.name}</h2>

            <table>
                <c:forEach items="${loadSeat}" var="c" varStatus="status">
                    <c:if test="${status.index % 10 == 0}">
                        <tr> 
                        </c:if>
                        <c:if test="${c.price==150000&&!listSeatsFilm_booked.contains(c.id)&&!listSeatsFilm_booking.contains(c.id)}">
                            <td class="orange" onclick="totalBill(this)">
                                ${c.seat_number}
                                <input type="hidden" value="${c.price}" class="seat-value"> 
                                <input type="hidden" value="${c.id}" class="seatID">                                                       
                            </td>
                        </c:if>
                        <c:if test="${c.price==100000&&!listSeatsFilm_booked.contains(c.id)&&!listSeatsFilm_booking.contains(c.id)}">
                            <td class="gray" onclick="totalBill(this)">
                                ${c.seat_number}
                                <input type="hidden" value="${c.price}" class="seat-value">
                                <input type="hidden" value="${c.id}" class="seatID">                                                       

                            </td>
                        </c:if>

                        <c:if test="${listSeatsFilm_booked.contains(c.id)}">                            
                            <td style="background-color: red">
                                ${c.seat_number}                         
                            </td>
                        </c:if>
                        <c:if test="${listSeatsFilm_booking.contains(c.id)}">                            
                            <td style="background-color: #2384d1">
                                ${c.seat_number}                         
                            </td>
                        </c:if>

                        <c:if test="${status.index % 10 == 9 || status.index == (loadSeat.size() - 1)}">
                        </tr> 
                    </c:if>
                </c:forEach>
            </table>
            <div class="seat-type">
                <div class="seat1">
                    <div class="box" style="background-color: red"></div>
                    <p>Ghế đã đặt</p>
                </div>
                <div class="seat1">
                    <div class="box" style="background-color: #393991"></div>
                    <p>Ghế bạn chọn</p>
                </div>
                <div class="seat1">
                    <div class="box" style="background-color: #2384d1"></div>
                    <p>Ghế giữ chỗ</p>
                </div>
                <div class="seat1">
                    <div class="box" style="background-color: gray"></div>
                    <p>Ghế thường</p>
                </div>
                <div class="seat1" >
                    <div class="box"style="background-color: orange"></div>
                    <p>Ghế VIP</p>
                </div>
            </div>
            <form action="Payment" method="get">
                <div class="payment">
                    <div style="text-align: left;">
                        <p>Ghế đã chọn: <span id="selectedSeatsDisplay" name="seat" ></span></p>

                        <p>Tổng tiền: <span id="totalPrice" value="money"></span></p>

                    </div>
                    <div class="booking">
                        <span><a style="text-decoration: none;color: white" href="Home">Quay lại</a></span>
                        <input class="submitfilm" type="submit" value="Thanh toán" onclick="return checkSeatsBeforeSubmit();">

                    </div>

                </div>
                <input id="seat" type="hidden" value="" name="seat">
                <input id="money" type="hidden" value="" name="money">


                <input type="hidden" value="${ticketfilm.id}" name="ticketfilmid" id="ticketfilmid">
                <input type="hidden" value="${filmTitle}" name="titlefilm">
                <input type="hidden" value="${startHour}" name="time">
                <input type="hidden" value="${date}" name="date">
                <input type="hidden" value="${loadSeat[0].room_id.name}" name="room">


                <!--truyen du lieu seatId-->
                <input type="hidden" id="seatIdd" value="" name="seatIdd">


            </form>
            <h2>Comments</h2>

            <form id="commentForm" method="post" action="PostCommentController">
                <input name="user_id" type="hidden" value="${taiKhoan.account_id}">
                <input name="film_id" type="hidden" value="${film_id}">
                <textarea name="commentContent" rows="4" cols="50" placeholder="Enter your comment..."></textarea><br />
                <input type="submit" value="Post Comment" />
            </form>

            <script>
                var isLoggedIn = '${isLoggedIn}';

                document.getElementById("commentForm").onsubmit = function (event) {
                    if (isLoggedIn === 'false') {
                        alert("You must be logged in to post a comment.");
                        event.preventDefault();
                    }
                };
            </script>


            <c:forEach items="${comments}" var="comment">
                <div class="comment">
                    <div class="comment-container">
                        <div class="comment-image">
                            <img src="img/default_ava.jpg" alt="${comment.first_name} ${comment.last_name}" width="50" height="50" style="border-radius: 50%;" />
                        </div>
                        <div class="comment-text">
                            <p><strong>${comment.first_name} ${comment.last_name}</strong></p>
                            <p>${comment.content}</p>
                            <p><em>${comment.commentTime.toString().substring(0, 16)}</em></p>
                        </div>
                    </div>
                    <hr />
                </div>
            </c:forEach>
        </div>





        <%@include file="/components/footer.jsp"%>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="Javascript/home.js"></script>

    </body>
</html>
