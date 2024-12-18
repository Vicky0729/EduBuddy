
// 로딩 창 표시 함수
function showLoading() {
    const overlay = document.getElementById("loading-overlay");
    if (overlay) {
        overlay.style.display = "flex"; // 로딩 창 표시
    }
}

// 로딩 창 숨김 함수
function hideLoading() {
    const overlay = document.getElementById("loading-overlay");
    if (overlay) {
        overlay.style.display = "none"; // 로딩 창 숨김
    }
}

// 비동기 텍스트 변환 작업 (예제 Promise)
function performTextConversion() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            const isSuccess = true; // 성공 여부 (예제)
            if (isSuccess) {
                resolve(); // 성공 시 resolve 호출
            } else {
                reject("변환 실패"); // 실패 시 reject 호출
            }
        }, 5000); // 예: 5초 후 완료
    });
}

// 모든 탭 버튼 가져오기
const tabs = document.querySelectorAll('.category-tab');

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

const EditPopup = {
    show: function (idx) {
        console.log(idx);

        // 팝업창 생성
        const popup = document.createElement('div');
        popup.classList.add('popup');
        popup.id = 'edit-popup';
        popup.innerHTML = `
                    <div class="popup-content"> 
                        <input type="text" id="editTitleInput" value="수정한 파일명을 입력해주세요">
                        <div class="popup-buttons">
                           <button id="saveButton">변경</button>
                            <button id="cancelButton">취소</button>
                        </div>
                    </div>
                `;

        // 팝업에 관련된 제목 요소 저장

        // 팝업을 body에 추가
        document.body.appendChild(popup);
        document.getElementById('saveButton').addEventListener('click', () => EditPopup.save(idx));
        document.getElementById('cancelButton').addEventListener('click', () => EditPopup.close(idx));
    },
    save: function (idx) {
        console.log(idx);
        const popup = document.getElementById('edit-popup');


        if (popup) {
            const newTitle = document.getElementById('editTitleInput').value; // 입력값 가져오기
            console.log(newTitle);

            if (newTitle) {
                $.ajax({
                    url: "/uploadEdit",
                    type: "post",
                    contentType: 'application/json', // 요청 데이터 형식
                    data: JSON.stringify({
                        idx: idx,
                        newTitle: newTitle
                    }), // JSON 형식의 데이터 전송
                    success: function () {

                        window.location.reload();

                    },
                    error: function (xhr, status, error) {
                        console.error('수정 중 오류 발생:', error);
                        alert('수정 중 문제가 발생했습니다. 다시 시도해주세요.');
                    }

                })

            }
            EditPopup.close(); // 팝업 닫기
        }
    },
    close: function () {
        const popup = document.getElementById('edit-popup');
        if (popup) {
            document.body.removeChild(popup); // 팝업 제거
        }
    }
};


// 삭제 팝업과 관련된 함수와 변수
const DeletePopup = {
    show: function (idx) {


        // 팝업창 생성
        const popup = document.createElement('div');
        popup.classList.add('popup');
        popup.id = 'delete-popup';
        popup.innerHTML = `
                <div class="popup-content">
                    <p>정말 삭제할꺼야?</p>
                    <div class="popup-buttons">
                        <button id ='deleteButton'>삭제</button>
                        <button id ='closeButton'>취소</button>
                    </div>
                </div>
            `;

        document.body.appendChild(popup); // 팝업을 body에 추가
        document.getElementById('deleteButton').addEventListener('click', () => DeletePopup.confirm(idx));
        document.getElementById('closeButton').addEventListener('click', () => DeletePopup.close(idx));
    },
    confirm: function (idx) {
        $.ajax({
            url: "/uploadDelete",
            type: "post",
            contentType: 'application/json', // 요청 데이터 형식
            data: JSON.stringify({
                idx: idx,

            }), // JSON 형식의 데이터 전송
            success: function () {

                window.location.reload();// 팝업 닫기

            },
            error: function (xhr, status, error) {
                console.error('수정 중 오류 발생:', error);
                alert('수정 중 문제가 발생했습니다. 다시 시도해주세요.');
            }


        })

    },
    close: function (idx) {
        const popup = document.getElementById('delete-popup');
        if (popup) {
            document.body.removeChild(popup); // 팝업 제거
        }
    }
};

const LearningPopup = {
    show: function (idx) {
        // 난이도 설정 팝업창 생성
        const popup = document.createElement('div');
        popup.classList.add('difficulty-popup');
        popup.id = 'difficulty-popup';
        popup.innerHTML = `
            <div class="difficulty-popup-content">
                <h3>난이도 설정</h3>
                <p>추천: 개념부터 학습하는 것을 추천 할게!</p>
                <form id="difficultyForm" action="/QuizMaker" method="POST">
                    <div>
                        <label>
                            <input type="radio" name="difficulty" value="1" required> 개념
                        </label>
                        <label>
                            <input type="radio" name="difficulty" value="2"> 중급
                        </label>
                        <label>
                            <input type="radio" name="difficulty" value="3"> 심화
                        </label>
                    </div>
                    <input type="hidden" name="idx" value="${idx}">
                    <div class="difficulty-popup-buttons">
                        <button type="submit" id="enterButton">확인</button>
                        <button type="button" id="cancelButton">취소</button>
                    </div>
                </form>
            </div>
            `;
        document.body.appendChild(popup); // 팝업을 body에 추가
        document.getElementById('cancelButton').addEventListener('click', LearningPopup.close);
    },

    close: function () {
        const popup = document.getElementById('difficulty-popup');
        if (popup) {
            document.body.removeChild(popup); // 팝업 제거
        }
    }
};


function filterCategory(category) {
    const items = document.querySelectorAll('.recording-item');
    items.forEach(item => {
        if (category === 'all' || item.getAttribute('data-category') === category) {
            item.style.display = 'flex';
        } else {
            item.style.display = 'none';
           
        }
    });
}   