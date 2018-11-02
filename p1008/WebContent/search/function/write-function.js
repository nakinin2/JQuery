function writeCheck(){
	var form = document.writeform;
	if( !form.name.value){  //form에 있는 name 값이 없을 때
		alert("이름을 적어주세요");
		//경고 창을 띄운다. form.name.focus();
		//form에 있는 name 위치로 이동
		return; //다시 돌아간다
	}
	if( !form.password.value){ //form에 있는 password 값이 없을 때
		alert("비밀번호를 적어주세요");
		form.password.focus();
		return; 
		//경고 창을 띄운다. form.password.focus();
		//form에 있는 password 위치로 이동
	}
	if( !form.title.value){ //form에 있는 title 값이 없을 때
		alert("제목을 적어주세요");
		form.title.focus();
		return; 
		//경고 창을 띄운다. form.title.focus();
		//form에 있는 title 위치로 이동
	}
	if( !form.memo.value){ //form에 있는 memo 값이 없을 때
		alert("내용을 적어주세요");
		form.memo.focus();
		return; 
		//경고 창을 띄운다. form.memo.focus();
		//form에 있는 memo 위치로 이동
	}
	form.submit();
}