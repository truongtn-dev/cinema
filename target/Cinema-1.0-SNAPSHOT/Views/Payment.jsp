<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPT Cinema</title>
        <link rel="stylesheet" href="Css/stylePayment.css"/>
        <link rel="icon" type="image/x-icon" href="https://th.bing.com/th/id/R.e15d750fe41eb99350f0c56e6b66b653?rik=QJI66s2o67Q7jw&pid=ImgRaw&r=0">
        <link rel="icon" type="image/x-icon" href="https://th.bing.com/th/id/R.e15d750fe41eb99350f0c56e6b66b653?rik=QJI66s2o67Q7jw&pid=ImgRaw&r=0">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;700&display=swap" rel="stylesheet"> <!-- Thêm dòng này -->
        <style>
            body {
                font-family: 'Montserrat', sans-serif; /* Sử dụng font Montserrat */
            }
        </style>
        <style>
            .discount-input {
                padding: 10px 15px;
                width: 100%;
                max-width: 100%;
                border: 2px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                font-family: 'Montserrat', sans-serif; /* Sử dụng font Montserrat */
                color: #333;
                transition: border-color 0.3s ease, box-shadow 0.3s ease;
            }

            .discount-input:focus {
                border-color: #007bff;
                outline: none;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            }

            .discount-input::placeholder {
                color: #aaa;
                font-style: italic;
            }

        </style>

    </head>
    <body>
        <%@include file="/components/header.jsp"%>
        <input id="taikhoan" type="hidden" value="${taiKhoan.account_id}">
        <input id="seatid" type="text" value="${seatId}">
        <div class="container2">
            <div class="left2">
                <div class="infor-film2">
                    <div style="display: flex;justify-content: space-between;align-content: center">
                        <h3 class="title2">Thông tin phim</h3>
                    </div>
                    <div class="infor-sub-part2">
                        <p class="tag2">Phim</p>
                        <p class="content2">${title}</p>
                    </div>

                    <div class="grid-container2">
                        <div class="infor-sub-part2">
                            <p class="tag2">Ngày giờ chiếu</p>
                            <p class="content2"><span class="time2">${time}  </span> <span class="date" style="margin-left: 10px">${date}</span></p>
                        </div>
                        <div class="infor-sub-part2">
                            <p class="tag2">Định dạng</p>
                            <p class="content2">2d</p>
                        </div>
                        <div class="infor-sub-part2">
                            <p class="tag2">Ghế</p>
                            <p class="content2">${seat}</p>
                        </div>
                        <div class="infor-sub-part2">
                            <p class="tag2">Phòng chiếu</p>
                            <p class="content2">${room}</p>
                        </div>
                    </div>
                </div>
                <div class="bill2">
                    <h3 class="title2">Thông tin thanh toán</h3>
                    <div class="table-container2">
                        <table class="table2">
                            <thead>
                                <tr>
                                    <th scope="c">Danh mục</th>
                                    <th scope="c">Số lượng</th>
                                    <th scope="c">Tổng tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="r">
                                        <span class="" >Ghế ${seat}</span>
                                    </td>
                                    <td class="p">
                                        <span class="">${soluong}</span>
                                    </td>
                                    <td class="p">
                                        <span class="">${money}</span><span class="vnd">đ</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="bill2">
                    <h3>Mã Giảm Giá</h3>
                    <div class="discount-input-container">
                        <form action="Payment" method="post">
                            <input type="hidden" name="action" value="applyDiscount" />
                            <input type="hidden" name="money" value="${money}" />
                            <input type="hidden" name="money" value="${money}" />
                            <input type="hidden" name="seat" value="${seat}" />
                            <input type="hidden" value="${seatId}" name="seatId">
                            <input type="hidden" value="${ticketfilmid}" name="ticketfilmid" />
                            <input type="text" name="discount" class="discount-input" placeholder="Nhập mã giảm giá"/>
                            <input type="submit" class="submit2" value="Áp Dụng" />
                        </form>
                    </div>
                </div>

                <!-- Kiểm tra và hiển thị mã giảm giá -->
                <c:if test="${not empty discountCode}">
                    <c:choose>
                        <c:when test="${discountValid}">
                            <div class="discount-info">
                                <p style="color: white">Đã áp dụng mã giảm giá: <strong>${discountCode}</strong></p>
                                <p style="color: white">Số tiền sau khi giảm: ${money * (1 - discountAmount / 100)}</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <p style="color: white">Mã giảm giá không hợp lệ.</p>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>
            <div class="right2">
                <div class="pay-container2">
                    <h3 class="title2">Phương thức thanh toán</h3>
                    <div class="options2">
                        <div class="option2 option-1">VNPAY</div>
                        <div class="option2">Payoo</div>
                        <div class="option2">Viettel Money</div>
                    </div>
                    <div class="fee2">
                        <h3 class="title2">Chi phí</h3>
                        <div>
                            <span>Thanh toán</span><span class="value2">${money}<span class="vnd">đ</span></span>
                        </div>
                        <div>
                            <span>Free (0%)</span><span class="value2">${discountAmount}<span class="vnd">%</span></span>
                        </div>
                        <c:if test="${not empty discountCode}">
                            <div>
                                <span>Thanh toán</span><span class="value2">${moneyApplyDiscount}<span class="vnd">đ</span></span>
                            </div>
                        </c:if>

                        <c:if test="${empty discountCode}">
                            <div>
                                <span>Thanh toán</span><span class="value2">${money}<span class="vnd">đ</span></span>
                            </div>
                        </c:if>

                    </div>
                    <form action="Payment" method="post">
                        <input type="hidden" value="${seat}" name="seat" id="seat">
                        <!--gui du lieu-->
                        <input type="hidden" value="${seatId}" name="seatId">
                        <input type="hidden" value="${money}" name="money">
                        <input type="hidden" value="${ticketfilmid}" name="ticketfilmid" id="ticketfilmid">
                        <input type="hidden" name="action" value="payment" />

                        <div class="button-submit2">
                            <input type="submit" class="submit2" value="FPT Pay" />
                        </div>
                        <div class="button-submit23 ">
                            <a style="color: white; text-decoration: none" href="Home">Quay lại</a>
                        </div>
                    </form>
                </div>
            </div>   
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="Javascript/payment.js">
        </script>
        <%@include file="/components/footer.jsp"%>
    </body>
</html>