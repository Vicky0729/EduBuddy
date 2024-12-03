<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <style>
        @font-face {
            font-family: 'NoonnuBasicGothicRegular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'RixInooAriDuriR';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2207-01@1.0/RixInooAriDuriR.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }


        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: white;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            height: 97vh;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 50px 5px;
            margin-top: 55px;
            border: none;
        }

        .title {
            font-size: 60px;
            font-weight: bold;
            color: #2c3e50;
            line-height: 1.2;
            margin-top: 1px;
            margin-bottom: 5px;
            font-family: 'RixInooAriDuriR';
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .character-img {
            width: 90%;
            margin-bottom: 10px;
        }

        .button img {
            width: 20px;
            height: 20px;
            margin-right: 25px;
        }

        .kakao {
            width: 80%;
            background-color: #f9e000;
            border-radius: 10px;
            font-weight: bold;
            text-align: center;
            padding: 10px 30px;
            margin: 10px 0;
            border: none;
            font-family: "NoonnuBasicGothicRegular";
            font-size: 15px;
            padding-left: 5px;
        }

        .naver {
            width: 80%;
            background-color: #03cf5c;
            border-radius: 10px;
            font-weight: bold;
            text-align: center;
            padding: 10px 30px;
            margin: 10px 0;
            border: none;
            font-family: "NoonnuBasicGothicRegular";
            font-size: 15px;
            padding-left: 5px;
        }

        .facebook {
            width: 80%;
            background-color: #1878f3;
            border-radius: 10px;
            font-weight: bold;
            text-align: center;
            padding: 10px 20px;
            margin: 10px 0;
            border: none;
            font-family: "NoonnuBasicGothicRegular";
            font-size: 15px;
        }

        .phone {
            width: 80%;
            background-color: #ccc;
            border-radius: 10px;
            font-weight: bold;
            text-align: center;
            padding: 10px 30px;
            margin: 10px 0;
            border: none;
            font-family: "NoonnuBasicGothicRegular";
            font-size: 15px;
        }

        .button-content {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
        }

        @media only screen and (min-width: 1025px) and (max-width: 1440px) {
        }
    </style>
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
        <button class="button phone" onclick="window.location.href='phonelogin'">
            <span class="button-content">
                <img src="http://edubuddy.dothome.co.kr/pic/PhoneLogo.png" alt="핸드폰 로고">핸드폰 번호로 시작하기
            </span>
        </button>
    </div>
</body>
</html>