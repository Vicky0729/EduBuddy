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