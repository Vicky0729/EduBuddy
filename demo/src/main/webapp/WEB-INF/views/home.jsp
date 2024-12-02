<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                    height: 100vh;
                    background-color: white;
                    margin: 0;
                }

                .Home-container {
                    width: 100%;
                    max-width: 400px;
                    height: 97vh;
                    border: 2px solid black;
                    border-radius: 20px;
                    position: relative;
                    background-color: white;
                    display: flex;
                    flex-direction: column;
                    justify-content: space-between;
                    overflow: hidden;
                    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                }

                .header {
                    font-size: 20px;
                    font-weight: bold;
                    text-align: left;
                    padding: 10px;
                    background-color: #2c3e50;
                    color: white;
                    border-top-left-radius: 8px;
                    border-top-right-radius: 8px;
                    font-family: 'NoonnuBasicGothicRegular';
                }

                .chat-container {
                    display: flex;
                    align-items: center;
                    padding: 20px;
                    padding-bottom: 10px;
                }

                .buddyChat {
                    background-color: #2c3e50;
                    padding: 15px;
                    border-radius: 10px;
                    font-size: 14px;
                    line-height: 1.4;
                    max-width: 70%;
                    text-align: left;
                    color: rgba(255, 255, 255, 0.792);
                    font-family: 'NoonnuBasicGothicRegular';
                }

                /* 채팅방형태 구현 */
                .buddyChat::after {
                    content: "";
                    position: absolute;
                    left: 80px;
                    top: 120px;
                    border-width: 15px;
                    border-left: 35px;
                    border-bottom: 15px;
                    border-top: 8px;
                    border-style: solid;
                    border-color: transparent #2c3e50 transparent transparent
                }

                /* 캐릭터 이미지 크기 조절 */
                .buddy {
                    width: 100px;
                    height: 100px;
                    margin-right: 5px;
                }

                /* 녹음,일시정지,중단 버튼 이미지 설정 */
                .buttons-item img {
                    width: 35px;
                    height: 35px;
                    margin-bottom: 5px;
                    padding: 0 45px;
                }

                /* active 효과: 색 반전과 회전 */
                .buttons-item img.active {
                    filter: invert(30%) sepia(250%) saturate(500%) hue-rotate(-60deg) brightness(100%) contrast(300%);
                }

                /* 녹음,일시정지,중단 버튼 글씨 조절 */
                .buttons-item {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    font-size: 12px;
                    color: black;
                    text-decoration: none;
                    background: none;
                    border: none;
                    cursor: pointer;
                    margin-top: 15px;
                    font-family: 'NoonnuBasicGothicRegular';
                }

                /* 녹음,일시정지,중단 버튼 위치설정 */
                .recording-buttons {
                    display: flex;
                    justify-content: center;
                    gap: 10px;
                    margin-bottom: 5px;
                }


                .recording-time {
                    text-align: center;
                    /* 중앙 정렬 */
                    font-size: 16px;
                    /* 글자 크기 조정 */
                    font-weight: bold;
                    color: red;
                    margin-top: -10px;
                    /* 버튼과 간격 조정 */
                    font-family: 'NoonnuBasicGothicRegular';
                    position: relative;
                    top: 10px;
                    /* 타이머 위치 조정 */
                }

                .upload-section {
                    display: flex;
                    flex-direction: column;
                    padding: 0 20px;
                    margin-bottom: 100px;
                }

                /* '링크로 온라인 강의 가져오기', '파일업로드' 라벨 위치크기 설정 */
                .link-input label,
                .file-upload-label {
                    display: block;
                    margin-top: 5px;
                    margin-bottom: 5px;
                    text-align: left;
                    font-weight: bold;
                    font-family: 'NoonnuBasicGothicRegular';
                }


                /* '여기에 링크 주소 넣어줘 input' 설정 */
                .link-input input {
                    padding: 23px;
                    border-radius: 5px;
                    border: 1px solid #ccc;
                    font-size: 13px;
                    margin-bottom: 10px;
                    font-family: 'NoonnuBasicGothicRegular';
                    width: calc(100% - 45px);
                    color: black;
                    text-align: center;
                }

                .uploadContainer {
                    padding: 12px;
                    border-radius: 5px;
                    border: 1px solid #ccc;
                    font-size: 13px;
                    margin-bottom: 10px;
                    font-family: 'NoonnuBasicGothicRegular';
                    width: 94%;
                    text-align: center;
                    cursor: pointer;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                }

                /* 파일 업로드 아이콘 */
                .upload-icon {
                    width: 30px;
                    height: 30px;
                }

                /* '음성파일 불러오기' 버튼 위치 크기 설정 */
                .link-input button {
                    width: 101%;
                    padding: 20px;
                    background-color: #2c3e50;
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    font-size: 14px;
                    font-family: 'NoonnuBasicGothicRegular';
                    margin-bottom: 12px;
                }

                /* '파일 업로드' 버튼 설정 */
                .upload-button button {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    width: 101%;
                    max-width: 400px;
                    height: 50px;
                    background-color: #2c3e50;
                    color: white;
                    font-size: 14px;
                    font-weight: bold;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                }

                /* 버튼 효과 설정 */
                .link-input button:hover,
                .upload-button button:hover {
                    background-color: #13202d;
                }


                .botton-menu {
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

                .file-name-display {
                    display: none;
                    /* 기본적으로 숨김 */
                    font-size: 14px;
                    color: #000;
                    text-align: center;
                    margin-top: 5px;
                }
            </style>
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
                    <button id="start" class="buttons-item" onclick="startRecording()">
                        <img src="http://edubuddy.dothome.co.kr/pic/btnrcod_1.png" alt="녹음 시작">
                        <span>녹음 시작</span>
                    </button>
                    <button id="pause" class="buttons-item" onclick="togglePause()" disabled>
                        <img src="http://edubuddy.dothome.co.kr/pic/btnPause_1.png" alt="일시 정지">
                        <span>일시 정지</span>
                    </button>
                    <button id="stop" class="buttons-item" onclick="stopRecording()" disabled>
                        <img src="http://edubuddy.dothome.co.kr/pic/btnstop_1.png" alt="녹음 중지">
                        <span>녹음 중지</span>
                    </button>
                </div>


                <div class="upload-section">
                    <div class="link-input">
                        <label>링크 업로드</label>
                        <input type="text" value="여기에 링크 주소를 넣어줘" onfocus="clearText(this)"
                            onblur="resetText(this, '여기에 링크 주소를 넣어줘')">
                        <button>음성파일 업로드</button>
                    </div>

                    <div class="file-upload">
                        <form action="${pageContext.request.contextPath}/upload-audio" method="post"
                            enctype="multipart/form-data">
                            <label class="file-upload-label">파일 업로드</label>
                            <div class="uploadContainer" id="uploadContainer" onclick="triggerFileUpload()">
                                <img src="http://edubuddy.dothome.co.kr/pic/file_add.svg" alt="파일 업로드 이미지"
                                    class="upload-icon" id="uploadIcon">
                                <span id="fileNameDisplay" class="file-name-display"></span>
                            </div>
                            <div class="upload-button">
                                <button class="upload-button" type="submit">파일 업로드</button>
                            </div>
                            <!-- 숨겨진 파일 입력 필드 -->
                            <input type="file" id="fileInput" name="file" onchange="handleFileSelect(event)"
                                style="display: none;">
                        </form>
                    </div>


                </div>

                <div class="botton-menu">
                    <button class="menu-item" onclick="location.href='Home'">
                        <img src="http://edubuddy.dothome.co.kr/pic/ai1.svg" alt="AI 학습관">
                        <span>AI 학습관</span>
                    </button>
                    <button class="menu-item" onclick="location.href='Problem'">
                        <img src="http://edubuddy.dothome.co.kr/pic/book.svg" alt="문제 탐험대">
                        <span>문제 탐험대</span>
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

                let mediaRecorder;
                let recordedChunks = [];
                let timer;
                let seconds = 0;
                let isPaused = false;

                async function startRecording() {
                    const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
                    mediaRecorder = new MediaRecorder(stream);

                    mediaRecorder.ondataavailable = (event) => {
                        if (event.data.size > 0) {
                            recordedChunks.push(event.data);
                        }
                    };

                    mediaRecorder.start();
                    console.log("녹음 시작");
                    startTimer();
                    updateButtonStates("recording");
                }

                function togglePause() {
                    if (mediaRecorder) {
                        if (isPaused) {
                            mediaRecorder.resume();
                            startTimer();
                            console.log("녹음 재개");
                            updateButtonStates("recording");
                        } else {
                            mediaRecorder.pause();
                            clearInterval(timer);
                            console.log("녹음 일시 정지");
                            updateButtonStates("paused");
                        }
                        isPaused = !isPaused;
                    }
                }

                function stopRecording() {
                    if (mediaRecorder) {
                        mediaRecorder.stop();
                        clearInterval(timer);
                        seconds = 0;
                        console.log("녹음 중지");

                        mediaRecorder.onstop = () => {
                            const recording = new Blob(recordedChunks, { type: 'audio/webm' });
                            recordedChunks = [];
                            uploadAudioSync(recording);
                        };

                        updateButtonStates("stopped");
                        document.getElementById('recordingTime').textContent = "00:00";
                    }
                }

                function uploadAudioSync(recording) {
                    const xhr = new XMLHttpRequest();
                    xhr.open("POST", "upload-audio", false);
                    const formData = new FormData();
                    formData.append("file", recording, "recording.webm");

                    xhr.onload = function () {
                        if (xhr.status === 200) {
                            console.log("업로드 성공");
                        } else {
                            console.log("업로드 실패");
                        }
                    };

                    xhr.onerror = function () {
                        console.log("연결 실패");
                    };

                    xhr.send(formData);
                }

                function updateButtonStates(state) {
                    document.getElementById("start").disabled = (state === "recording");
                    document.getElementById("pause").disabled = (state === "stopped");
                    document.getElementById("stop").disabled = (state === "stopped");
                }

                function startTimer() {
                    timer = setInterval(() => {
                        seconds++;
                        const minutes = Math.floor(seconds / 60);
                        const remainingSeconds = seconds % 60;
                        document.getElementById('recordingTime').textContent =
                            `${minutes.toString().padStart(2, '0')}:${remainingSeconds.toString().padStart(2, '0')}`;
                    }, 1000);
                }

                function clearText(input) {
                    if (input.value === input.defaultValue) input.value = "";
                }

                function resetText(input, defaultText) {
                    if (input.value === "") input.value = defaultText;
                }
                function triggerFileUpload() {
                    const fileInput = document.getElementById('fileInput');
                    if (fileInput) {
                        fileInput.click();
                    }
                }
                function handleFileSelect(event) {
                    const fileInput = event.target;
                    const fileNameDisplay = document.getElementById("fileNameDisplay");
                    const uploadContainer = document.getElementById("uploadContainer");
                    const uploadIcon = document.getElementById("uploadIcon");

                    if (fileInput.files.length > 0) {
                        const fileName = fileInput.files[0].name; // 선택된 파일의 이름 가져오기

                        // 이미지 숨기고 파일 이름 표시
                        uploadIcon.style.display = "none";
                        fileNameDisplay.textContent = fileName; // 파일명을 표시
                        fileNameDisplay.style.display = "block"; // 파일명 표시
                    } else {
                        // 이미지 다시 표시하고 파일명 초기화
                        uploadIcon.style.display = "block";
                        fileNameDisplay.textContent = "";
                        fileNameDisplay.style.display = "none";
                    }
                }
            </script>
        </body>

        </html>