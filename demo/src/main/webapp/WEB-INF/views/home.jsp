<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Edubuddy</title>
            <link rel="stylesheet" href="/css/home.css" />
        </head>

        <body>
            <div class="Home-container">
                <div class="header">EDU BUDDY</div>

                <div class="chat-container">
                    <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="buddy">
                    <div class="buddyChat">
                        <span>안녕~👋 내 이름은 Buddy</span><br>
                        <span>최신 "인공지능" 기능을 활용해서 앞으로</span><br>
                        <span>너의 공부를 도와줄 친구</span>
                    </div>
                </div>

                <div class="upload-section">
                    <div class="link-input">
                        <label>링크 업로드</label>
                        <input id="Link" type="text" value="여기에 링크 주소를 넣어줘" onfocus="clearText(this)"
                            onblur="resetText(this, '여기에 링크 주소를 넣어줘')">
                        <button onclick="uploadLink()">음성파일 업로드</button>
                    </div>

                    <div class="file-upload">
                        <label class="file-upload-label">파일 업로드</label>
                        <div class="uploadContainer" id="uploadContainer" onclick="triggerFileUpload()">
                            <img src="http://edubuddy.dothome.co.kr/pic/file_add.svg" alt="파일 업로드 이미지"
                                class="upload-icon" id="uploadIcon">
                            <span id="fileNameDisplay" class="file-name-display"></span>
                        </div>
                        <div class="upload-button">
                            <button class="upload-button" type="button" onclick="uploadAudioAjax()">파일 업로드</button>
                        </div>
                        <!-- 숨겨진 파일 입력 필드 -->
                        <input type="file" id="fileInput" name="file" onchange="handleFileSelect(event)"
                            style="display: none;">
                    </div>



                </div>

                <div class="bottom-menu">
                    <button class="menu-item" onclick="location.href='UploadLecturePage'">
                        <img src="http://edubuddy.dothome.co.kr/pic/book.svg" alt="문제 탐험대">
                        <span>문제 탐험대</span>
                    </button>
                    <button class="menu-item" onclick="location.href='HomePage'">
                        <img src="http://edubuddy.dothome.co.kr/pic/ai1.svg" alt="AI 학습관">
                        <span>AI 학습관</span>
                    </button>
                    <!-- 팝업 버튼 -->
                    <button class="menu-item popup-button" onclick="showPopup()"></button>
                    <button class="menu-item" onclick="location.href='ReviewPage'">
                        <img src="http://edubuddy.dothome.co.kr/pic/ox.svg" alt="다시도전">
                        <span>오답노트</span>
                    </button>
                    <button class="menu-item" onclick="location.href='DashBoardPage'">
                        <img src="http://edubuddy.dothome.co.kr/pic/status.svg" alt="학습여정">
                        <span>학습여정</span>
                    </button>
                </div>

                <!-- 팝업 -->
                <div id="popup">
                    <h2>녹음하기</h2>
                    <div class="recording-time" id="recordingTime">00:00</div>
                    <div class="popup-buttons">
                        <button id="start" class="popup-buttons-item" onclick="toggleEffect(this)">
                            <img src="http://edubuddy.dothome.co.kr/pic/btnrcod_1.png" alt="녹음 시작">
                            <span>녹음 시작</span>
                        </button>
                        <button id="pause" class="popup-buttons-item" onclick="toggleEffect(this)">
                            <img src="http://edubuddy.dothome.co.kr/pic/btnPause_1.png" alt="일시 정지">
                            <span>일시 정지</span>
                        </button>
                        <button id="stop" class="popup-buttons-item" onclick="toggleEffect(this)">
                            <img src="http://edubuddy.dothome.co.kr/pic/btnstop_1.png" alt="녹음 정지">
                            <span>녹음 정지</span>
                        </button>
                    </div>
                    <button class="close" onclick="hidePopup()">닫기</button>
                </div>
            </div>

            <!-- <jsp:include page="Menubar.jsp" /> -->
            </div>

            <script src="/js/home.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        </body>

        </html>