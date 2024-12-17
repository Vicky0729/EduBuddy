
function togglemark(button) {
    // 버튼의 이미지 요소 가져오기
    const img = button.querySelector("img");

    console.log(img);


     // 초기 상태 판단: 현재 이미지 src가 활성화된 이미지인지 확인
     if (img.src.includes("saveA.svg")) {
        // 활성화된 이미지가 로드된 상태라면, 버튼에 "active" 클래스를 추가
        button.classList.add("active");
    } else {
        // 비활성화된 이미지가 로드된 상태라면, 버튼에 "active" 클래스를 제거
        button.classList.remove("active");
    }

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
let selectedAnswers = {}; // 사용자가 선택한 답안을 저장
let selectedAnswerValues = {};
const allQuestionData = [];
const questions = document.querySelectorAll(".question");
const prevButton = document.getElementById("prev-button");
const nextButton = document.getElementById("next-button");
const checkAnswerButton = document.getElementById("check-answer-button");
const resultButton = document.getElementById("result-button");
const popup = document.getElementById("popup");
const popupContent = document.querySelector(".popup-content");

// 문제 해설 데이터


// 현재 문제 표시
function showCurrentQuestion() {
    // 모든 문제의 보기를 업데이트
    questions.forEach((q, index) => {
        q.style.display = index === currentQuestionIndex ? "block" : "none";
    });

    // 이전 버튼: 첫 번째 문제에서는 숨기기
    prevButton.style.display = currentQuestionIndex === 0 ? "none" : "inline-block";

    // 다음 버튼: 마지막 문제에서는 숨기기
    nextButton.style.display = currentQuestionIndex === questions.length - 1 ? "none" : "inline-block";

    // 정답 확인 버튼: 항상 표시
    checkAnswerButton.style.display = "inline-block";

    // 결과 버튼: 마지막 문제에서만 표시
    resultButton.style.display = currentQuestionIndex === questions.length - 1 ? "inline-block" : "none";




}

// 다음 문제로 이동
function nextQuestion() {

    const selectedAnswerValue = selectedAnswerValues[currentQuestionIndex] || "선택하지 않음";

    // 사용자가 답을 선택하지 않았다면 경고창 띄우기
    if (selectedAnswerValue === "선택하지 않음") {
        alert("정답을 체크해주세여.");
        return; // 함수 종료
    }

    updateAllQuestionData()

 
    console.log("모든 문제 데이터:", allQuestionData);


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
    // 현재 문제 영역
    const currentQuestion = questions[currentQuestionIndex];

    // 정답 값 (1~5)
    const correctAnswerValue = currentQuestion.querySelector('input[type="hidden"]').value;

    // 정답 텍스트 가져오기 (qesAnswer 값에 해당하는 텍스트)
    const correctAnswerText = currentQuestion.querySelector(`.choice-item[name="${correctAnswerValue}"]`).textContent.trim();

    const explanation = currentQuestion.querySelector('input[name="explanation"]').value || "해설 없음";

    // 사용자가 선택한 답
    const selectedAnswer = selectedAnswers[currentQuestionIndex] || "선택하지 않음";
    // 팝업에 데이터 표시
    document.querySelector(".popup-content").innerHTML = `
        <p><strong>내가 고른 답:</strong> ${selectedAnswer}</p>
        <p><strong>정답:</strong>${correctAnswerText}</p>
        <hr>
        <p><strong>해설:</strong></p>
        <p>${explanation}</p>
         `;

    document.getElementById("popup").style.display = "block";
}

// 팝업 닫기
function closePopup() {
    document.getElementById("popup").style.display = "none";
}
function goToResult() {

    const selectedAnswerValue = selectedAnswerValues[currentQuestionIndex] || "선택하지 않음";

    // 사용자가 답을 선택하지 않았다면 경고창 띄우기
    if (selectedAnswerValue === "선택하지 않음") {
        alert("정답을 체크해주세요.");
        return; // 함수 종료
    }

    updateAllQuestionData()


    const payload = {
        questions: allQuestionData
    };


    // JSON 데이터를 POST 요청으로 서버에 전달
    fetch('userQuizData', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(payload) // JSON 데이터 변환
    })
        .then(response => {
            if (response.ok) {
                window.location.href = 'CheckAnswerPage?from=QuizMaker';
            } else {
                // 오류 처리 (필요시)
                console.error('Failed to send data to the server.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
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

        const selectedValue = item.getAttribute('name'); // 선택한 답안의 값 (1~5)
        const selectedAnswer = item.textContent.trim(); // 선택한 답안의 텍스트


        selectedAnswerValues[currentQuestionIndex] = selectedValue; // 값 저장
        selectedAnswers[currentQuestionIndex] = selectedAnswer; // 텍스트 저장
    });
});
// 초기화
showCurrentQuestion();


function updateAllQuestionData() {

    
    allQuestionData.length = 0; // 기존 데이터를 초기화하여 중복 방지

    questions.forEach((question, index) => {
        // 문제 식별자 가져오기
        const questionId = question.querySelector('input[type="hidden"]').dataset.id;

        // 정답 값 (1~5)
        
        const correctAnswerValue = question.querySelector('input[name="correctAnswerValue"]').value;

       
        // 사용자가 선택한 답의 값과 텍스트
        const selectedAnswerValue = selectedAnswerValues[index] || "선택하지 않음";
      
        
        const isCorrect = selectedAnswerValue === correctAnswerValue ? "Y" : "N";


        const markButton = question.querySelector('.mark-button');
        let questionFavorite = "N"; // 기본값

        if (markButton) {
            const img = markButton.querySelector("img");
            if (img.src.includes("saveA.svg")) {
                // 초기 상태가 찜된 상태라면
                markButton.classList.add("active"); // active 클래스 동기화
                questionFavorite = "Y";
            } else {
                markButton.classList.remove("active"); // active 클래스 동기화
                questionFavorite = "N";
            }
        }


        // 각 문제의 데이터를 JSON으로 저장
        const questionData = {
            qesIndex: index + 1, // 문제 번호
            qesIdx: questionId, // 문제 식별자
            corrAnswerYn : isCorrect,
            qesFav: questionFavorite

        };

       



        allQuestionData.push(questionData); // 데이터 배열에 추가
    });

  
    
    console.log("업데이트된 문제 데이터:", allQuestionData);
}
