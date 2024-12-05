<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>
    
    <form action="login" method="post">
        <h3>이메일</h3>
        <input type="text" placeholder="이메일을 입력해주세요" name="user_id">

        <br>

        <h3>비밀번호</h3>
        <input type="text" placeholder="비밀번호을 입력해주세요" name="user_pw">
        <br>
        <input type="submit" value="로그인">
        <br>
        <a href="join" type="button">회원가입</a>


    </form>






</body>
</html>