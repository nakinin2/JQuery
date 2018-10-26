function modifyCheck(){
	var form = document.modifyform;   // if 안에 document.modifyform을 써야 되는데 form이라는 변수를 줘서 간략하게 쓰기 위해서 설정했다.
	
	if( !form.password.value) {
		alert("비밀번호를 적어주세요.");
		form.password.focus();
		return;
	}
	if( !form.title.value) {
		alert("제목을 적어주세요.");
		form.title.focus();
		return;
	}
	if( !form.memo.value) {
		alert("내용을 적어주세요.");
		form.memo.focus();
		return;
	}
	form.submit();
}