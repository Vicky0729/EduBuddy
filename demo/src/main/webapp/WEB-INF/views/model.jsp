<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Run Python Script from JSP</h1>
    <button id="runPython">Run Python</button>
    <div id="result"></div> <!-- 결과를 표시할 영역 -->

    <script>
        // JavaScript로 버튼 클릭 이벤트 처리
        document.getElementById("runPython").addEventListener("click", function() {
            // FastAPI 서버의 /run-python 엔드포인트 호출
            fetch("http://localhost:5000/runPython")
                .then(response => response.json()) // 응답을 JSON으로 변환
                .then(data => {
                    console.log(data)
                    // 결과를 화면에 표시
                    document.getElementById("result").innerText = JSON.stringify(data, null, 2);
                })
                .catch(error => {
                    // 오류 처리
                    console.error("Error:", error);
                    document.getElementById("result").innerText = "Error: " + error;
                });
        });
    </script>
</body>
</html>