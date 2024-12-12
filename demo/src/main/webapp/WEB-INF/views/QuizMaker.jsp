<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>QuizMaker</title>
            <link rel="stylesheet" href="/css/QuizMaker.css">
        </head>
        
        <body>
            <div class="Quiz-container">
                <div class="header">EDU BUDDY</div>

                <!-- 문제 영역 -->
                <div id="question-section">
                    <!-- 문제 1 -->
                    <c:forEach var="question" items="${questionList}" varStatus="status">
                        <div class="question" style="display: block;">
                            <div class="question-header">
                                <div class="left-section">문제 ${status.count}</div>
                                <div class="right-section">
                                    <span class="difficulty-label">난이도 :  </span>
                                    <button id="current-difficulty" class="dropdown-button">
                                        <c:choose>
                                            <c:when test="${difficulty == 1}">
                                                개념
                                            </c:when>
                                            <c:when test="${difficulty == 2}">
                                                중급
                                            </c:when>
                                            <c:when test="${difficulty == 3}">
                                                심화
                                            </c:when>
                                            <c:otherwise>
                                                알 수 없음
                                            </c:otherwise>
                                        </c:choose>
                                    </button>
                                </div>
                                <button class="mark-button" onclick="togglemark(this)">
                                    <img src="http://edubuddy.dothome.co.kr/pic/saveB.svg" alt="찜버튼">
                                </button>
                            </div>

                            <!-- 키워드 표시 영역 -->
                            <div class="keyword-box">
                               
                                    <div class="keyword-item">${uploadList.keyword1}</div>   
                                    <div class="keyword-item">${uploadList.keyword2}</div> 
                                    <div class="keyword-item">${uploadList.keyword3}</div> 
                                    <div class="keyword-item">${uploadList.keyword4}</div> 
                                    <div class="keyword-item">${uploadList.keyword5}</div> 
                              
                            </div>

                            <div class="top-section">
                                <div class="main-title">과학: ${question.qesType}</div>
                               
                                
                            </div>
                            
                            <div class="bottom-section">
                                <c:if test="${not empty question.qesImg1}">
                                    <img class="main-image" src="${question.qesImg1}" alt="문제 이미지">
                                </c:if>
                                <c:if test="${not empty question.qesImg2}">
                                    <img class="main-image" src="${question.qesImg2}" alt="문제 이미지">
                                </c:if>
                                <div class="sub-title">${question.qesContent}</div>
                                <div class="choices">
                                    <div class="choice-item" name="1">${question.qesSel1}</div>
                                    <div class="choice-item" name="2">${question.qesSel2}</div>
                                    <div class="choice-item" name="3">${question.qesSel3}</div>
                                    <div class="choice-item" name="4">${question.qesSel4}</div>
                                    <div class="choice-item" name="5">${question.qesSel5}</div>
                                    <input type="hidden" value="${question.qesAnswer}" data-id="${question.qesIdx}" name="correctAnswerValue">
                                    <input type="hidden" value="${question.qesExp}" name="explanation">
                                    <input type="hidden" value="${uploadList.uploadIdx}" name="uploadIdx">
                                </div>
                            </div>
                        </div>

                        
        
                    </c:forEach>
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
                        <p><strong>정답:</strong>올바른 정답</p>
                        <hr>
                        <p><strong>설명:</strong> 해설 내용</p>
                    </div>
                    <button class="popup-close" onclick="closePopup()">닫기</button>
                </div>



                <jsp:include page="Menubar.jsp" />

            </div>
            <script src="/js/QuizMaker.js"></script>
        </body>

        </html>