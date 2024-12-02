<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
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
        height: 95vh;
        margin: 15px;
        background-color: white;
    }

    .buddy {
        width: 120px;
        height: 150px;
        float: right;
        transform: scaleX(-1);
        margin-top: 80px;
    }

    .StudentInfo-container {
        width: 370px;
        height: 620px;
        background-color: white;
        border-radius: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
        padding: 20px;
        margin-top: 5px;
        margin-bottom: 5px;
        border: 2px solid rgb(102, 196, 196);;
    }

    .buddyChat {
        background-color: rgb(102, 196, 196);;
        padding: 35px;
        border-radius: 10px;
        font-size: 14px;
        margin-top: 25px;
        float: left;
        font-family: 'NoonnuBasicGothicRegular';
        position: relative;
        max-width: 70%;
        text-align: left;
        line-height: 1.4;
        max-width: 80%;
        margin-left: auto;
    }

    .buddyChat::after {
        content: "";
        position: absolute;
        right: -22px;
        border-width: 10px;
        border-left: 20px;
        border-style: solid;
        border-color: transparent transparent transparent rgb(102, 196, 196);;
    }

    .grade {
        margin-top: 250px;
        text-align: left;
        width: 100%;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .grade label {
        display: block;
        padding-left: 9px;
        margin-top: 40px;
        width: 100%;
        text-align: left;
        font-weight: bold;
        font-family: 'NoonnuBasicGothicRegular';
    }

    .radio-group {
        display: flex;
        flex-direction: row;
        gap: 55px;
        margin-top: 20px;
    }

    .radio-group .radio-button {
        padding: 10px 20px;
        border-radius: 8px;
        border: 2px solid #ccc;
        cursor: pointer;
        justify-content: space-evenly;
        font-family: 'NoonnuBasicGothicRegular';
    }

    input[type="radio"] {
        display: none;
    }

    input[type="radio"]:checked+.radio-button {
        background-color: rgb(102, 196, 196);;
        border-color: rgb(102, 196, 196);;
        color: black;
    }

    .school label {
        display: block;
        padding-left: 9px;
        margin-top: 40px;
        width: 100%;
        text-align: left;
        font-weight: bold;
        font-family: 'NoonnuBasicGothicRegular';
    }

    .school input {
        width: calc(100% - 50px);
        padding: 15px;
        margin-top: 15px;
        border-radius: 7px;
        border: 1px solid #ccc;
        color: rgba(0, 0, 0, 0.5);
        font-family: 'NoonnuBasicGothicRegular';
    }

    .name label {
        display: block;
        padding-left: 9px;
        margin-top: 30px;
        width: 100%;
        text-align: left;
        font-weight: bold;
        font-family: 'NoonnuBasicGothicRegular';
    }

    .name input {
        width: calc(100% - 50px);
        padding: 15px;
        margin-top: 10px;
        border-radius: 7px;
        border: 1px solid #ccc;
        color: rgba(0, 0, 0, 0.5);
        font-family: 'NoonnuBasicGothicRegular';
    }

    .success {
        width: 100px;
        height: 50px;
    }

    .submit-button {
        margin-top: 25px;
        width: 95%;
        padding: 10px;
        font-size: 16px;
        background-color: rgb(102, 196, 196);
        color: black;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-family: 'NoonnuBasicGothicRegular';
        font-weight: bold;
    }

    .submit-button:hover {
        background-color: rgb(102, 196, 196);
    }
</style>
</head>

<body>

    <div class="StudentInfo-container">
        <h2 class="buddyChat">
            이제 마지막 질문이야!<br>
            <br>
            조금만 더 힘을 내줘!
        </h2>
        <img src="http://edubuddy.dothome.co.kr/pic/ailogo.png" class="buddy">

        <div class="grade">
            <label>너의 학년을 알려줘</label>
        </div>
        <div class="radio-group">
            <label>
                <input type="radio" name="grade" value="중1">
                <span class="radio-button">중 1</span>
            </label>
            <label>
                <input type="radio" name="grade" value="중2">
                <span class="radio-button">중 2</span>
            </label>
            <label>
                <input type="radio" name="grade" value="중3">
                <span class="radio-button">중 3</span>
            </label>
        </div>

        <div class="school">
            <label>너의 학교를 알려줘</label>
            <input type="text" name="school" value="너의 학교를 적어줘" onfocus="clearText(this)" onblur="resetText(this, '너의 학교를 적어줘')">
        </div>

        <div class="name">
            <label>너의 이름이 뭐야?</label>
            <input type="text" name="name" value="너의 이름을 적어줘" onfocus="clearText(this)" onblur="resetText(this, '너의 이름을 적어줘')">
        </div>

            <button type="submit" class="submit-button" onclick="window.location.href='Home'">다음</button>
    </div>



<script>
    function clearText(input){
        if(input.value == input.defaultValue){
            input.value = "";
        }
    }

    function resetText(input, defaultText){
        if(input.value == ""){
            input.value = defaultText;
        }
    }
</script>
</body>
</html>