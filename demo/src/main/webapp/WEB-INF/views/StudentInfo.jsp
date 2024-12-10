<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>studentinfo</title>
    <link rel="stylesheet" href="/css/studentinfo.css">
</head>

<body>
<form action="/UserInfo" method="post">

    <div class="StudentInfo-container">
        <h2 class="buddyChat">
            이제 마지막 질문이야!<br>
            <br>
            조금만 더 힘을 내줘!
        </h2>
        <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="buddy">

        <div class="grade">
            <label>너의 학년을 알려줘</label>
        </div>
        <div class="radio-group">
            <label>
                <input type="radio" name="academicType" value="중1">
                <span class="radio-button">중 1</span>
            </label>
            <label>
                <input type="radio" name="academicType" value="중2">
                <span class="radio-button">중 2</span>
            </label>
            <label>
                <input type="radio" name="academicType" value="중3">
                <span class="radio-button">중 3</span>
            </label>
        </div>

        <div class="school">
            <label>너의 학교를 알려줘</label>
            <input type="text" name="schoolName" value="너의 학교를 적어줘" onfocus="clearText(this)" onblur="resetText(this, '너의 학교를 적어줘')">
        </div>

        <div class="Name">
            <label>너의 이름이 뭐야?</label>
            <input type="text" value="너의 이름을 적어줘" onfocus="clearText(this)" onblur="resetText(this, '너의 이름을 적어줘')">
        </div>

        <input type="hidden" name="userId" value="${userId}">

        <button type="submit" class="submit-button">다음</button>
    </div>
</form>

    <script src="/js/studentinfo.js"></script>

</body>
</html>