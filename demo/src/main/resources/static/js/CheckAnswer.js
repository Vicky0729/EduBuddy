document.addEventListener("DOMContentLoaded", () => {
    // 테이블의 모든 <td> 요소 가져오기
    const tdElements = document.querySelectorAll(".result-table tbody td");

    let correctCount = 0; // O의 개수
    let wrongCount = 0;  // X의 개수

    // 각 <td> 요소를 순회하면서 O와 X를 카운트
    tdElements.forEach(td => {
        if (td.textContent.trim() === "O") {
            correctCount++;
            td.style.color = "blue"; // O는 파란색
        } else if (td.textContent.trim() === "X") {
            wrongCount++;
            td.style.color = "red"; // X는 빨간색
        }
    });

    const totalQuestions = correctCount + wrongCount; // 총 문제 개수
    const accuracy = Math.round((correctCount / totalQuestions) * 100); // 정답률 계산

    // 정답률 텍스트 업데이트
    const accuracyText = document.getElementById("accuracyText");
    accuracyText.textContent = `정답률: ${accuracy}%`;

    // 차트 생성
    const ctx = document.getElementById("resultChart").getContext("2d");
    new Chart(ctx, {
        type: "doughnut",
        data: {
            labels: ["정답", "오답"],
            datasets: [
                {
                    data: [correctCount, wrongCount],
                    backgroundColor: ["rgb(48, 48, 112)", "rgb(187, 71, 71)"],
                },
            ],
        },
        options: {
            plugins: {
                legend: {
                    display: true,
                    position: "bottom",
                },
            },
        },
    });
});
