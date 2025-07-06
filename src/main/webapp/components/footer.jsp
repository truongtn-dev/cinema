<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <style>
            body {
                margin: 0px;
                box-sizing: border-box;
            }
            .footer {
                background: #1f2833;
                color: #ffffff;
                padding: 20px 0;
            }
            .footer .container {
                max-width: 1200px;
                margin: auto;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                text-align: left;
            }
            .footer .column {
                flex: 1;
                min-width: 250px;
                margin: 20px;
            }
            .footer h4 {
                color: #e63757;
                font-size: 18px;
                margin-bottom: 15px;
                border-bottom: 2px solid #e63757;
                display: inline-block;
                padding-bottom: 5px;
            }
            .footer a {
                color: #c5c6c7;
                text-decoration: none;
                display: block;
                margin: 10px 0;
                font-size: 14px;
                transition: 0.3s;
            }
            .footer a:hover {
                color: #e63757;
            }
            .footer .social-icons {
                display: flex;
                gap: 15px;
                margin-top: 10px;
            }
            .footer .social-icons a {
                font-size: 22px;
                color: white;
                transition: 0.3s;
            }
            .footer .social-icons a:hover {
                color: #e63757;
            }
            .footer .logo {
                text-align: center;
                margin-bottom: 20px;
            }
            .footer .logo img {
                width: 180px;
            }
            .footer-bottom {
                text-align: center;
                margin-top: 30px;
                padding-top: 15px;
                border-top: 1px solid #e63757;
                font-size: 14px;
                color: #c5c6c7;
            }

        </style>
    </head>
    <body>
        <footer class="footer">
            <div class="container">
                <div class="column logo">
                    <img src="img/FPT.svg.png" alt="Movie Logo">
                </div>
                <div class="column">
                    <h4>Quick Links</h4>
                    <a href="#">Now Showing</a>
                    <a href="#">Upcoming Movies</a>
                    <a href="#">Promotions</a>
                    <a href="#">Contact Us</a>
                </div>
                <div class="column">
                    <h4>Contact Us</h4>
                    <p><i class="fas fa-envelope"></i> fpt.cinema@moviehub.com</p>
                    <p><i class="fas fa-phone"></i> +84 292 730 3636</p>
                    <p><i class="fas fa-map-marker-alt"></i> FPTCinema, Vietnam</p>
                </div>
                <div class="column">
                    <h4>Follow Us</h4>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                &copy; 2025 FPT Cinema. All Rights Reserved.
            </div>
        </footer>
    </body>
</html>
