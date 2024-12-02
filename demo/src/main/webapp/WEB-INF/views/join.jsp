<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <style>
        @font-face {
            font-family: 'NoonnuBasicGothicRegular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 95vh;
            margin: 15px;
            background-color: white;
        }

        .buddy {
            width: 120px;
            height: 135px;
            float: right;
            transform: scaleX(-1);
            margin-top: 50px;
        }

        .Join-container {
            width: 370px;
            height: 660px;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 20px;
            margin-top: 5px;
            margin-bottom: 5px;
            border: 2px solid #2c3e50;
        }

        .buddyChat {
            background-color: #2c3e50;
            padding: 13px;
            border-radius: 10px;
            font-size: 14px;
            color: rgba(255, 255, 255, 0.792);
            margin-top: 25px;
            float: left;
            font-family: 'NoonnuBasicGothicRegular';
            position: relative;
            max-width: 70%;
            text-align: left;
            line-height: 1.4;
            max-width: 80%;
            margin-left: auto;
        }

        .buddyChat::after {
            content: "";
            position: absolute;
            right: -22px;
            border-width: 10px;
            border-left: 20px;
            border-style: solid;
            border-color: transparent transparent transparent #2c3e50;
        }

        .E-mail {
            margin-top: 180px;
            text-align: left;
            width: 100%;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .E-mail label {
            display: block;
            padding-left: 9px;
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
            padding-left: 9px;
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

        .birth label {
            display: block;
            padding-left: 9px;
            margin-top: 30px;
            width: 100%;
            text-align: left;
            font-weight: bold;
            font-family: 'NoonnuBasicGothicRegular';
        }

        .birth input {
            width: calc(100% - 50px);
            padding: 15px;
            margin-top: 10px;
            border-radius: 7px;
            border: 1px solid #ccc;
            color: rgba(0, 0, 0, 0.5);
            font-family: 'NoonnuBasicGothicRegular';
        }

        .Phone label {
            display: block;
            padding-left: 9px;
            margin-top: 30px;
            width: 100%;
            text-align: left;
            font-weight: bold;
            font-family: 'NoonnuBasicGothicRegular';
        }

        .Phone input {
            width: calc(100% - 50px);
            padding: 15px;
            margin-top: 10px;
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

        .submit-button:hover {
            background-color: rgb(115, 173, 173);
        }
    </style>
</head>

<body>

    <div class="Join-container">
        <h2 class="buddyChat">
            너만을 위한 맞춤 문제를 준비하기 위해<br>
            아래 질문에 답변해줄래?<br><br>
            공부를 더 잘 할 수 있도록 내가 도와줄게!
        </h2>
        <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="buddy">

        <div class="E-mail">
            <label>이메일을 적어줘</label>
            <input type="text" name="E-mail" value="너의 이메일을 적어줘" onfocus="clearText(this)"
                onblur="resetText(this, '너의 이메일을 적어줘')">
        </div>

        <div class="Password">
            <label>너의 비밀번호를 적어줘</label>
            <input type="text" name="Password" value="너의 비밀번호를 적어줘" onfocus="clearText(this)"
                onblur="resetText(this, '너의 비밀번호를 적어줘')">
        </div>

        <div class="birth">
            <label>너의 생년월일을 적어줘</label>
            <input type="text" name="birth" value="너의 생년월일을 알려줘 (xxxx-xx-xx)" onfocus="clearText(this)"
                onblur="resetText(this, '너의 생년월일을 알려줘 (xxxx-xx-xx)')">
        </div>

        <div class="Phone">
            <label>너의 번호가 뭐야?</label>
            <input type="text" name="Phone" value="너의 전화번호를 적어줘 (010-xxxx-xxxx)" onfocus="clearText(this)"
                onblur="resetText(this, '너의 전화번호를 적어줘 (010-xxxx-xxxx)')">
        </div>

        <button type="submit" class="submit-button" onclick="window.location.href='StudentInfo'">완료</button>
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