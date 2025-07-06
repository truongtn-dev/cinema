<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPT Cinema</title>
        <link rel="stylesheet" href="Css/styleNews.css"/>
        <link rel="icon" type="image/x-icon" href="https://th.bing.com/th/id/R.e15d750fe41eb99350f0c56e6b66b653?rik=QJI66s2o67Q7jw&pid=ImgRaw&r=0">
          <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    </head>
    <body>
        <%@include file="/components/header.jsp"%>
        <h2 style=" margin-top: 120px; color: white">Tin tức</h2>

        <div class="news">
            <c:forEach items="${newDAO.listNews}" var="n" begin="${page.begin}" end ="${page.end-1}" >
                <div class="box">
                    <div class="image">
                        <img src="/Cinema/img/${n.img}" alt="image">
                    </div>
                    <div class="content">
                        <div class="time">${n.date}</div>
                        <div class="title-film">${n.description}</div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <form class="prenext" action="News" method="post">

            <input type="text" name="index" value="${page.index}" hidden>
            <input type="text" name="totalPage" value="${page.totalPage}" hidden>

            <input type="submit" name="btnPre" value="Pre"> 
            <input type="submit" name="btnNext" value="Next">

        </form>
        <%@include file="/components/footer.jsp"%>
    </body>
</html>