let mediaRecorder;
let recordedChunks = [];
let timer;
let seconds = 0;
let isPaused = false;
let isRecording = false;


// 타이머 업데이트
function updateTimer() {
    const recordingTime = document.getElementById('recordingTime');
    if (!recordingTime) return; // 요소가 없을 경우 안전하게 종료
    seconds++;
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    recordingTime.textContent = `${String(minutes).padStart(2, '0')}:${String(remainingSeconds).padStart(2, '0')}`;
}

// 타이머 시작
function startTimer() {
    if (!timer) {
        timer = setInterval(updateTimer, 1000); // 1초마다 updateTimer 호출
    }
}

// 타이머 정지
function stopTimer() {
    clearInterval(timer);
    timer = null;
    seconds = 0; // 시간 초기화
    const recordingTime = document.getElementById('recordingTime');
    if (recordingTime) {
        recordingTime.textContent = '00:00'; // 초기 시간 표시
    }
}

// 타이머 일시 정지
function pauseTimer() {
    clearInterval(timer);
    timer = null;
}

// 버튼 상태 변경
function toggleEffect(button) {
    const img = button.querySelector('img');
    const buttonId = button.id;

    // 모든 버튼의 active 클래스 제거 (초기화)
    resetButtonColors();

    // 녹음 정지 버튼 클릭 시 모든 버튼과 이미지를 초기화
    if (buttonId === "stop") {
        stopTimer(); // 타이머 정지
        resetButtonColors(); // 모든 버튼과 이미지 초기화
        stopRecording(); // 녹음 중지 및 업로드
        return; // 초기화 후 함수 종료
    }

    if (buttonId === "start") {
        startRecording(); // 녹음 시작
        button.classList.add('active');
    } else if (buttonId === "pause") {
        // 일시정지 시 녹음 시작 버튼 초기화
        const startButton = document.getElementById("start");
        if (startButton) {
            startButton.classList.remove("active"); // 녹음 시작 버튼 색 초기화
        }
        if (isPaused) {
            mediaRecorder.resume(); // 녹음 재개
            startTimer(); // 타이머 재개
            img.src = "http://edubuddy.dothome.co.kr/pic/btnPause_1.png"; // 원래 이미지
        } else {
            mediaRecorder.pause(); // 녹음 일시 정지
            pauseTimer(); // 타이머 멈춤
            img.src = "http://edubuddy.dothome.co.kr/pic/play.png"; // 변경된 이미지
        }
        isPaused = !isPaused; // 일시정지 상태 토글
        button.classList.add('active');
    }

    if (img) img.classList.add('active'); // 클릭된 버튼 이미지 활성화
}


// 녹음 시작
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
    startTimer(); // 타이머 시작
    document.getElementById("start").classList.add("active");
}

// 녹음 정지
function stopRecording() {
    if (mediaRecorder) {
        mediaRecorder.stop();
        mediaRecorder.onstop = () => {
            const audioBlob = new Blob(recordedChunks, { type: 'audio/webm' });
            recordedChunks = []; // 버퍼 초기화
            recordAudioAjax(audioBlob); // 음성파일 업로드
        };
    }
    resetButtonColors();
    stopTimer();
    isPaused = false; // 일시정지 상태 초기화
    console.log("녹음 정지");
}

// AJAX를 통해 음성 파일 업로드
function recordAudioAjax(audioBlob) {
    
    
    const formData = new FormData();
    formData.append("file", audioBlob, "recording.webm");
    showLoadingOverlay()
    $.ajax({
        url: 'upload-audio', // 서버 엔드포인트
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
          hideLoadingOverlay()
          window.location.reload();// 팝업 닫기
        },
        error: function (xhr, status, error) {
            console.error("업로드 실패:", error);
            alert("녹음 파일 업로드 중 문제가 발생했습니다.");
        }
    });
}

function updateButtonStates(state) {
    document.getElementById("start").disabled = (state === "recording");
    document.getElementById("pause").disabled = (state === "stopped");
    document.getElementById("stop").disabled = (state === "stopped");
}

function resetButtonColors() {
    document.querySelectorAll('.popup-buttons-item img').forEach(image => {
        image.classList.remove('active'); // 이미지 활성화 클래스 제거
        // 이미지의 src를 초기값으로 설정 (필요 시 추가)
        if (image.alt === "녹음 시작") {
            image.src = "http://edubuddy.dothome.co.kr/pic/btnrcod_1.png";
        } else if (image.alt === "일시 정지") {
            image.src = "http://edubuddy.dothome.co.kr/pic/btnPause_1.png";
        } else if (image.alt === "녹음 정지") {
            image.src = "http://edubuddy.dothome.co.kr/pic/btnstop_1.png";
        }
    });

    document.querySelectorAll('.popup-buttons-item').forEach(button => {
        button.classList.remove('active'); // 버튼 활성화 클래스 제거
    });
}

// 녹음 팝업 열기
function showPopup() {
    document.getElementById('popup').style.display = 'block';
}
function hidePopup() {
    document.getElementById('popup').style.display = 'none';
}

// 입력 창 초기화 함수
function clearText(input) {
    if (input.value === input.defaultValue) {
        input.value = "";
    }
}

function resetText(input, defaultText) {
    if (input.value === "") {
        input.value = defaultText;
    }
}

// 파일 등록 함수
function triggerFileUpload() {
    const fileInput = document.getElementById('fileInput');
    if (fileInput) {
        fileInput.click();
    }
    

}

function handleFileSelect(event) {
    const fileInput = event.target;
    const fileNameDisplay = document.getElementById("fileNameDisplay");

    if (fileInput.files.length > 0) {
        const fileName = fileInput.files[0].name; // 선택된 파일의 이름 가져오기
        if (fileNameDisplay) {
            fileNameDisplay.textContent = fileName; // 파일명을 표시
        }
    } else {
        if (fileNameDisplay) {
            fileNameDisplay.textContent = ""; // 파일이 없을 경우 파일명 표시 내용 초기화
        }
    }
}

function uploadLink(){
    showLoadingOverlay()
    console.log("uploadLink 도착")
    const youtubeLink = $("#Link").val().trim(); // jQuery로 값 가져오기

    if (youtubeLink === '' || youtubeLink === '여기에 링크 주소를 넣어줘') {
        alert("링크를 입력해주세요.");
        return;
    }

    // jQuery AJAX 요청
    $.ajax({
        url: 'youtubeLink', // 서버 엔드포인트
        type: 'POST',
        contentType: 'application/json', // JSON 형식으로 전송
        data: JSON.stringify({ youtubeLink: youtubeLink }), // 데이터 전송
        success: function (response) {
            hideLoadingOverlay()
            window.location.reload();// 팝업 닫기
        },
        error: function (xhr, status, error) {
            // 실패 시 처리
            console.error("Error:", error);
            alert("문제가 발생했습니다. 다시 시도해주세요.");
        }
    });
}

function uploadAudioAjax(){
    showLoadingOverlay()
    const fileInput = document.getElementById('fileInput');

    if (fileInput.files.length === 0) {
        alert("파일을 선택해주세요.");
        return;
    }

    const file = fileInput.files[0];
    const formData = new FormData();
    formData.append("file", file);

    $.ajax({
        url: '/upload-audio', // 서버 엔드포인트
        type: 'POST',
        processData: false,
        contentType: false,
        data: formData,
        success: function (response) {
            if (response.success) {
            
                hideLoadingOverlay()
                window.location.reload();// 팝업 닫기
                
            } else {
                alert(response.message);
            }
        },
        error: function (xhr, status, error) {
            console.error("Error:", error);
            alert("파일 업로드 중 오류가 발생했습니다.");
        }
    });
}


// 로딩 오버레이를 보여주는 함수
function showLoadingOverlay() {
    const loadingOverlay = document.getElementById('loading-overlay');
    if (loadingOverlay) {
        loadingOverlay.style.display = 'flex';
    }
}

// 로딩 오버레이를 숨기는 함수
function hideLoadingOverlay() {
    
    const loadingOverlay = document.getElementById('loading-overlay');
    if (loadingOverlay) {
        alert("변환이 완료되었습니다.")
        loadingOverlay.style.display = 'none';
    }
}



// 이벤트 바인딩 또는 함수 호출
document.addEventListener('DOMContentLoaded', () => {
    // "학습하기" 버튼 클릭 시 텍스트 변환 작업 시작
    const learningButtons = document.querySelectorAll('.recording-button');
    learningButtons.forEach(button => {
        button.addEventListener('click', convertTextToSpeech);
    });
});