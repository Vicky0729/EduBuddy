<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/Review.css">
    <title>edubuddy</title>
</head>

<body>
    <div class="Review-container">
        <div class="header">EDU BUDDY</div>

        <div class="content">

            <div class="chat-container">
                <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="buddy">

                <div class="buddyChat">
                    <p>여기서 틀린 문제를 다시 풀어봐!</p>
                    <p>모든 문제를 풀거나<br>원하는 문제를 클릭해서 풀면돼!</p>
                </div>
            </div>

            
            <c:if test="${not empty sessionScope.questions}">
                <form action="ProblemSolved" method="get">  
                    <input type="submit" class=before-problem value="방금 푼 문제">
                </form>
            </c:if>
           

            <div class="category-tabs">
                <button class="category-tab active">국어</button>
                <button class="category-tab">영어</button>
                <button class="category-tab">수학</button>
                <button class="category-tab">사회</button>
                <button class="category-tab">과학</button>
                <button class="category-tab">역사</button>
            </div>

            <div class="table-container">
                <div class="table-header">
                    <span>목차</span>
                <form action="AllProblem" method="get">
                    <button type="submit">모든문제</button>
                </form>
                </div>
                <div class="table-body">

                <c:forEach var="qesCountList" items="${qesCountList}" varStatus="status">
                    <form action="TypeProblem" method="post">
                        <div class="table-row">
                            <div class="table-content">
                                <span class="table-index">${status.count}</span>
                                <span>${qesCountList.qesType}</span>
                            </div>
                            <span class="table-problems">[ ${qesCountList.questionCount} ]문제</span>
                            <button class="table-button">
                                <img src="http://edubuddy.dothome.co.kr/pic/next2.png" alt="문제이동">
                            </button>
                          <input type="hidden" name="qesIdxList" value="${qesCountList.qesIdxList}">
                        </div>
                    </form>
                </c:forEach>

                    
                </div>
            </div>
           

        </div> <jsp:include page="Menubar.jsp" />
    </div>
    <script src="/js/Review.js"></script>
</body>
</html>