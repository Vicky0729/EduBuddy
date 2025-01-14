<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edubuddy</title>
    <link rel="stylesheet" href="/css/login.css" />
</head>
<body>
    
    <div class="login-container">
        <h1 class="title">
            <span>EDU</span>
            <br>
            <span>BUDDY</span>
        </h1>

        <img src="http://edubuddy.dothome.co.kr/pic/logoWithCap.png" class="character-img">
        <button class="button kakao" onclick="window.location.href='카카오로그인URL'">
            <span class="button-content">
                <img src="http://edubuddy.dothome.co.kr/pic/kakaoLogo.png" alt="카카오 로고">카카오로 시작하기
            </span>
        </button>
        <button class="button naver" onclick="window.location.href='네이버로그인URL'">
            <span class="button-content">
                <img src="http://edubuddy.dothome.co.kr/pic/naverlogo.png" alt="네이버 로고">네이버로 시작하기
            </span>
        </button>
        <button class="button facebook" onclick="window.location.href='페이스북로그인URL'">
            <span class="button-content">
                <img src="http://edubuddy.dothome.co.kr/pic/facebookLogo.png" alt="페이스북 로고">페이스북으로 시작하기
            </span>
        </button>
        <button class="button phone" onclick="window.location.href='PhoneloginPage'">
            <span class="button-content">
                <img src="http://edubuddy.dothome.co.kr/pic/PhoneLogo.png" alt="핸드폰 로고">기존 회원으로 시작하기
            </span>
        </button>
    </div>

    <script>
        function navigateToPhoneLogin(loginError) {
            // loginError가 있다면 알림 표시 후 페이지 이동
            if (loginError) {
                alert(loginError);
            }
    
            // 페이지 이동
            window.location.href = 'PhoneloginPage';
        }
    </script>
</body>
</html>