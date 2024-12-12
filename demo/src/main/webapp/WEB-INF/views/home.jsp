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

                <div class="recording-time" id="recordingTime">00:00</div>
                <div class="recording-buttons">
                    <button id="start" class="buttons-item" onclick="toggleEffect(this)">
                        <img src="http://edubuddy.dothome.co.kr/pic/btnrcod_1.png" alt="녹음 시작">
                        <span>녹음 시작</span>
                    </button>
                    <button id="pause" class="buttons-item" onclick="toggleEffect(this)">
                        <img src="http://edubuddy.dothome.co.kr/pic/btnPause_1.png" alt="일시 정지">
                        <span>일시 정지</span>
                    </button>
                    <button id="stop" class="buttons-item" onclick="toggleEffect(this)">
                        <img src="http://edubuddy.dothome.co.kr/pic/btnstop_1.png" alt="녹음 정지">
                        <span>녹음 정지</span>
                    </button>
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

                <jsp:include page="Menubar.jsp" />
            </div>

            <script src="/js/home.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        </body>

        </html>