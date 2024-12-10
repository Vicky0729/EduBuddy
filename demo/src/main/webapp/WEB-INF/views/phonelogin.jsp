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


            <form action="auth/login" method="post">
                <div class="E-mail">
                    <label>이메일</label>
                    <input type="text" name="userId" value="이메일을 입력하세요" onfocus="clearText(this)"
                        onblur="resetText(this, '이메일을 입력하세요')">
                </div>

                <div class="Password">
                    <label>비밀번호</label>
                    <input type="text" name="userPw" value="비밀번호를 입력하세요" onfocus="clearText(this)"
                        onblur="resetText(this, '비밀번호를 입력하세요')">
                </div>
                <br>
                <input type="submit" class="submit-button" value="로그인">
                <br>
                <br>
                <a href="IdinfoPage" type="button">회원가입</a>

            </form>

        </div>
        <!-- 오류 메시지가 있을 경우 alert로 표시
        <c:if test="${not empty loginError}">
            <script type="text/javascript">
                alert("${loginError}");
            </script>
        </c:if> -->

        <input type="hidden" id="loginError" value="${loginError}" />

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const loginError = document.getElementById("loginError").value;
                if (loginError) {
                    alert(loginError); // 경고창 표시
                }
                // 팝업 대신 원하는 동작을 버튼 클릭으로 제한
                console.log("loginError 값: ", loginError);
            });
        </script>
        <script src="/js/phonelogin.js"></script>

    </body>
</html>