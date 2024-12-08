<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            height: 100%;
            background-color: white;
            margin: 0;
        }

        .DashBoard-container {
            width: 400px;
            height: 93vh;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: left;
            padding: 22px 10px;
            border: 2px solid #2c3e50;
            border-radius: 20px;
            position: relative;
            overflow: hidden;
            margin-top: 1px;
            font-family: 'NoonnuBasicGothicRegular';
        }

        .header {
            font-size: 20px;
            font-weight: bold;
            text-align: left;
            padding: 20px;
            background-color: #2c3e50;
            color: white;
            border-top-left-radius: 18px;
            border-top-right-radius: 18px;
            font-family: 'NoonnuBasicGothicRegular';
            width: calc(100% + 30px);
            box-sizing: border-box;
            margin: 0;
            position: relative;
            top: -22px;
            right: 11px;
        }

        .chat-container {
            flex-shrink: 0;
            display: flex;
            align-items: flex-start;
            padding: 8px;
            gap: 5px;
        }

        .buddy {
            width: 120px;
            height: auto;
            margin-right: 10px;
            margin-top: 20px;
        }

        .buddyChat {
            background-color: #2c3e50;
            padding: 0 30px;
            border-radius: 10px;
            font-size: 14px;
            line-height: 1.2;
            text-align: left;
            margin-left: 10px;
            color: rgba(255, 255, 255, 0.792);
            font-family: 'NoonnuBasicGothicRegular';
            position: relative;
            margin-top: 15px;
        }

        .buddyChat::after {
            content: "";
            position: absolute;
            left: -15px;
            top: 50px;
            border-width: 20px;
            border-right: 20px solid #2c3e50;
            border-top: 8px solid transparent;
            border-bottom: 15px solid transparent;
            border-left: none;
        }

        .contents {
            flex: 1;
            overflow-y: auto;
            max-height: calc(92vh - 150px);
            padding-bottom: 80px;
            scrollbar-width: none;
        }

        .catelog-container {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
            padding: 0 10px;
        }

        .catelog {
            width: 35%;
            padding: 25px;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f7f7f7;
        }

        .catelog h2 {
            font-size: 15px;
            line-height: 1.5;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .catelog p {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .keywords {
            margin: 5px;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            background-color: #f39c12;
            color: white;
            font-size: 12px;
        }

        .card button:hover {
            background-color: #d35400;
        }

        .ai-comments {
            margin: 20px 10px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .comments-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            margin-top: 10px;
        }

        .coments {
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.05);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .coments h4 {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .coments p {
            font-size: 12px;
            color: #666;
            margin-bottom: 0;
        }

        /* 상태 태그 스타일 */
        .tag {
            display: inline-block;
            padding: 5px 10px;
            font-size: 12px;
            font-weight: bold;
            color: white;
            border-radius: 20px;
            margin-top: 5px;
        }

        .tag.basic {
            background-color: #3498db;
        }

        .tag.intermediate {
            background-color: #f39c12;
        }

        .tag.advanced {
            background-color: #e74c3c;
        }

        .bottom-menu {
            display: flex;
            justify-content: space-around;
            align-items: center;
            width: 100%;
            height: 75px;
            background-color: #ffffff;
            border-top: 1px solid black;
            border-bottom-left-radius: 18px;
            border-bottom-right-radius: 18px;
            position: absolute;
            bottom: 0;
            left: 0;
        }

        .menu-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            font-size: 12px;
            color: black;
            text-decoration: none;
            background: none;
            border: none;
            cursor: pointer;
            font-family: 'NoonnuBasicGothicRegular';
        }

        .menu-item img {
            width: 30px;
            height: 30px;
            margin-bottom: 5px;
            transition: filter 0.2s ease;
        }

        .menu-item:hover img {
            filter: invert(40%) sepia(100%) saturate(500%) hue-rotate(200deg) brightness(130%) contrast(150%);
        }

        .menu-button {
            background: none;
            border: none;
            font-size: 20px;
            color: white;
            position: absolute;
            top: 15px;
            right: 15px;
            cursor: pointer;
        }

        .menu-button img {
            width: 30px;
            height: 30px;
        }

        .popup-menu {
            display: none;
            position: absolute;
            top: 100px;
            right: 20px;
            width: 300px;
            padding: 40px 30px;
            background-color: white;
            border: 2px solid #2c3e50;
            border-radius: 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: left;
            font-family: 'NoonnuBasicGothicRegular';
            z-index: 1000;
        }

        .popup-buddy {
            width: 85px;
            height: 85px;
            position: absolute;
            /* 위치를 고정 */
            top: 20px;
            /* 상단 간격 */
            left: 20px;
            /* 좌측 간격 */
            transform: scaleX(1);
            /* 캐릭터 반전 유지 */
        }

        .popup-title {
            background-color: #2c3e50;
            padding: 10px;
            border-radius: 10px;
            font-size: 14px;
            color: rgba(255, 255, 255, 0.9);
            position: absolute;
            /* 위치를 고정 */
            top: 20px;
            /* 상단 여백 */
            left: 120px;
            /* 캐릭터와의 간격 */
            text-align: left;
            line-height: 1.5;
            width: 200px;
            /* 말풍선의 너비 조정 */
            font-family: 'NoonnuBasicGothicRegular';
        }

        .popup-title::after {
            content: "";
            position: absolute;
            left: -45px;
            top: 20px;
            border-width: 15px;
            border-left: 35px;
            border-bottom: 15px;
            border-top: 8px;
            border-style: solid;
            border-color: transparent #2c3e50 transparent transparent
        }

        .user-info {
            margin-top: 100px;
            /* 말풍선과 간격 */
        }

        .user-info p {
            margin-bottom: 10px;
            /* 항목 사이 간격 줄이기 */
            margin-top: 10px;
            /* 항목 위쪽 간격도 줄이기 */
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .user-info strong {
            font-weight: bold;
            color: #2c3e50;
        }

        .edit-button {
            background-color: #f39c12;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 15px 10px;
            cursor: pointer;
            font-size: 12px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .edit-button:hover {
            background-color: #d35400;
        }

        .edit-input {
            font-family: 'NoonnuBasicGothicRegular';
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            margin-left: 10px;
        }

        .closePopupButton {
            display: block;
            margin: 20px auto 0;
            /* 위쪽 여백 20px, 자동 중앙 정렬 */
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .closePopupButton:hover {
            background-color: #c0392b;
        }
    </style>
</head>

<body>
    <div class="DashBoard-container">
        <div class="header">EDU BUDDY
            <button id="menuButton" class="menu-button">
                <img src="../pic/myinfo.png" alt="내정보수정">
            </button>
        </div>

        <div id="popupMenu" class="popup-menu">
            <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="popup-buddy" alt="캐릭터 이미지">
            <div class="popup-title">
                <p>[사용자 이름]의 정보야<br>바꿀 부분이 있으면 수정도 가능해!</p>
            </div>
            <div class="user-info">
                <p><strong>이름:</strong>
                    <span id="name-display">노지성</span>
                    <input type="text" id="name-input" class="edit-input" style="display: none;" value="노지성">
                    <button class="edit-button" onclick="editField('name')">수정하기</button>
                </p>
                <p><strong>학년:</strong>
                    <span id="grade-display">중2</span>
                    <input type="text" id="grade-input" class="edit-input" style="display: none;" value="중2">
                    <button class="edit-button" onclick="editField('grade')">수정하기</button>
                </p>
                <p><strong>학교:</strong>
                    <span id="school-display">하계중학교</span>
                    <input type="text" id="school-input" class="edit-input" style="display: none;" value="하계중학교">
                    <button class="edit-button" onclick="editField('school')">수정하기</button>
                </p>
            </div>
            <button id="closePopupButton" class="closePopupButton">닫기</button>
        </div>

        <div class="contents">
            <div class="chat-container">
                <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="buddy">

                <div class="buddyChat">
                    <p>여기서는 {사용자 이름}이</p>
                    <p>얼마나 공부했는지,</p>
                    <p>어느 부분을 더 공부해야 하는지</p>
                    <p>알려주는 곳이야</p>
                </div>
            </div>

            <div class="catelog-container">
                <div class="catelog">
                    <h2>몇 일 공부했지?</h2>
                    <p><strong>35</strong> 일</p>
                    <div class="keywords">
                        <span>여태까지</span>
                    </div>
                    <div class="keywords">
                        <span>한달동안</span>
                    </div>
                </div>

                <div class="catelog">
                    <h2>몇 문제 풀었지?</h2>
                    <p><strong>${correctNumber}</strong> 문제</p>
                    <div class="keywords">
                        <span>여태까지</span>
                    </div>
                    <div class="keywords">
                        <span>한달동안</span>
                    </div>
                </div>
            </div>

            <div class="ai-coments">
                <h3>AI 코멘트</h3>
                <div class="comments-container">
                    <div class="coments">
                        <h4>국어</h4>
                        <span class="tag basic">개념</span>
                        <p>최근 많이 틀린 오답의 키워드 입력</p>
                    </div>

                    <div class="coments">
                        <h4>영어</h4>
                        <span class="tag intermediate">중급</span>
                        <p>최근 많이 틀린 오답의 키워드 입력</p>
                    </div>

                    <div class="coments">
                        <h4>수학</h4>
                        <span class="tag advanced">심화</span>
                        <p>최근 많이 틀린 오답의 키워드 입력</p>
                    </div>

                    <div class="coments">
                        <h4>사회</h4>
                        <span class="tag basic">개념</span>
                        <p>최근 많이 틀린 오답의 키워드 입력</p>
                    </div>

                    <div class="coments">
                        <h4>과학</h4>
                        <span class="tag advanced">심화</span>
                        <p>최근 많이 틀린 오답의 키워드 입력</p>
                    </div>

                    <div class="coments">
                        <h4>역사</h4>
                        <span class="tag intermediate">중급</span>
                        <p>최근 많이 틀린 오답의 키워드 입력</p>
                    </div>
                </div>
            </div>


            <jsp:include page="Menubar.jsp" />
        </div>
    </div>
    <script>
        const menuButton = document.getElementById("menuButton");
        const popupMenu = document.getElementById("popupMenu");

        // 팝업 열기/닫기
        menuButton.addEventListener("click", (e) => {
            e.stopPropagation(); // 이벤트 전파 방지
            popupMenu.style.display = popupMenu.style.display === "block" ? "none" : "block";
        });

        // 팝업 내부 클릭 시 닫히지 않게 설정
        popupMenu.addEventListener("click", (e) => {
            e.stopPropagation(); // 이벤트 전파 방지
        });

        // 외부 클릭 시 팝업 닫기
        window.addEventListener("click", () => {
            popupMenu.style.display = "none";
        });

        function editField(field) {
            const displayElement = document.getElementById(`${field}-display`);
            const inputElement = document.getElementById(`${field}-input`);
            const button = event.target;

            if (button.textContent === "수정하기") {
                // 전환: 텍스트 숨김, 입력 필드 표시
                displayElement.style.display = "none";
                inputElement.style.display = "inline-block";
                button.textContent = "저장하기"; // 버튼 텍스트 변경
            } else {
                // 저장: 입력값을 텍스트로 전환
                displayElement.textContent = inputElement.value;
                displayElement.style.display = "inline";
                inputElement.style.display = "none";
                button.textContent = "수정하기"; // 버튼 텍스트 복원
            }
        }

        const closePopupButton = document.getElementById("closePopupButton");

        // 닫기 버튼 클릭 시 팝업 닫기
        closePopupButton.addEventListener("click", () => {
            popupMenu.style.display = "none";
        });
    </script>
</body>
</html>