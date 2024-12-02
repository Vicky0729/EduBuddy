<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

</head>
<body>
    
    <h2>Audio Transcription Result:</h2>
    <!-- 여기에 서버에서 가져온 텍스트를 보여줌 -->
    <p id="transcriptionText">${transcriptionText}</p>

    <!-- Google TTS 요청 버튼 -->
    <button id="ttsButton">Generate Speech</button>
    <p id="statusMessage"></p>

    <!-- 생성된 오디오를 재생할 audio 태그 -->
    <audio id="audioPlayer" controls style="display: none;"></audio>

    <script>
        // 버튼 클릭 이벤트
        document.getElementById('ttsButton').addEventListener('click', async () => {
            const transcriptionText = document.getElementById('transcriptionText').textContent;
            const statusMessage = document.getElementById('statusMessage');
            const audioPlayer = document.getElementById('audioPlayer');

            // 비어 있는 텍스트 확인
            if (!transcriptionText.trim()) {
                statusMessage.textContent = 'Transcription text is empty!';
                return;
            }

            statusMessage.textContent = 'Generating speech...';

            try {
                // TTS API 호출
                const response = await fetch('/tts/generate', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({ text: transcriptionText })
                });

                if (!response.ok) {
                    throw new Error('Failed to generate speech');
                }

                // 응답 처리
                const message = await response.text(); // 서버에서 반환된 메시지 확인
                statusMessage.textContent = message;

                // 오디오 재생 (output.mp3 경로로 설정)
                audioPlayer.src = '/output.mp3'; // 서버가 저장한 파일 경로
                audioPlayer.style.display = 'block';
            } catch (error) {
                console.error(error);
                statusMessage.textContent = 'Speech generation failed. Please try again.';
            }
        });
    </script>


    



</body>
</html>