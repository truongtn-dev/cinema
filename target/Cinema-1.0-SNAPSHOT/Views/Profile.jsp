<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPT Cinema</title>
        <link rel="stylesheet" href="Css/styleProfile.css"/>
        <link rel="icon" type="image/x-icon" href="https://th.bing.com/th/id/R.e15d750fe41eb99350f0c56e6b66b653?rik=QJI66s2o67Q7jw&pid=ImgRaw&r=0">
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
        <%@include file="/components/header.jsp"%>
        <h2 class="title">Thông tin cá nhân</h2>
        <div class="p-infor">
          
            <form action="Profile" method="post">
                <div class="grid-container">
                    <input type="hidden" name="name" value="${taiKhoan.username}">
                    <div class="grid-part">
                        <div class="tag">Họ</div>
                        <input class="input" type="text" value="${taiKhoan.first_name}" name="first_name">
                    </div>
                    <div class="grid-part">
                        <div class="tag">Tên</div>
                        <input class="input" type="text" value="${taiKhoan.last_name}" name="last_name">
                    </div>
                    <div class="grid-part">
                        <div class="tag">Số điện thoại</div>
                        <input class="input" type="text" value="${taiKhoan.phone_number}"name="phone_number">
                    </div>
                    <div class="grid-part">
                        <div class="tag">Email</div>
                        <input class="input" type="text" value="${taiKhoan.email}"name="email">
                    </div>
                    <div class="grid-part">
                        <div class="tag">Mật khẩu</div>
                        <input class="input" id="password" type="password" value="${taiKhoan.password}"name="password">
                    </div>
                    <div class="grid-part">
                        <div class="tag">Nhập lại mật khẩu </div>
                        <input class="input" id="confirmPassword" type="password" value="${taiKhoan.password}">
                    </div>
                </div>
                        <input type="hidden" value="${taiKhoan.account_id}" name="account_id" >
                <div class="submit-part">
                    <p style="margin-right: 16px;color: green; font-weight: bold">${ms}</p> <input type="submit" class="submit" value="Lưu thông tin" onclick="return checkPasswordsMatch();"></input>
                </div>
            </form>

        </div>

        <%@include file="/components/footer.jsp"%>
        <script>
            function checkPasswordsMatch() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;

                if (password !== confirmPassword) {
                    alert("Mật khẩu không khớp. Vui lòng kiểm tra lại.");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
