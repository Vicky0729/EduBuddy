
                let mediaRecorder;
                let recordedChunks = [];
                let timer;
                let seconds = 0;
                let isPaused = false;

                async function startRecording() {
                    const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
                    mediaRecorder = new MediaRecorder(stream);

                    mediaRecorder.ondataavailable = (event) => {
                        if (event.data.size > 0) {
                            recordedChunks.push(event.data);
                        }
                    };

                    mediaRecorder.start();
                    console.log("녹음 시작");
                    startTimer();
                    updateButtonStates("recording");
                }

                function togglePause() {
                    if (mediaRecorder) {
                        if (isPaused) {
                            mediaRecorder.resume();
                            startTimer();
                            console.log("녹음 재개");
                            updateButtonStates("recording");
                        } else {
                            mediaRecorder.pause();
                            clearInterval(timer);
                            console.log("녹음 일시 정지");
                            updateButtonStates("paused");
                        }
                        isPaused = !isPaused;
                    }
                }

                function stopRecording() {
                    if (mediaRecorder) {
                        mediaRecorder.stop();
                        clearInterval(timer);
                        seconds = 0;
                        console.log("녹음 중지");

                        mediaRecorder.onstop = () => {
                            const recording = new Blob(recordedChunks, { type: 'audio/webm' });
                            recordedChunks = [];
                            uploadAudioSync(recording);
                        };

                        updateButtonStates("stopped");
                        document.getElementById('recordingTime').textContent = "00:00";
                    }
                }

                function uploadAudioSync(recording) {
                    const xhr = new XMLHttpRequest();
                    xhr.open("POST", "upload-audio", false);
                    const formData = new FormData();
                    formData.append("file", recording, "recording.webm");

                    xhr.onload = function () {
                        if (xhr.status === 200) {
                            console.log("업로드 성공");
                        } else {
                            console.log("업로드 실패");
                        }
                    };

                    xhr.onerror = function () {
                        console.log("연결 실패");
                    };

                    xhr.send(formData);
                }

                function updateButtonStates(state) {
                    document.getElementById("start").disabled = (state === "recording");
                    document.getElementById("pause").disabled = (state === "stopped");
                    document.getElementById("stop").disabled = (state === "stopped");
                }

                function startTimer() {
                    timer = setInterval(() => {
                        seconds++;
                        const minutes = Math.floor(seconds / 60);
                        const remainingSeconds = seconds % 60;
                        document.getElementById('recordingTime').textContent =
                            `${minutes.toString().padStart(2, '0')}:${remainingSeconds.toString().padStart(2, '0')}`;
                    }, 1000);
                }

                function clearText(input) {
                    if (input.value === input.defaultValue) input.value = "";
                }

                function resetText(input, defaultText) {
                    if (input.value === "") input.value = defaultText;
                }
                function triggerFileUpload() {
                    const fileInput = document.getElementById('fileInput');
                    if (fileInput) {
                        fileInput.click();
                    }
                }
                function handleFileSelect(event) {
                    const fileInput = event.target;
                    const fileNameDisplay = document.getElementById("fileNameDisplay");
                    const uploadContainer = document.getElementById("uploadContainer");
                    const uploadIcon = document.getElementById("uploadIcon");

                    if (fileInput.files.length > 0) {
                        const fileName = fileInput.files[0].name; // 선택된 파일의 이름 가져오기

                        // 이미지 숨기고 파일 이름 표시
                        uploadIcon.style.display = "none";
                        fileNameDisplay.textContent = fileName; // 파일명을 표시
                        fileNameDisplay.style.display = "block"; // 파일명 표시
                    } else {
                        // 이미지 다시 표시하고 파일명 초기화
                        uploadIcon.style.display = "block";
                        fileNameDisplay.textContent = "";
                        fileNameDisplay.style.display = "none";
                    }
                }
       