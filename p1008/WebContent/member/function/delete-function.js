function deleteCheck() {
	var form = document.deleteform;
	
	if( !form.password.value){
		alert("비밀번호를 적어주세요.");
		form.password.focus();
		return;
	}
			form.submit();
}