<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>UploadLecture</title>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
            <link rel="stylesheet" href="/css/UploadLecture.css">
        </head>

        <body>

            <div id="loading-overlay" class="loading-overlay" style="display: none;">
                <div class="loading-content">
                    <p>텍스트로 변환 중...</p>
                    <div class="spinner"></div>
                </div>
            </div>

            <div class="Upload-container">
                <div class="header">EDU BUDDY</div>

                <div class="chat-container">
                    <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="buddy">

                    <div class="buddyChat">
                        <p><span id="userName"> ${sessionScope.userName}</span>이 학습한 내용이야</span></p>
                        <p>이번엔 너가 녹음한 강의에서 중요한 내용을 뽑아서 문제를 만들어 줄게. 준비됐지?</p>
                        <p>문제 풀기를 시작하려면 학습하기 버튼을 눌러봐!</p>
                    </div>
                </div>

                <div class="category-tabs">
                    <button class="category-tab " onclick="filterCategory('국어')">국어</button>
                    <button class="category-tab" onclick="filterCategory('영어')">영어</button>
                    <button class="category-tab" onclick="filterCategory('수학')">수학</button>
                    <button class="category-tab" onclick="filterCategory('사회')">사회</button>
                    <button class="category-tab active" onclick="filterCategory('과학')">과학</button>
                    <button class="category-tab" onclick="filterCategory('역사')">역사</button>
                </div>

                <div class="recordings-container">
                <c:forEach var="upload" items="${uploadList}">
                    <div class="recording-item" data-category="과학"> <!-- 과학 데이터로 가정 -->
                        <div class="recording-content">
                            <!-- 제목과 수정/삭제 버튼 -->
                            <div class="title-and-buttons">
                                <p class="recording-title">${upload.uploadFile}</p>
                                <div class="action-buttons">
                                    <button class="edit-button" onclick="EditPopup.show('${upload.uploadIdx}')">수정</button>
                                    <button class="delete-button" onclick="DeletePopup.show('${upload.uploadIdx}')">삭제</button>
                                </div>
                            </div>
            
                            <!-- 키워드 표시 영역 -->
                            <div class="keyword-box">
                                <c:if test="${not empty upload.keyword1}">
                                    <div class="keyword-item">${upload.keyword1}</div>
                                </c:if>
                                <c:if test="${not empty upload.keyword2}">
                                    <div class="keyword-item">${upload.keyword2}</div>
                                </c:if>
                                <c:if test="${not empty upload.keyword3}">
                                    <div class="keyword-item">${upload.keyword3}</div>
                                </c:if>
                                <c:if test="${not empty upload.keyword4}">
                                    <div class="keyword-item">${upload.keyword4}</div>
                                </c:if>
                                <c:if test="${not empty upload.keyword5}">
                                    <div class="keyword-item">${upload.keyword5}</div>
                                </c:if>
                            </div>
            
                            <!-- 레코딩 날짜 -->
                            <div class="recording-date">
                                <p>${upload.uploadDt}</p>
                            </div>
            
                            <!-- 학습하기 버튼 -->
                            <div class="button-container">
                                <button class="recording-button" onclick="LearningPopup.show('${upload.uploadIdx}')">학습하기</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

                <jsp:include page="Menubar.jsp" />

            </div>

            <script src="/js/UploadLecture.js"></script>

        </body>

        </html>