<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>phone login</title>

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
            height: 100%;
            margin: 0;
            background-color: white;
        }

        .login-container {
            width: 400px;
            height: 93vh;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 22px 5px;
            border: 2px solid #2c3e50;
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
        
        .E-mail {
            margin-top: 100px;
            text-align: left;
            width: 100%;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .E-mail label {
            display: block;
            padding-left: 15px;
            margin-top: 40px;
            width: 98%;
            text-align: left;
            font-weight: bold;
            font-family: 'NoonnuBasicGothicRegular';
        }

        .E-mail input {
            width: calc(100% - 50px);
            padding: 15px;
            margin-top: 15px;
            border-radius: 7px;
            border: 1px solid #ccc;
            color: rgba(0, 0, 0, 0.5);
            font-family: 'NoonnuBasicGothicRegular';
            margin-left: 7px;
        }

        .Password label {
            display: block;
            padding-left: 15px;
            margin-top: 30px;
            width: 100%;
            text-align: left;
            font-weight: bold;
            font-family: 'NoonnuBasicGothicRegular';
        }

        .Password input {
            width: calc(100% - 50px);
            padding: 15px;
            margin-top: 15px;
            border-radius: 7px;
            border: 1px solid #ccc;
            color: rgba(0, 0, 0, 0.5);
            font-family: 'NoonnuBasicGothicRegular';
        }

        .submit-button {
            margin-top: 25px;
            width: 95%;
            padding: 10px;
            font-size: 16px;
            background-color: #2c3e50;
            color: rgba(255, 255, 255, 0.792);
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-family: 'NoonnuBasicGothicRegular';
            font-weight: bold;
        }

        @media only screen and (min-width: 1025px) and (max-width: 1440px) {
        }

        a {
            font-family: 'NoonnuBasicGothicRegular';
            text-decoration: none; 
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
    <form action="Home" method="post">
        <div class="E-mail">
            <label>이메일</label>
            <input type="text" name="E-mail" value="이메일을 입력하세요" onfocus="clearText(this)"
                onblur="resetText(this, '이메일')">
        </div>

        <div class="Password">
            <label>비밀번호</label>
            <input type="text" name="Password" value="비밀번호를 입력하세요" onfocus="clearText(this)"
                onblur="resetText(this, '비밀번호')">
        </div>
        <br>
        <input type="submit" class="submit-button" value="로그인">
        <br>
        <br>
        <a href="join" type="button">회원가입</a>

    </form>
    
    </div>

    <script>
        function clearText(input) {
            if (input.value == input.defaultValue) {
                input.value = "";
            }
        }

        function resetText(input, defaultText) {
            if (input.value == "") {
                input.value = defaultText;
            }
        }
    </script>

</body>
</html>