<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>CheckAnswer</title>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

                    .checkAnswer-container {
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
                        padding: 0 25px;
                        border-radius: 10px;
                        font-size: 15px;
                        line-height: 1.5;
                        text-align: left;
                        color: rgba(255, 255, 255, 0.792);
                        font-family: 'NoonnuBasicGothicRegular';
                    }

                    .buddyChat::after {
                        content: "";
                        position: absolute;
                        left: -190px;
                        top: 125px;
                        border-width: 20px;
                        border-left: 294px;
                        border-bottom: 15px;
                        border-top: 8px;
                        border-style: solid;
                        border-color: transparent #2c3e50 transparent transparent
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
                        filter: invert(20%) sepia(100%) saturate(500%) hue-rotate(200deg) brightness(100%) contrast(150%);
                    }

                    .chart-container {
                        display: flex;
                        justify-content: center;
                        margin: 20px 0;
                    }

                    canvas {
                        max-width: 230px;
                        /* 최대 너비를 고정 */
                        max-height: 230px;
                        /* 최대 높이를 고정 */
                        width: 50px;
                        /* 컨테이너의 크기에 맞춤 */
                        height: 50px;
                        /* 비율 유지 */
                    }

                    #accuracyText {
                        margin-top: 10px;
                        font-size: 18px;
                        font-weight: bold;
                        color: #2c3e50;
                    }

                    .result-table {
                        width: 75%;
                        margin: 0 auto;
                        border-collapse: collapse;
                        font-size: 14px;
                    }

                    .result-table th,
                    .result-table td {
                        border: 1px solid #ddd;
                        padding: 15px;
                        text-align: center;
                    }

                    .result-table th {
                        background-color: #f4f4f9;
                        color: #333;
                        padding: 5px;
                        font-family: 'NoonnuBasicGothicRegular';
                    }

                    .result-table td {
                        font-size: 20px;
                        font-weight: bold;
                        padding: 18px;
                    }

                    .result-table td:nth-child(odd) {
                        color: blue;
                        /* 정답 색상 */
                    }

                    .result-table td:nth-child(even) {
                        color: red;
                        /* 오답 색상 */
                    }

                    .result-button {
                        padding: 10px 20px;
                        border-radius: 5px;
                        background-color: #2c3e50;
                        color: white;
                        border: none;
                        outline: none;
                        font-size: 16px;
                        cursor: pointer;
                        transition: background-color 0.3s ease, transform 0.2s ease;
                        min-width: 300px;
                        /* 최소 너비 설정 */
                        text-align: center;
                        /* 텍스트 중앙 정렬 */
                        font-family: 'NoonnuBasicGothicRegular';
                    }

                    .result-button:hover {
                        background-color: gray;
                        /* hover 시 배경색 변경 */
                    }
                </style>
            </head>

        <body>

            <div class="checkAnswer-container">
                <div class="header">EDU BUDDY</div>

                <div class="chat-container">
                    <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="buddy">

                    <div class="buddyChat">
                        <p>잘했어! <br>
                            틀린문제는 오답노트에 저장 완료!</p>
                        <p>다음단계의 문제를 풀거나 <br>오답노트로 이동해서 <br> 틀린문제를 다시 풀어봐!</p>
                        <p></p>
                    </div>
                </div>

                <!-- 그래프 추가 -->
                <div class="chart-container"
                    style="display: flex; flex-direction: column; align-items: center; margin-bottom: 30px;">
                    <canvas id="resultChart" width="200" height="200"></canvas>
                    <!-- 정답률 텍스트 -->
                    <div id="accuracyText"
                        style="margin-top: 10px; font-size: 18px; font-weight: bold; color: #2c3e50; font-family: 'NoonnuBasicGothicRegular';">
                    </div>
                </div>

                <table class="result-table">
                    <thead>

                        <tr>
                            <c:forEach var="question" items="${questions}">
                                <th>${question.qesIndex}번</th>
                            </c:forEach>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>

                            <c:forEach var="question" items="${questions}">

                                <td>
                                    <c:choose>
                                        <c:when test="${question.corrAnswerVal == question.selAnswerVal}">
                                            O
                                        </c:when>
                                        <c:otherwise>
                                            X
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </c:forEach>

                        </tr>

                    </tbody>
                </table>

                <!-- 버튼 -->
            <div style="display: flex; justify-content: space-around; margin-top: 20px;">
                <form action="Review" method="get">
                    <button type="submit" class="result-button">오답노트 바로가기</button>
                </form>
             </div>
                <div style="display: flex; justify-content: space-around; margin: 20px;">
                    <form action="NextLevel" method="get">
                        <button type="submit" class="result-button">다음 단계</button>
                    </form>  
                </div>

                <jsp:include page="Menubar.jsp" />

            </div>

            <script>

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
                    accuracyText.textContent = `정답률: ${'${accuracy}'}%`;

                    // 차트 생성
                    const ctx = document.getElementById("resultChart").getContext("2d");
                    new Chart(ctx, {
                        type: "doughnut",
                        data: {
                            labels: ["정답", "오답"],
                            datasets: [
                                {
                                    data: [correctCount, wrongCount],
                                    backgroundColor: ["rgb(48, 48, 112)","rgb(187, 71, 71)"],
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
               
            </script>
        </body>

        </html>