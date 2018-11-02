function replyCheck(){
	var form = document.replyform;
	
	if( !form.name.value){ //form에 있는 name 값이 없을 때
		alert("이름을 적어주세요");
		form.name.focus(); //form에 있는 name위치로 이동
		return;
	}
	if( !form.password.value){
		alert("비밀번호를 적어주세요");
		form.password.focus();
		return;
	}
	if( !form.title.value){
		alert("제목을 적어주세요");
		form.title.focus();
		return;
	}
	if( !form.memo.value){
		alert("내용을 적어주세요");
		form.memo.focus();
		return;
	}
	form.submit();
}