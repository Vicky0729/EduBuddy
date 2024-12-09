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
    <form action="" method="post">
        <div class="Join-container">
            <h2 class="buddyChat">
                너만을 위한 맞춤 문제를 준비하기 위해<br>
                아래 질문에 답변해줄래?<br><br>
                공부를 더 잘 할 수 있도록 내가 도와줄게!
            </h2>
            <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="buddy">
    
            <div class="E-mail">
                <label>이메일을 적어줘</label>
                <input type="text" name="userId" value="너의 이메일을 적어줘" onfocus="clearText(this)"
                    onblur="resetText(this, '너의 이메일을 적어줘')">
            </div>
    
            <div class="Password">
                <label>너의 비밀번호를 적어줘</label>
                <input type="text" name="userPw" value="너의 비밀번호를 적어줘" onfocus="clearText(this)"
                    onblur="resetText(this, '너의 비밀번호를 적어줘')">
            </div>
    
            <div class="Name">
                <label>너의 이름을 적어줘!</label>
                <input type="text" name="userName" value="너의 이름을 적어줘" onfocus="clearText(this)"
                    onblur="resetText(this, '너의 이름을 적어줘')">
            </div>
    
            <div class="birth">
                <label>너의 생년월일을 적어줘</label>
                <input type="text" name="userBirthdate" value="너의 생년월일을 알려줘 (xxxx-xx-xx)" onfocus="clearText(this)"
                    onblur="resetText(this, '너의 생년월일을 알려줘 (xxxx-xx-xx)')">
            </div>
    
            <div class="Phone">
                <label>너의 번호가 뭐야?</label>
                <input type="text" name="userPhone" value="너의 전화번호를 적어줘 (010-xxxx-xxxx)" onfocus="clearText(this)"
                    onblur="resetText(this, '너의 전화번호를 적어줘 (010-xxxx-xxxx)')">
            </div>
    
            <button type="submit" class="submit-button" onclick="window.location.href='StudentInfo'">완료</button>
        </div>
    </form>

    <script src="/js/Idinfo.js"></script>

</body>
</html>