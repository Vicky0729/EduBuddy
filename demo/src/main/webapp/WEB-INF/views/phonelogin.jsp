<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edubuddy</title>
        <link rel="stylesheet" href="/css/phonelogin.css">
    </head>

    <body>

        <div class="login-container">
            <h1 class="title">
                <span>EDU</span>
                <br>
                <span>BUDDY</span>
            </h1>

            <img src="http://edubuddy.dothome.co.kr/pic/logoWithCap.png" class="Login-img">

            <form action="Home" method="post">
                <div class="E-mail">
                    <label>이메일</label>
                    <input type="text" name="E-mail" value="이메일을 입력하세요" onfocus="clearText(this)"
                        onblur="resetText(this, '이메일을 입력하세요')">
                </div>

                <div class="Password">
                    <label>비밀번호</label>
                    <input type="text" name="Password" value="비밀번호를 입력하세요" onfocus="clearText(this)"
                        onblur="resetText(this, '비밀번호를 입력하세요')">
                </div>
                <br>
                <input type="submit" class="submit-button" value="로그인">
                <br>
                <br>
                <a href="join.html" type="button">회원가입</a>

            </form>

        </div>
        <script src="/js/phonelogin.js"></script>
    </body>

    </html>