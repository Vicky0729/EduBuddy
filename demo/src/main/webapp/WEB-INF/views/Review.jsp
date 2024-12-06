<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>edubuddy</title>
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
            height: 100%;
            background-color: white;
            margin: 0;
        }

        .Review-container {
            width: 400px;
            height: 93vh;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 22px 10px;
            border: 2px solid #2c3e50;
            border-radius: 20px;
            position: relative;
            overflow: hidden;
            margin-top: 1px;
        }

        .content {
            flex-grow: 1;
            overflow-y: auto;
            max-height: calc(93vh - 125px);
            padding-bottom: 80px;
            scrollbar-width: none;
        }

        .chat-container {
            flex-shrink: 0;
            display: flex;
            align-items: flex-start;
            padding: 8px;
            gap: 5px;
        }

        .header {
            font-size: 23px;
            font-weight: bold;
            text-align: left;
            padding: 20px;
            background-color: #2c3e50;
            color: white;
            border-top-left-radius: 18px;
            border-top-right-radius: 18px;
            font-family: 'NoonnuBasicGothicRegular';
            width: calc(100% + 22px);
            box-sizing: border-box;
            margin: 0;
            position: relative;
            top: -22px;
            right: 11px;
        }

        .buddy {
            width: 100px;
            height: auto;
            margin-right: 10px;
            margin-top: 20px;
        }

        .buddyChat {
            background-color: #2c3e50;
            padding: 0 30px;
            border-radius: 10px;
            font-size: 14px;
            line-height: 1.5;
            text-align: left;
            margin-left: 30px;
            color: rgba(255, 255, 255, 0.792);
            font-family: 'NoonnuBasicGothicRegular';
            position: relative;
            margin-top: 15px;
        }

        .buddyChat::after {
            content: "";
            position: absolute;
            left: -15px;
            top: 50px;
            border-width: 20px;
            border-right: 20px solid #2c3e50;
            border-top: 8px solid transparent;
            border-bottom: 15px solid transparent;
            border-left: none;
        }

        .category-tabs {
            display: flex;
            justify-content: space-around;
            padding: 10px 0;
            background-color: white;
            border-bottom: 1px solid #ddd;
        }

        .category-tab {
            flex: 1;
            margin: 0 16px;
            padding: 10px 0;
            text-align: center;
            font-size: 15px;
            font-weight: 900;
            color: black;
            background-color: transparent;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 10px 0;
            font-family: 'NoonnuBasicGothicRegular';
        }

        .category-tab.active {
            color: black;
            border-bottom: 2px solid black;
        }

        .table-container {
            width: 90%;
            max-width: 600px;
            border: 1px solid #ddd;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            background-color: white;
            margin-top: 15px;
            text-align: center;
            margin-left: 20px;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #2c3e50;
            color: white;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: bold;
        }

        .table-header button {
            background-color: #f0ad4e;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            color: white;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }

        .table-header button:hover {
            background-color: #ec971f;
        }

        .table-body {
            padding: 10px;
            text-align: center;
        }

        .table-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .table-row:last-child {
            border-bottom: none;
        }

        .table-content {
            flex: 1;
            display: flex;
            align-items: center;
            font-size: 14px;
        }

        .table-index {
            font-weight: bold;
            margin-right: 10px;
        }

        .table-button {
            background: none;
            border: none;
            padding: 0;
            margin: 0;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
            outline: none;
            box-shadow: none;
            width: 50px;
            height: 50px;
            transition: transform 0.2s ease-in-out, filter 0.2s ease-in-out;
        }

        .table-button:hover {
            transform: scale(1.1);
            transform: rotate(90deg);
        }

        .table-button img {
            display: block;
            width: 100%;
            height: 100%;

        }

        .table-button img:hover {
            filter: brightness(0.5) sepia(1) hue-rotate(550deg);
        }

        .bottom-menu {
            display: flex;
            justify-content: space-around;
            align-items: center;
            width: 100%;
            height: 70px;
            background-color: #ffffff;
            border-top: 1px solid black;
            border-bottom-left-radius: 18px;
            border-bottom-right-radius: 18px;
            position: absolute;
            bottom: 0;
            left: 0;
            z-index: 10;
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
    </style>
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

            <form action="ProblemSolved" method="get">
                <input type="submit" value="방금 푼 문제">
            </form>

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
                    <button onclick="">모든문제</button>
                </div>
                <div class="table-body">

                <c:forEach var="qesSolving" items="${questionList}">
                    <form action="" method="post">
                        <div class="table-row">
                            <div class="table-content">
                                <span class="table-index">1.</span>
                                <span>${qesSolving.qesType}</span>
                            </div>
                            <span class="table-problems">[ ${qesSolving.wrongCnt} ]문제</span>
                            <button class="table-button">
                                <img src="../pic/Click.png" alt="문제이동">
                            </button>
                            <input type="hidden" value="${qesCountList.qesType}" name="qesType">
                        </div>
                    </form>
                </c:forEach>

                    
                </div>
            </div>
           

        </div> <jsp:include page="Menubar.jsp" />
    </div>
    <script>
        // 모든 탭 버튼 가져오기
        const tabs = document.querySelectorAll('.category-tab');
        const content = document.getElementById('category-content');

        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                // 모든 탭에서 active 클래스 제거
                tabs.forEach(t => t.classList.remove('active'));

                // 클릭된 탭에 active 클래스 추가
                tab.classList.add('active');

                // 콘텐츠 업데이트
                content.innerHTML = `<p>현재 선택된 카테고리: <strong>${tab.textContent}</strong></p>`;
            });
        });
    </script>
</body>
</html>