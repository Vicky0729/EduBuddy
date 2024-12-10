<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>CheckAnswer</title>
            <link rel="stylesheet" href="/css/CheckAnswer.css">
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        </head>

        <body>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <c:if test="${not empty errorMessage}">
                <script>
                    alert("${errorMessage}");
                </script>
            </c:if>

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
                                        <c:when test="${question.corrAnswerYn == 'Y'}">
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
                    <form action="ReviewPage" method="get">
                        <button type="submit" class="result-button">오답노트 바로가기</button>
                    </form>
                </div>
            <c:if test="${from == 'QuizMaker'}">
                <div style="display: flex; justify-content: space-around; margin: 20px;">
                    <form action="NextLevel" method="get">
                        <button type="submit" class="result-button">다음 단계</button>
                    </form>
                </div>
            </c:if>

                <jsp:include page="Menubar.jsp" />

            </div>

            <script src="/js/CheckAnswer.js"></script>
        </body>

        </html>