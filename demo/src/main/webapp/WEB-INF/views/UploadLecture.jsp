<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title></title>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        </head>
        <style>
            @font-face {
                font-family: 'NoonnuBasicGothicRegular';
                src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
                font-weight: normal;
                font-style: normal;
            }

            .loading-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                display: none;
                /* 초기에는 숨김 */
                justify-content: center;
                align-items: center;
                z-index: 9999;
            }

            .loading-content {
                text-align: center;
                color: white;
                font-family: 'NoonnuBasicGothicRegular';
            }

            .spinner {
                margin: 20px auto;
                width: 40px;
                height: 40px;
                border: 5px solid white;
                border-top: 5px solid #2c3e50;
                border-radius: 50%;
                animation: spin 1s linear infinite;
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }

                100% {
                    transform: rotate(360deg);
                }
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: white;
                margin: 0;
            }

            .Upload-container {
                display: flex;
                flex-direction: column;
                width: 100%;
                max-width: 400px;
                height: 85vh;
                border: 1px solid black;
                border-radius: 20px;
                background-color: white;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                position: relative;
                padding-bottom: 80px;
            }

            .header {
                font-size: 24px;
                font-weight: bold;
                padding: 10px;
                background-color: #2c3e50;
                color: white;
                border-top-left-radius: 18px;
                border-top-right-radius: 18px;
                font-family: 'NoonnuBasicGothicRegular';
            }

            .chat-container {
                flex-shrink: 0;
                display: flex;
                align-items: flex-start;
                padding: 8px;
                gap: 5px;
            }

            .buddy {
                width: 100px;
                height: auto;
                margin-right: 10px;
                margin-top: 40px;
            }

            .buddyChat {
                background-color: #2c3e50;
                padding: 10px;
                border-radius: 10px;
                font-size: 13px;
                line-height: 1.5;
                max-width: 80%;
                text-align: left;
                color: rgba(255, 255, 255, 0.792);
                font-family: 'NoonnuBasicGothicRegular';
            }

            /* 말풍선 구현 */
            .buddyChat::after {
                content: "";
                position: fixed;
                left: -190px;
                top: 125px;
                border-width: 20px;
                border-left: 294px;
                border-bottom: 15px;
                border-top: 8px;
                border-style: solid;
                border-color: transparent #2c3e50 transparent transparent
            }

            .category-tabs {
                display: flex;
                justify-content: space-around;
                padding: 10px 0;
                background-color: white;
                border-bottom: 1px solid #ddd;
            }

            .category-tab {
                flex: 1;
                margin: 0 16px;
                padding: 10px 0;
                text-align: center;
                font-size: 15px;
                font-weight: 900;
                color: black;
                background-color: transparent;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 10px 0;
                font-family: 'NoonnuBasicGothicRegular';

            }

            .category-tab.active {
                color: black;
                border-bottom: 2px solid black;
            }

            .recordings-container {
                flex: 1;
                display: flex;
                flex-direction: column;
                gap: 10px;
                padding: 20px;
                overflow-y: auto;
                background-color: #f9f9f9;
                border-top: 1px solid #ddd;
                scrollbar-width: none;
            }

            .recording-item {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                padding: 10px;
                background-color: #2c3e50;
                border: 1px solid #2c3e50;
                gap: 10px;
                position: relative;
                border-radius: 5px;
                box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            }

            .recording-content {
                font-size: 14px;
                color: rgba(255, 255, 255, 0.792);
                width: 100%;
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-family: 'NoonnuBasicGothicRegular';
            }

            .recording-date {
                font-size: 15px;
                color: rgba(255, 255, 255, 0.792);
                text-align: right;
                width: 100%;
                margin-top: 5px;
                font-family: 'NoonnuBasicGothicRegular';
            }

            .recording-button {
                display: inline-flex;
                justify-content: center;
                align-items: center;
                width: 100%;
                padding: 15px 140px;
                font-size: 16px;
                font-weight: bold;
                color: #333;
                background-color: white;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                margin-top: 10px;
                text-align: center;
                white-space: nowrap;
                box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
                font-family: 'NoonnuBasicGothicRegular';
            }

            .recording-button:hover {
                background-color: rgba(255, 255, 255, 0.792);
            }

            .recording-content p {
                margin: 5px 0;
                font-size: 16px;
                color: rgba(255, 255, 255, 0.792);
                font-family: 'NoonnuBasicGothicRegular';
            }

            .edit-button {
                background-color: #5db6c6;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 5px 10px;
                font-size: 12px;
                cursor: pointer;
                margin-left: 5px;
                font-family: 'NoonnuBasicGothicRegular';
            }

            .edit-button:hover {
                background-color: #98dde9;
            }

            .delete-button {
                background-color: #ff1a1a;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 5px 10px;
                font-size: 12px;
                cursor: pointer;
                margin-left: 5px;
                font-family: 'NoonnuBasicGothicRegular';
            }

            .delete-button:hover {
                background-color: #da7e7e;
            }

            .popup {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }

            .popup-content {
                background: white;
                padding: 20px;
                border-radius: 8px;
                width: 300px;
                text-align: center;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            }

            .popup-content h3 {
                margin: 0 0 10px;
            }

            .popup-content input {
                width: 90%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .popup-buttons {
                display: flex;
                justify-content: space-around;
            }

            .popup-buttons button {
                padding: 10px 20px;
                background-color: #2c3e50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .popup-buttons button:hover {
                background-color: #34495e;
            }

            /* 난이도 설정 팝업 스타일 */
            .difficulty-popup {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }

            .difficulty-popup-content {
                background: white;
                padding: 20px;
                border-radius: 10px;
                width: 300px;
                text-align: center;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
                font-family: 'NoonnuBasicGothicRegular';
            }

            .difficulty-popup-content h3 {
                margin: 0 0 10px;
                font-size: 25px;
                color: #333;
                font-family: 'NoonnuBasicGothicRegular';
            }

            .difficulty-popup-content p {
                font-size: 20px;
                color: #666;
                margin-bottom: 15px;
                font-family: 'NoonnuBasicGothicRegular';
            }

            .difficulty-popup-content label {
                display: block;
                margin: 8px 0;
                text-align: left;
                font-size: 20px;
                cursor: pointer;
                font-family: 'NoonnuBasicGothicRegular';
            }

            .difficulty-popup-content input[type="radio"] {
                margin-right: 8px;
            }

            .difficulty-popup-buttons {
                display: flex;
                justify-content: space-around;
                margin-top: 15px;
            }

            .difficulty-popup-buttons button {
                padding: 10px 20px;
                background-color: #2c3e50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .difficulty-popup-buttons button:hover {
                background-color: #34495e;
            }

            .bottom-menu {
                display: flex;
                justify-content: space-around;
                align-items: center;
                width: 100%;
                height: 80px;
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
        </style>
        </head>

        <body>

            <div id="loading-overlay" class="loading-overlay" style="display: none;">
                <div class="loading-content">
                    <p>텍스트로 변환 중...</p>
                    <div class="spinner"></div>
                </div>
            </div>

            <div class="Upload-container">
                <div class="header">EDU BUDDY</div>

                <div class="chat-container">
                    <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="buddy">

                    <div class="buddyChat">
                        <p><span id="userName">{사용자이름}</span>이 학습한 내용이야</span></p>
                        <p>이번엔 너가 녹음한 강의에서 중요한 내용을 뽑아서 문제를 만들어 줄게. 준비됐지?</p>
                        <p>문제 풀기를 시작하려면 학습하기 버튼을 눌러봐!</p>
                    </div>
                </div>

                <div class="category-tabs">
                    <button class="category-tab active">국어</button>
                    <button class="category-tab">영어</button>
                    <button class="category-tab">수학</button>
                    <button class="category-tab">사회</button>
                    <button class="category-tab">과학</button>
                    <button class="category-tab">역사</button>
                </div>

                <div class="recordings-container">
                    <c:forEach var="upload" items="${uploadList}">
                        <div class="recording-item">
                            <div class="recording-content">
                                <p>${upload.uploadFile}</p>
                                <div class="button-container">
                                    <button class="edit-button"
                                        onclick="EditPopup.show('${upload.uploadIdx}')">수정</button>

                                    <button class="delete-button"
                                        onclick="DeletePopup.show('${upload.uploadIdx}')">삭제</button>
                                </div>
                            </div>
                            <div class="recording-date">
                                <p>${upload.uploadDt}</p>
                            </div>
                            <div class="button-container">
                                <button class="recording-button"
                                    onclick="LearningPopup.show('${upload.uploadIdx}')">학습하기</button>
                            </div>
                        </div>

                    </c:forEach>
                </div>

                <div class="bottom-menu">
                    <button class="menu-item" onclick="location.href='Problem'">
                        <img src="http://edubuddy.dothome.co.kr/pic/book.svg" alt="문제 탐험대">
                        <span>문제 탐험대</span>
                    </button>
                    <button class="menu-item" onclick="location.href='Home'">
                        <img src="http://edubuddy.dothome.co.kr/pic/ai1.svg" alt="AI 학습관">
                        <span>AI 학습관</span>
                    </button>
                    <button class="menu-item" onclick="location.href='#dashboard'">
                        <img src="http://edubuddy.dothome.co.kr/pic/ox.svg" alt="다시도전">
                        <span>오답노트</span>
                    </button>
                    <button class="menu-item" onclick="location.href='#learning'">
                        <img src="http://edubuddy.dothome.co.kr/pic/status.svg" alt="학습여정">
                        <span>학습여정</span>
                    </button>
                </div>
            </div>

            <script>


                // 로딩 창 표시 함수
                function showLoading() {
                    const overlay = document.getElementById("loading-overlay");
                    if (overlay) {
                        overlay.style.display = "flex"; // 로딩 창 표시
                    }
                }

                // 로딩 창 숨김 함수
                function hideLoading() {
                    const overlay = document.getElementById("loading-overlay");
                    if (overlay) {
                        overlay.style.display = "none"; // 로딩 창 숨김
                    }
                }

                // 비동기 텍스트 변환 작업 (예제 Promise)
                function performTextConversion() {
                    return new Promise((resolve, reject) => {
                        setTimeout(() => {
                            const isSuccess = true; // 성공 여부 (예제)
                            if (isSuccess) {
                                resolve(); // 성공 시 resolve 호출
                            } else {
                                reject("변환 실패"); // 실패 시 reject 호출
                            }
                        }, 5000); // 예: 5초 후 완료
                    });
                }

                const EditPopup = {
                    show: function (idx) {
                        console.log(idx);

                        // 팝업창 생성
                        const popup = document.createElement('div');
                        popup.classList.add('popup');
                        popup.id = 'edit-popup';
                        popup.innerHTML = `
                    <div class="popup-content"> 
                        <input type="text" id="editTitleInput" value="수정한 파일명을 입력해주세요">
                        <div class="popup-buttons">
                           <button id="saveButton">변경</button>
                            <button id="cancelButton">취소</button>
                        </div>
                    </div>
                `;

                        // 팝업에 관련된 제목 요소 저장

                        // 팝업을 body에 추가
                        document.body.appendChild(popup);
                        document.getElementById('saveButton').addEventListener('click', () => EditPopup.save(idx));
                        document.getElementById('cancelButton').addEventListener('click', () => EditPopup.close(idx));
                    },
                    save: function (idx) {
                        console.log(idx);
                        const popup = document.getElementById('edit-popup');


                        if (popup) {
                            const newTitle = document.getElementById('editTitleInput').value; // 입력값 가져오기
                            console.log(newTitle);

                            if (newTitle) {
                                $.ajax({
                                    url: "/uploadEdit",
                                    type: "post",
                                    contentType: 'application/json', // 요청 데이터 형식
                                    data: JSON.stringify({
                                        idx: idx,
                                        newTitle: newTitle
                                    }), // JSON 형식의 데이터 전송
                                    success: function () {

                                        window.location.reload();

                                    },
                                    error: function (xhr, status, error) {
                                        console.error('수정 중 오류 발생:', error);
                                        alert('수정 중 문제가 발생했습니다. 다시 시도해주세요.');
                                    }

                                })

                            }
                            EditPopup.close(); // 팝업 닫기
                        }
                    },
                    close: function () {
                        const popup = document.getElementById('edit-popup');
                        if (popup) {
                            document.body.removeChild(popup); // 팝업 제거
                        }
                    }
                };


                // 삭제 팝업과 관련된 함수와 변수
                const DeletePopup = {
                    show: function (idx) {


                        // 팝업창 생성
                        const popup = document.createElement('div');
                        popup.classList.add('popup');
                        popup.id = 'delete-popup';
                        popup.innerHTML = `
                <div class="popup-content">
                    <p>정말 삭제할꺼야?</p>
                    <div class="popup-buttons">
                        <button id ='deleteButton'>삭제</button>
                        <button id ='closeButton'>취소</button>
                    </div>
                </div>
            `;

                        document.body.appendChild(popup); // 팝업을 body에 추가
                        document.getElementById('deleteButton').addEventListener('click', () => DeletePopup.confirm(idx));
                        document.getElementById('closeButton').addEventListener('click', () => DeletePopup.close(idx));
                    },
                    confirm: function (idx) {
                        $.ajax({
                            url: "/uploadDelete",
                            type: "post",
                            contentType: 'application/json', // 요청 데이터 형식
                            data: JSON.stringify({
                                idx: idx,

                            }), // JSON 형식의 데이터 전송
                            success: function () {

                                window.location.reload();// 팝업 닫기

                            },
                            error: function (xhr, status, error) {
                                console.error('수정 중 오류 발생:', error);
                                alert('수정 중 문제가 발생했습니다. 다시 시도해주세요.');
                            }


                        })

                    },
                    close: function (idx) {
                        const popup = document.getElementById('delete-popup');
                        if (popup) {
                            document.body.removeChild(popup); // 팝업 제거
                        }
                    }
                };

                const LearningPopup = {
                    show: function (idx) {
                        // 난이도 설정 팝업창 생성
                        const popup = document.createElement('div');
                        popup.classList.add('difficulty-popup');
                        popup.id = 'difficulty-popup';
                        popup.innerHTML = `
                <div class="difficulty-popup-content">
                <h3>난이도 설정</h3>
                <p>추천: 개념부터 학습하는 것을 추천 할께!</p>
                <form id="difficultyForm" action="/QuizMaker" method="POST">
                    <div>
                        <label>
                            <input type="radio" name="difficulty" value="개념" required> 개념
                        </label>
                        <label>
                            <input type="radio" name="difficulty" value="중급"> 중급
                        </label>
                        <label>
                            <input type="radio" name="difficulty" value="심화"> 심화
                        </label>
                    </div>
                    <input type="hidden" name="idx" value="${'${idx}'}">
                    <div class="difficulty-popup-buttons">
                        <button type="submit" id="enterButton">확인</button>
                        <button type="button" id="cancelButton">취소</button>
                    </div>
                </form>
            </div>
            `;
                        document.body.appendChild(popup); // 팝업을 body에 추가
                        document.getElementById('cancelButton').addEventListener('click', LearningPopup.close);
                    },

                    close: function () {
                        const popup = document.getElementById('difficulty-popup');
                        if (popup) {
                            document.body.removeChild(popup); // 팝업 제거
                        }
                    }
                };

            </script>

        </body>

        </html>