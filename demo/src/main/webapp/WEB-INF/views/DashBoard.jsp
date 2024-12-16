<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/DashBoard.css">
    <title></title>
</head>

<body>
    <div class="DashBoard-container">
        <div class="header">EDU BUDDY
            <button id="menuButton" class="menu-button">
                <img src="http://edubuddy.dothome.co.kr/pic/myinfo.png" alt="내정보수정">
            </button>
            <form action="logOut" method="get">
            <button type="submit" id="LogoutButton" class="logout-button">
                <img src="http://edubuddy.dothome.co.kr/pic/Logout.png" alt="로그아웃">
            </button>
            </form>
        </div>

        <div id="popupMenu" class="popup-menu">
            <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="popup-buddy" alt="캐릭터 이미지">
            <div class="popup-title">
                <p>${sessionScope.userName}의 정보야<br>바꿀 부분이 있으면 수정도 가능해!</p>
            </div>
            <div class="user-info">
                <p><strong>이름:</strong>
                    <span id="name-display">${userName}</span>
                    <input type="text" id="name-input" class="edit-input" style="display: none;" value="${userName}">
                    <button class="edit-button" onclick="editField('name')">수정하기</button>
                </p>
                <p><strong>학년:</strong>
                    <span id="grade-display">${userAcademic.academicType}</span>
                    <input type="text" id="grade-input" class="edit-input" style="display: none;" value="${userAcademic.academicType}">
                    <button class="edit-button" onclick="editField('grade')">수정하기</button>
                </p>
                <p><strong>학교:</strong>
                    <span id="school-display">${userAcademic.schoolName}</span>
                    <input type="text" id="school-input" class="edit-input" style="display: none;" value="${userAcademic.schoolName}">
                    <button class="edit-button" onclick="editField('school')">수정하기</button>
                </p>
            </div>
            <button id="closePopupButton" class="closePopupButton">닫기</button>
        </div>

        <div class="contents">
            <div class="chat-container">
                <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="buddy">

                <div class="buddyChat">
                    <p>여기서는 ${sessionScope.userName}이</p>
                    <p>얼마나 공부했는지,</p>
                    <p>어느 부분을 더 공부해야 하는지</p>
                    <p>알려주는 곳이야</p>
                </div>
            </div>

            <div class="catelog-container">
                <div class="catelog">
                    <h2>몇 일 공부했지?</h2>
                    <p><strong>${loginCnt}</strong>일</p>
                    <div class="keywords">
                        <span>여태까지</span>
                    </div>
                    <div class="keywords">
                        <span>한달동안</span>
                    </div>
                </div>

                <div class="catelog">
                    <h2>몇 문제 풀었지?</h2>
                    <p><strong>${ProblemSolvedCnt}</strong> 문제</p>
                    <div class="keywords">
                        <span>여태까지</span>
                    </div>
                    <div class="keywords">
                        <span>한달동안</span>
                    </div>
                </div>
            </div>

            <div class="ai-coments">
                <h3>AI 코멘트</h3>
                <div class="comments-container">
                    <div class="coments">
                        <h4>국어</h4>
                        <span class="tag basic">개념</span>
                        <p>최근 많이 틀린 오답의 키워드 입력</p>
                    </div>

                    <div class="coments">
                        <h4>영어</h4>
                        <span class="tag intermediate">중급</span>
                        <p>최근 많이 틀린 오답의 키워드 입력</p>
                    </div>

                    <div class="coments">
                        <h4>수학</h4>
                        <span class="tag advanced">심화</span>
                        <p>최근 많이 틀린 오답의 키워드 입력</p>
                    </div>

                    <div class="coments">
                        <h4>사회</h4>
                        <span class="tag basic">개념</span>
                        <p>최근 많이 틀린 오답의 키워드 입력</p>
                    </div>

                    <div class="coments">
                        <h4>과학</h4>
                        <span class="tag advanced">심화</span>
                        <p>${topUpload.keyword1},${topUpload.keyword2},${topUpload.keyword3},${topUpload.keyword4},${topUpload.keyword5}</p>
                    </div>

                    <div class="coments">
                        <h4>역사</h4>
                        <span class="tag intermediate">중급</span>
                        <p>최근 많이 틀린 오답의 키워드 입력</p>
                    </div>
                </div>
            </div>


            <jsp:include page="Menubar.jsp" />
        </div>
    </div>
    
    <script src="/js/DashBoard.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</body>
</html>