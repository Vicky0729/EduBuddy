<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>CheckAnswer</title>
            <link rel="stylesheet" href="/css/CheckAnswer.css">
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
                    <button class="result-button" onclick="goToNote()">오답노트 바로가기</button>
                </div>
                <div style="display: flex; justify-content: space-around; margin: 20px;">
                    <button class="result-button" onclick="nextStage()">다음 단계</button>
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

            <script src="/js/CheckAnswer.js"></script>
        </body>

        </html>