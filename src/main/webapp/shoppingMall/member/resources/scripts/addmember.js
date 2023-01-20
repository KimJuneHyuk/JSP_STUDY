// const inputId = document.querySelector('input[name=id]');
const form = window.document.getElementById('newMember'); // 폼 태그 선택
console.log(form);
const id = form['id'];
console.log(id);
// 1.팝업을 이용한 ㅑㅇ 중복 확인 하기.
// 팝업을 띄우는 이유는, 현재 페이지에서 데이터베이스에 중복 조회를 하려면 페이지 새로고침 외 다른 방법이
// 없다.
const btnIsDuplication = form['btnIsDuplication'];
console.log(btnIsDuplication);

const btnDupl = form['btnIsDuplication2nd'];
console.log(btnDupl);

const warning = window.document.querySelector('.idCheck');




id.addEventListener('keyup', () => {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', 'ajaxIdCheck.jsp?id=' + id.value);
    xhr.onreadystatechange = () => {
        if (xhr.readyState !== XMLHttpRequest.DONE) return;

        if (xhr.status >= 200 && xhr.status < 300) {
            const json = JSON.parse(xhr.response);
            if (json.result === 'true') {
                warning.style.color = 'red';
                warning.innerText = '동일한 아이디가 존재합니다.'
            } else {
                warning.style.color = 'gray';
                warning.innerHTML = '사용가능한 아이디 입니다.'
            }
        } else {
            console.error('Error', xhr.status, xhr.statusText);
        }
    };
    xhr.send();
});



const xhr = new XMLHttpRequest();
btnDupl.addEventListener('click', () => {
   //  HTTP 요청 초기화. 통신 방식과 url 설정하기.
   xhr.open('GET', 'ajaxIdCheck.jsp?id='+id.value);
   xhr.onreadystatechange = () => {
       // readState 프로퍼티의 값이 DONE :: 요청한 데이터의 처리가 완료되어 응답할 준비가 완료된 상태.
       if(xhr.readyState !== XMLHttpRequest.DONE) return;
       if (xhr.status >= 200 && xhr.status < 300) { //성공일 경우.
           console.log(xhr.response);
           const json = JSON.parse(xhr.response);
           if (json.result === 'true') {
               warning.innerText = '동일 아이디가 존재 합니다.'
           } else {
               warning.innerText = '사용 가능한 아이디 입니다.'
           }
       } else { // 서버 Url 문서가 존재하지 않음.
           console.error('Error', xhr.status, xhr.statusText);
       }
   };
   xhr.send();
});





btnIsDuplication.addEventListener('click', () => {

    if (id.value === '') {
        alert('아이디를 입력해 주세요.');
        id.focus();
        return;
    }
    window.open('popupIdCheck.jsp?id=' + id.value, 'IdCheck', 'width = 500, height = 500, top = 100, left = 200, location = no');
});