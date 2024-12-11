const menuButton = document.getElementById("menuButton");
const popupMenu = document.getElementById("popupMenu");

// 팝업 열기/닫기
menuButton.addEventListener("click", (e) => {
    e.stopPropagation(); // 이벤트 전파 방지
    popupMenu.style.display = popupMenu.style.display === "block" ? "none" : "block";
});

// 팝업 내부 클릭 시 닫히지 않게 설정
popupMenu.addEventListener("click", (e) => {
    e.stopPropagation(); // 이벤트 전파 방지
});

// 외부 클릭 시 팝업 닫기
window.addEventListener("click", () => {
    popupMenu.style.display = "none";
});

function editField(field) {
    const displayElement = document.getElementById(`${field}-display`);
    const inputElement = document.getElementById(`${field}-input`);
    const button = event.target;
    
    if (button.textContent === "수정하기") {
        // 전환: 텍스트 숨김, 입력 필드 표시
        displayElement.style.display = "none";
        inputElement.style.display = "inline-block";
        button.textContent = "저장하기"; // 버튼 텍스트 변경
    } else {
       
        displayElement.textContent = inputElement.value;
        displayElement.style.display = "inline";
        inputElement.style.display = "none";
        console.log(displayElement.textContent);
        // 저장: 입력값을 텍스트로 전환
        if(field==="name"){
            updateUserName(displayElement.textContent);
        }else if(field==="grade"){
            updateAcademicType(displayElement.textContent);
        }else{
            updateSchoolName(displayElement.textContent);
        }
       
        
        button.textContent = "수정하기"; // 버튼 텍스트 복원
    }
}

const closePopupButton = document.getElementById("closePopupButton");

// 닫기 버튼 클릭 시 팝업 닫기
closePopupButton.addEventListener("click", () => {
    popupMenu.style.display = "none";
});

function updateUserName(userName){

    $.ajax({
        url:"updataUserName",
        type:"post",
        data:{"userName":userName},
        success:function(){
            button.textContent = "수정하기"; // 버튼 텍스트 복원
        },
        error:function(){
            alert("수정이 실패했습니다")
        }

    })


}

function updateAcademicType(academicType){

    $.ajax({
        url:"updateAcademicType",
        type:"post",
        data:{"academicType":academicType},
        success:function(){
            button.textContent = "수정하기"; // 버튼 텍스트 복원
        },
        error:function(){
            alert("수정이 실패했습니다")
        }
        
    })


}

function updateSchoolName(SchoolName){

    $.ajax({
        url:"updataSchoolName",
        type:"post",
        data:{"SchoolName":SchoolName},
        success:function(){
            button.textContent = "수정하기"; // 버튼 텍스트 복원
        },
        error:function(){
            alert("수정이 실패했습니다")
        }
        
    })


}