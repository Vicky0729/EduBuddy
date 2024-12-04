<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edubuddy</title>
    <link rel="stylesheet" href="/css/Idinfo.css" />

    
</head>

<body>
    
    <div class="IdInfo-container">
        <h2 class="buddyChat">
            너만을 위한 맞춤 문제를 준비하기 위해<br>
            아래 질문에 답변해줄래?<br><br>
            공부를 더 잘 할 수 있도록 내가 도와줄게!
        </h2>
        <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="buddy">
        <form action="StudentInfo" method="get">
        <div class="Id">
            <label>아이디를 입력해줘</label>
            <input type="text" name="Id" value="너의 아이디를 적어줘" onfocus="clearText(this)" onblur="resetText(this, '너의 아이디를 적어줘')">
        </div>

        <div class="Password">
            <label>너의 비밀번호를 알려줘</label>
            <input type="password" name="Password" value="너의 비밀번호를 적어줘" onfocus="clearText(this)" onblur="resetText(this, '너의 비밀번호를 적어줘')">
        </div>

        <div class="Phone">
            <label>너의 번호가 뭐야?</label>
            <input type="tel" name="Phone" value="너의 전화번호를 적어줘" onfocus="clearText(this)" onblur="resetText(this, '너의 전화번호를 적어줘')">
        </div>

            <button type="submit" class="submit-button" onclick="window.location.href='/home'">완료</button>
        </form>
    </div>

    <script src="/demo/src/main/resources/static/js/Idinfo.js"></script>

</body>
</html>