<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuizMaker</title>
</head>
style>
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
            margin: 0;
            background-color: #f9f9f9;
            font-family: 'NoonnuBasicGothicRegular';
        }

        .Quiz-container {
            display: flex;
            flex-direction: column;
            width: 90%;
            max-width: 400px;
            height: 90vh;
            border: 1px solid #ddd;
            border-radius: 15px;
            background-color: white;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
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

        .question-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: bold;
            color: black;
            font-family: 'NoonnuBasicGothicRegular';
            position: relative;
        }

        .question-header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 15px;
            right: 15px;
            height: 2px;
            background-color: black;
        }

        .left-section {
            font-size: 16px;
            font-weight: bold;
        }

        .right-section {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .difficulty-label {
            font-size: 16px;
            font-weight: bold;
            color: black;
        }

        .dropdown-button {
            background-color: white;
            border: none;
            border-radius: 5px;
            padding: 6px 10px;
            font-size: 16px;
            cursor: pointer;
            font-family: 'NoonnuBasicGothicRegular';
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            top: 35px;
            right: 0;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            width: 120px;
        }

        .dropdown-menu.show {
            display: block;
        }

        .dropdown-menu button {
            width: 100%;
            padding: 10px;
            text-align: left;
            border: none;
            background: none;
            cursor: pointer;
            font-size: 14px;
            font-family: 'NoonnuBasicGothicRegular';
        }

        .dropdown-menu button:hover {
            background-color: #f0f0f0;
        }

        .keyword-box {
            display: flex;
            justify-content: flex-start;
            gap: 10px;
            margin: 10px 20px;
            flex-wrap: wrap;
        }

        .keyword-item {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 5px 10px;
            background-color: #f9f9f9;
            font-size: 14px;
            font-weight: bold;
            color: #2c3e50;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .mark-button {
            position: absolute;
            top: 50px;
            right: 12px;
            background-color: transparent;
            border: none;
            padding: 0;
            cursor: pointer;
        }

        .mark-button img {
            width: 35px;
            height: 35px;
            margin-top: 5px;
            transition: transform 0.3s ease;
        }
        
        .left-section {
            font-size: 16px;
            font-weight: bold;
        }

        .top-section {
            text-align: center;
            padding: 20px;
        }

        .main-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
        }

        .main-image {
            width: 90%;
            max-height: 200px;
            object-fit: contain;
            border-radius: 10px;
            border: 1px solid #ddd;
            background-color: #fff;
        }

        .bottom-section {
            padding: 20px;
            flex: 1;
            overflow-y: scroll;
            scrollbar-width: none;
            height: 30vh;
        }

        .sub-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #444;
        }

        .choices {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .choice-item {
            padding: 5px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .choice-item:hover {
            background-color: #f0f0f0;
            border-color: #aaa;
        }

        .choice-item.selected {
            background-color: #2c3e50;
            color: white;
            border-color: #2c3e50;
        }

        .popup-container {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            max-width: 400px;
            height: 50vh;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            padding: 30px;
            z-index: 1000;
        }

        .popup-header {
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .popup-content {
            text-align: left;
            font-size: 16px;
            line-height: 1.5;
            margin-bottom: 30px;
            color: #444;
        }
        
        .popup-content strong {
            color: #000;
        }

        .popup-content hr {
            margin: 15px 0;
            border: 0;
            border-top: 1px solid #ddd;
        }

        .popup-close {
            background-color: #2c3e50;
            color: white;
            border: none;
            padding: 10px 30px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }

        .popup-close:hover {
            background-color: #1a252f;
        }

        .navigation-buttons {
            position: absolute;
            bottom: 90px;
            left: 0;
            width: 100%;
            display: flex;
            justify-content: space-around;
            padding: 10px 0;
            background-color: transparent;
            border-top: none;
            z-index: 10;
        }

        .nav-button {
            background-color: transparent;
            border: none;
            border-radius: 50%;
            width: 60px;
            height: 30px;
            font-size: 14px;
            font-weight: bold;
            color: #333;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: all 0.3s ease;
        }

        .nav-button img {
            width: 45px;
        }

        .nav-button:hover img {
            filter: invert(18%) sepia(58%) saturate(600%) hue-rotate(150deg) brightness(90%) contrast(100%);
        }

        .nav-button:disabled {
            background-color: #eee;
            color: #999;
            cursor: not-allowed;
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
    </style>
</head>

<body>
    <div class="Quiz-container">
        <div class="header">EDU BUDDY</div>

        <!-- 문제 영역 -->
        <div id="question-section">
            <!-- 문제 1 -->
            <div class="question" style="display: block;">
                <div class="question-header">
                    <div class="left-section">문제 1</div>
                    <div class="right-section">
                        <span class="difficulty-label">난이도 : </span>
                        <button id="current-difficulty" class="dropdown-button">개념</button>
                    </div>
                    <button class="mark-button" onclick="togglemark(this)">
                        <img src="http://edubuddy.dothome.co.kr/pic/saveB.svg" alt="찜버튼">
                    </button>
                </div>

                <!-- 키워드 표시 영역 -->
                <div class="keyword-box">
                    <div class="keyword-item">묽은 염산</div>
                    <div class="keyword-item">반응 속도</div>
                    <div class="keyword-item">화학</div>
                </div>

                <div class="top-section">
                    <div class="main-title">과학: 묽은 염산의 대표 문제</div>
                    <img class="main-image" src="example-image1.png" alt="문제 이미지">
                </div>

                <div class="bottom-section">
                    <div class="sub-title">다음 중 묽은 염산과 관련이 없는 것은?</div>
                    <div class="choices">
                        <div class="choice-item">1. 반응 속도 증가</div>
                        <div class="choice-item">2. 중화 반응</div>
                        <div class="choice-item">3. 염화 나트륨 생성</div>
                        <div class="choice-item">4. 전류 흐름</div>
                        <div class="choice-item">5. 백만 볼트</div>
                    </div>
                </div>
            </div>

            <!-- 문제 2 -->
            <div class="question" style="display: none;">
                <div class="question-header">
                    <div class="left-section">문제 2</div>
                    <div class="right-section">
                        <span class="difficulty-label">난이도 : </span>
                        <button id="current-difficulty" class="dropdown-button">중급</button>
                    </div>
                    <button class="mark-button" onclick="togglemark(this)">
                        <img src="http://edubuddy.dothome.co.kr/pic/saveB.svg" alt="찜버튼">
                    </button>
                </div>

                <!-- 키워드 표시 영역 -->
                <div class="keyword-box">
                    <div class="keyword-item">역사</div>
                    <div class="keyword-item">삼국시대</div>
                    <div class="keyword-item">사건</div>
                </div>

                <div class="top-section">
                    <div class="main-title">역사: 삼국 시대 주요 사건</div>
                    <img class="main-image" src="example-image2.png" alt="문제 이미지">
                </div>

                <div class="bottom-section">
                    <div class="sub-title">다음 중 삼국 시대와 관련이 없는 것은?</div>
                    <div class="choices">
                        <div class="choice-item">1. 백제의 무령왕릉 발굴</div>
                        <div class="choice-item">2. 신라의 화랑도 설립</div>
                        <div class="choice-item">3. 조선의 경복궁 건립</div>
                        <div class="choice-item">4. 고구려의 천리장성 축조</div>
                        <div class="choice-item">4. 고구려의 천리장성 축조</div>
                    </div>
                </div>
            </div>

            <!-- 문제 3 -->
            <div class="question" style="display: none;">
                <div class="question-header">
                    <div class="left-section">문제 3</div>
                    <div class="right-section">
                        <span class="difficulty-label">난이도 : </span>
                        <button id="current-difficulty" class="dropdown-button">심화</button>
                    </div>
                    <button class="mark-button" onclick="togglemark(this)">
                        <img src="http://edubuddy.dothome.co.kr/pic/saveB.svg" alt="찜버튼">
                    </button>
                </div>

                <!-- 키워드 표시 영역 -->
                <div class="keyword-box">
                    <div class="keyword-item">지구 과학</div>
                    <div class="keyword-item">지진</div>
                    <div class="keyword-item">판 구조론</div>
                </div>

                <div class="top-section">
                    <div class="main-title">지구 과학: 지진과 판 구조론</div>
                    <img class="main-image" src="example-image3.png" alt="문제 이미지">
                </div>

                <div class="bottom-section">
                    <div class="sub-title">다음 중 지진과 직접 관련이 없는 것은?</div>
                    <div class="choices">
                        <div class="choice-item">1. 해구</div>
                        <div class="choice-item">2. 판의 경계</div>
                        <div class="choice-item">3. 맨틀 대류</div>
                        <div class="choice-item">4. 대기 대순환</div>
                        <div class="choice-item">4. 대기 대순환</div>
                    </div>
                </div>
            </div>
        </div>



        <!-- 내비게이션 버튼 영역 -->
        <div class="navigation-buttons">
            <button class="nav-button" id="prev-button" onclick="prevQuestion()">
                <img src="http://edubuddy.dothome.co.kr/pic/previous.png" alt="이전문제">
            </button>
            <button class="nav-button" id="check-answer-button" onclick="openPopup()">
                <img src="http://edubuddy.dothome.co.kr/pic/hint.png" alt="정답확인">
            </button>
            <button class="nav-button" id="next-button" onclick="nextQuestion()">
                <img src="http://edubuddy.dothome.co.kr/pic/next.png" alt="다음문제">
            </button>
            <button class="nav-button" id="result-button" style="display: none;" onclick="goToResult()">
                <img src="http://edubuddy.dothome.co.kr/pic/next.png" alt="결과페이지로이동">
            </button>
        </div>

        <!-- 팝업창 -->
        <div class="popup-container" id="popup">
            <div class="popup-header">해설</div>
            <div class="popup-content">
                <p><strong>내가 고른 답:</strong> 선택한 답안</p>
                <p><strong>정답:</strong> 올바른 정답</p>
                <hr>
                <p><strong>설명:</strong> 해설 내용</p>
            </div>
            <button class="popup-close" onclick="closePopup()">닫기</button>
        </div>

        <div class="botton-menu">
            <button class="menu-item" onclick="location.href='#problem'">
                <img src="http://edubuddy.dothome.co.kr/pic/book.svg" alt="문제 탐험대">
                <span>문제 탐험대</span>
            </button>
            <button class="menu-item" onclick="location.href='#home'">
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
        function togglemark(button) {
            // 버튼의 이미지 요소 가져오기
            const img = button.querySelector("img");

            // "active" 클래스를 토글
            button.classList.toggle("active");

            // 이미지 소스를 변경
            if (button.classList.contains("active")) {
                // 활성화 상태 (찜 추가 상태)
                img.src = "http://edubuddy.dothome.co.kr/pic/saveA.svg"; // 활성화된 이미지 경로
            } else {
                // 비활성화 상태 (찜 해제 상태)
                img.src = "http://edubuddy.dothome.co.kr/pic/saveB.svg"; // 기본 이미지 경로
            }
        }

        let currentQuestionIndex = 0;
        const questions = document.querySelectorAll(".question");
        const prevButton = document.getElementById("prev-button");
        const nextButton = document.getElementById("next-button");
        const checkAnswerButton = document.getElementById("check-answer-button");
        const resultButton = document.getElementById("result-button");
        const popup = document.getElementById("popup");
        const popupContent = document.querySelector(".popup-content");

        // 문제 해설 데이터
        const explanations = [
            { answer: "백만 볼트", correct: "전류 흐름", explanation: "묽은 염산은 전기 전도성을 가지지만 백만 볼트와 관련이 없습니다." },
            { answer: "조선의 경복궁 건립", correct: "신라의 화랑도 설립", explanation: "조선 시대의 사건으로 삼국 시대와 관련이 없습니다." },
            { answer: "대기 대순환", correct: "맨틀 대류", explanation: "대기는 판 구조론과 직접적인 관련이 없습니다." }
        ];

        // 현재 문제 표시
        function showCurrentQuestion() {
            // 모든 문제의 보기를 업데이트
            questions.forEach((q, index) => {
                q.style.display = index === currentQuestionIndex ? "block" : "none";
            });

            // 첫 번째 문제
            prevButton.style.display = currentQuestionIndex === 0 ? "none" : "inline-block"; // 이전 버튼 숨기기
            nextButton.style.display = currentQuestionIndex === questions.length - 1 ? "none" : "inline-block"; // 마지막 문제에서 다음 버튼 숨기기
            checkAnswerButton.style.display = currentQuestionIndex === questions.length - 1 ? "inline-block" : "inline-block"; // 정답 확인 항상 표시
            resultButton.style.display = currentQuestionIndex === questions.length - 1 ? "inline-block" : "none"; // 마지막 문제에서만 결과 페이지 버튼 표시
        }

        // 다음 문제로 이동
        function nextQuestion() {
            if (currentQuestionIndex < questions.length - 1) {
                currentQuestionIndex++;
                showCurrentQuestion();
            }
        }

        // 이전 문제로 이동
        function prevQuestion() {
            if (currentQuestionIndex > 0) {
                currentQuestionIndex--;
                showCurrentQuestion();
            }
        }

        function openPopup() {
            const data = explanations[currentQuestionIndex];
            document.querySelector(".popup-content").innerHTML = `
            <p><strong>내가 고른 답:</strong> ${data.answer}</p>
            <p><strong>정답:</strong> ${data.correct}</p>
            <hr>
            <p><strong>해설</strong></p>
            <p>${data.explanation}</p>
        `;  
            document.getElementById("popup").style.display = "block";
        }

        function closePopup() {
            document.getElementById("popup").style.display = "none";
        }

        function goToResult() {
            location.href = "CheckAnswer.html"
        }

        // 선택 이벤트 추가
        document.querySelectorAll('.choice-item').forEach(item => {
            item.addEventListener('click', () => {
                // 선택 상태 초기화
                document.querySelectorAll('.choice-item').forEach(choice => {
                    choice.classList.remove('selected');
                });
                // 클릭된 항목에 선택 상태 적용
                item.classList.add('selected');
            });
        });
        // 초기화
        showCurrentQuestion();
    </script>
</body>
</html>