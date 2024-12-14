<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edubuddy</title>
        <link rel="stylesheet" href="/css/Idinfo.css" />
    </head>

    <body>
        <form action="joinUser" method="post">
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
                    <button type="button" class="info-button" onclick="IdCheck()">중복확인</button>
                    <!-- 중복 확인 메시지를 표시할 span -->
                    <span id="emailCheckMessage" class="error-message" style="color: red; font-size: 12px;"></span>
                </div>

                <div class="Password">
                    <label>너의 비밀번호를 적어줘</label>
                    <input type="password" name="userPw" value="너의 비밀번호를 적어줘" onfocus="clearText(this)"
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

        <script>
            function IdCheck() {
                const userId = document.querySelector("input[name='userId']").value;
                const messageSpan = document.getElementById("emailCheckMessage");

                // 기존 메시지 초기화
                messageSpan.textContent = "";

                // 이메일 값 확인
                if (!userId || userId === '너의 이메일을 적어줘') {
                    messageSpan.textContent = "이메일을 입력해주세요.";
                    return;
                }

                $.ajax({
                    url: "IdCheck",
                    type: "post",
                    data: { userId: userId },
                    success: function (response) {
                        if (response.exists) {
                            messageSpan.textContent = "이미 사용 중인 이메일입니다.";
                        }else {
                            messageSpan.textContent = "사용 가능한 이메일입니다.";
                            messageSpan.style.color = "green"; // 사용가능한 이메일일 경우 색상 변경
                        }
                    },
                    error : function(xhr, status, error){
                        messageSpan.textContent = "중복 확인 중 문제가 발생했습니다. 다시 시도해주세요";
                        console.error(error);
                    }
                });
            }
        </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </body>

    </html>