<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPT Cinema</title>
        <link rel="stylesheet" href="Css/styleHistory.css"/>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    </head>
    <body>
        <%@include file="/components/header.jsp"%>

        <h1 class="title">Lịch sử mua vé</h1>
        <div class="lichsu">
            <table>
                <thead>
                    <tr>                      
                        <td>Tên phim</td>
                        <td>Giờ chiếu</td>
                        <td>Ghế ngồi</td>
                        <td>Phòng chiếu</td>
                        <td>Giờ đặt vé</td>
                        <td>Số tiền</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listHistories}" var="h">
                        <tr>
                            <td>${h.title}</td>
                            <td>${h.startHour} / ${h.date}</td>
                            <td>${h.seat_number}</td>
                            <td>${h.name}</td>
                            <td>${h.bookingTime}</td>
                            <td>${h.price} </td> 
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
    <%@include file="/components/footer.jsp"%>
</html>
