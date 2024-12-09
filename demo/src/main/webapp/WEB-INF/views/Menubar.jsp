<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: white;
            margin: 0;
        }

        .container {
            width: 100%;
            max-width: 400px;
            height: 97vh;
            border: 2px solid black;
            border-radius: 20px;
            position: relative;
            background-color: white;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            overflow: hidden;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .header {
            font-size: 20px;
            font-weight: bold;
            text-align: left;
            padding: 10px;
            background-color: #2c3e50;
            color: white;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            font-family: 'NoonnuBasicGothicRegular';
        }

        .bottom-menu {
            display: flex;
            justify-content: space-around;
            align-items: center;
            width: 100%;
            height: 75px;
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
            filter: invert(40%) sepia(100%) saturate(500%) hue-rotate(200deg) brightness(130%) contrast(150%);
        }
    </style>
</head>

<body>
    

        <div class="bottom-menu">
            <button class="menu-item" onclick="location.href='UploadLecturePage'">
                <img src="http://edubuddy.dothome.co.kr/pic/book.svg" alt="문제 탐험대">
                <span>문제 탐험대</span>
            </button>
            <button class="menu-item" onclick="location.href='HomePage'">
                <img src="http://edubuddy.dothome.co.kr/pic/ai1.svg" alt="AI 학습관">
                <span>AI 학습관</span>
            </button>
            <button class="menu-item" onclick="location.href='ReviewPage'">
                <img src="http://edubuddy.dothome.co.kr/pic/ox.svg" alt="다시도전">
                <span>오답노트</span>
            </button>
            <button class="menu-item" onclick="location.href='DashBoardPage'">
                <img src="http://edubuddy.dothome.co.kr/pic/status.svg" alt="학습여정">
                <span>학습여정</span>
            </button>
        </div>
    
</body>
</html>