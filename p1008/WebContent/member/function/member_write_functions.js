
//윈도우 모드(return false;를 해 주면 submit이 정보가 일치하지 않아도 넘어가는 현상을 막을 수 있다.)

//이름 메소드
$(function(){
	//name에 포커스
	$("#Name").focus();
	//등록 버튼 클릭 시
	$("#s_insert").click(function(){
		var space1=document.write_form.Name.value.replace(/\s|　/gi, "");
		var num1=/^([a-z]|[ㄱ-힣]){0}[a-zA-Zㄱ-힣]{1,10}$/;
		//닉네임이 공백이거나 1자 미만일 경우 실행
		if( space1 == ""){
			if( $("#Name").val().length > 8 && !space1){
				//오류 출력
				$("#NameHelper").text("최대 8자리를 넘을 수 없습니다.");
				//이름에 포커스
				$("#Name").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}
			$("#NameHelper").text("이름을 입력해 주세요.");
			$("#Name").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정

		//이름이 숫자로 시작하면 실행
		}else if( !document.write_form.Name.value.match(num1) ) {
			if( ($("#Name").val().length > 8) && !document.write_form.Name.value.match(num1) ){
				$("#NameHelper").text("최대 8자리를 넘을 수 없습니다.");
				$("#Name").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}
			$("#NameHelper").text("숫자와 특수문자는 올 수 없습니다.");
			$("#Name").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if($("#Name").val().length > 8){
			$("#NameHelper").text("최대 8자리를 넘을 수 없습니다.");
			$("#Name").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if($("#Name").val().length < 2){
			$("#NameHelper").text("최소 2자리 이상 입력해 주세요.");
			$("#Name").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else{
			$("#NameHelper").text("");
			$("#write_form").submit();
		}//end else
	});//end click
});//end Name funcition

//아이디 메소드(실시간 체크)
$(function(){
	//ID에 포커스
	$("#Id").focus();
	//등록 버튼 클릭 시
	$("#s_insert").click(function(){
		var id1=/^([a-zA-Zㄱ-힣]){1}[a-zA-Zㄱ-힣0-9,!,@,#,$,%,^,&,*,(,),_,\-,=,+]{0,7}$/;
		var space2=document.write_form.Id.value.replace(/\s|　/gi, "");
		//아이디가 공백이거나 8자 초과할 경우 실행
		if( "" == space2 ) {
			if( $("#Id").val().length > 8 ) {
				//오류 출력
				$("#IdHelper").text("최대 8자리를 넘을 수 없습니다.");
				//아이디에 포커스
				$("#Id").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}
			//오류 출력
			$("#IdHelper").text("아이디를 입력해 주세요.");
			//아이디에 포커스
			$("#Id").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		//이름이 공백이나 숫자이거나 2자 미만이면 실행
		}else if( !document.write_form.Id.value.match(id1) ) {
			if(  $("#Id").val().length > 8  ) {
				$("#IdHelper").text("최대 8자리를 넘을 수 없습니다.");
				//아이디에 포커스
				$("#Id").focus();
				return false;
			}else{
				$("#IdHelper").text("숫자로 시작할 수가 없습니다.");
				//아이디에 포커스
				$("#Id").focus();
				return false;
			}
		}else if(  $("#Id").val().length < 2 ) {
			$("#IdHelper").text("최소 2자리 이상 입력해 주세요.");
			//아이디에 포커스
			$("#Id").focus();
			return false;
		}else{
			$("#IdHelper").text("");
			$("#write_form").submit();
		}//end else
	});//end click
});//end Id funcition

//비밀번호 메소드(실시간 체크)
$(function(){
	//Passwd에 포커스
	$("#Passwd").focus();
	//등록 버튼 클릭 시
	$("#s_insert").click(function(){
		var space3=document.write_form.Passwd.value.replace( /^\s+|\s+$/g, "");
		var passnum1=/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;
		//비밀번호가 공백이거나 8자 초과할 경우 실행
		if( space3 == "" ){
			if( $("#Passwd").val().length > 8 ){
				//오류 출력
				$("#PasswordHelper").text("최대 8자리를 넘을 수 없습니다.");
				//비밀번호에 포커스
				$("#Passwd").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}
			//오류 출력
			$("#PasswordHelper").text("비밀번호를 입력해 주세요.");
			$("#Passwd").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		//비밀번호 확인 공백이거나 비밀번호와 일치 않으면 실행
		}else if( !document.write_form.Passwd.value.match(passnum1) ) {
			if ( ($("#Passwd").val().length > 8) ) {
				$("#PasswordHelper").text("최대 8자리를 넘을 수 없습니다.");
				//비밀번호에 포커스
				$("#Passwd").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}else if ( ($("#Passwd").val().length < 3) ) {
				$("#PasswordHelper").text("최소 3자리 이상 입력해 주세요.1");
				//비밀번호에 포커스
				$("#Passwd").focus();
				return false;
			}else if ( (document.write_form.Passwd.value.indexOf(" ") > -1) ) {
				$("#PasswordHelper").text("공백 없이 입력해 주세요.");
				//비밀번호에 포커스
				$("#Passwd").focus();
				return false;
			}
			$("#PasswordHelper").text("특수문자를 입력해 주세요.");
			//비밀번호에 포커스
			$("#Passwd").focus();
			return true;
		}else if( document.write_form.Passwd.value.match(passnum1) ) {
			if ( $("#Passwd").val().length < 3 ){
				$("#PasswordHelper").text("최소 3자리 이상 입력해 주세요.2");
				//비밀번호에 포커스
				$("#Passwd").focus();
				return false;
			}else if ( $("#Passwd").val().length > 8 ) {
				$("#PasswordHelper").text("최대 8자리를 넘을 수 없습니다.");
				//비밀번호에 포커스
				$("#Passwd").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}else if ( document.write_form.Passwd.value.indexOf(" ") > -1 ){
				$("#PasswordHelper").text("공백 없이 입력해 주세요.");
				//비밀번호에 포커스
				$("#Passwd").focus();
				return false;
			}
		}else{
			$("#PasswordHelper").text("");
			$("#write_form").submit();
		}//end else
	});//end click
});//end Passwd funcition

//비밀번호 확인 메소드(실시간 체크)
$(function(){
	//repasswd에 포커스
	$("#repasswd").focus();
	//등록 버튼 클릭 시
	$("#s_insert").click(function() {
		//비밀번호 확인이 공백이거나 비밀번호와 일치하지 않을 경우 실행
		if( $("#repasswd").val() == "" || $("#Passwd").val() != $("#repasswd").val() ) {
			//오류 출력
			$("#repasswordHelper").text("비밀번호가 일치하지 않습니다.");
			$("#repasswd").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		//닉네임이 공백이면 실행
		}else{
			$("#repasswordHelper").text("");
			$("#write_form").submit();
		}//end else
	});//end click
});//end repasswd funcition

//닉네임 메소드(실시간 체크)
$(function(){
	//NickName에 포커스
	$("#NickName").focus();
	$("#s_insert").click(function(){
		var space4=document.write_form.NickName.value.replace(/\s|　/gi, "");
		var nickname2=/([!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~])/;
		//닉네임이 공백이거나 비밀번호 확인이 공백이면 실행
		if( space4 == ""){
			if( $("#NickName").val().length > 8){
				//오류 출력
				$("#NickNameHelper").text("닉네임을 2자리 ~ 8자리까지 입력해 주세요.");
				//닉네임에 포커스
				$("#NickName").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}else if ( (document.write_form.NickName.value.indexOf(" ") > -1) ){
				$("#NickNameHelper").text("공백 없이 입력해 주세요.");
				//비밀번호에 포커스
				$("#NickName").focus();
				return false;
			}
			//오류 출력
			$("#NickNameHelper").text("닉네임을 입력해 주세요.");
			$("#NickName").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if( document.write_form.NickName.value.match(nickname2) ){
			if( $("#NickName").val().length > 8 && nickname2){
				//오류 출력
				$("#NickNameHelper").text("최대 8자리를 넘을 수 없습니다.");
				//닉네임에 포커스
				$("#NickName").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}
			else{
				$("#NickNameHelper").text("특수문자를 넣을 수가 없습니다.");
				$("#NickName").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}
		}else if( $("#NickName").val().length > 8 ){
			$("#NickNameHelper").text("최대 8자리를 넘을 수 없습니다.");
			$("#NickName").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if( $("#NickName").val().length < 2){
			$("#NickNameHelper").text("최소 2자리 이상 입력해 주세요.");
			$("#NickName").forcus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if ( (document.write_form.NickName.value.indexOf(" ") > -1) ){
			$("#NickNameHelper").text("공백 없이 입력해 주세요.");
			//비밀번호에 포커스
			$("#NickName").focus();
			return false;
		}else{
			$("#NickNameHelper").text("");
			$("#write_form").submit();
		}//end else
	});//end click
});//end NickName funcition

//휴대폰 메소드(실시간 체크)
$(function(){
	//Tels에 포커스
	$("#Tels").focus();
	$("#s_insert").click(function(){
		var space5=document.write_form.Tels.value.replace(/\s|　/gi, "");
		var phone1 = /^(01)([0|1|2|3|4|5|6|7|8|9]?)([0-9]{5})([0-9]{4})$/;
		//전화번호가 공백이거나 
		if( space5 == "" ){
  		//오류 출력
			$("#telHelper").text("전화번호를 입력해 주세요.");
			$("#Tels").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if( $("#Tels").val().length > 11){
			$("#telHelper").text("휴대폰 번호가 유효하지 않습니다.");
			$("#Tels").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if( ! document.write_form.Tels.value.match(phone1) ){
			$("#telHelper").text("휴대폰 번호가 유효하지 않습니다.");
			$("#Tels").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else{
			$("#telHelper").text("");
			$("#write_form").submit();
		}//end else
	});//end click
});//end Tels function

//이메일 메소드(실시간 체크)
$(function(){
	//eamil1에 포커스
	$("#email1").focus();
	$("#s_insert").click(function(){
		var space6=document.write_form.email1.value.replace(/\s|　/gi, "");
		var email_pattern =/^([a-z0-9])[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/i;
		//이메일이 공백이거나 10자 초과일 시 실행
		if( space6 == "" ){
			//오류 출력
			$("#email1Helper").text("이메일을 입력해 주세요.");
			$("#email1").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if( !document.write_form.email1.value.match(email_pattern) ){
			if( $("#email1").val().length > 20 ){
				$("#email1Helper").text("이메일을 20자 미만으로 입력해 주세요.");
				$("#email1").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정	
			}
			$("#email1Helper").text("유효하지 않는 이메일입니다.");
			$("#email1").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if( $("#email1").val().length > 20 ){
			$("#email1Helper").text("이메일을 20자 미만으로 입력해 주세요.");
			$("#email1").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정	
		}else{
			$("#email1Helper").text("");
			$("#write_form").submit();
		}//end else
	});//end click
});//end email1 function

$(function(){
	$("#mem-write-body").click(function(){
		$("#NameHelper").off("click").text("");
		$("#IdHelper").off("click").text("");
		$("#PasswordHelper").off("click").text("");
		$("#repasswordHelper").off("click").text("");
		$("#NickNameHelper").off("click").text("");
		$("#telHelper").off("click").text("");
		$("#email1Helper").off("click").text("");
	});
});//end function -body를 눌렀을 때 텍스트가 사라지는 함수

//아이디를 입력하는 도중에 실시간으로 중복확인 하는 방법
$(function(){
	$("#Id").keyup(function() {
		if ( document.write_form.Id.value.indexOf(" ") > -1 ) {
			$("#IdHelper").text("공백 없이 입력해 주세요.");
			//비밀번호에 포커스
			$("#Id").focus();
			return false;
		}else if ( $("#Id").val().length < 2 ) {
			$("#IdHelper").text("최소 2자리 이상 입력해 주세요.");
			//비밀번호에 포커스
			$("#Id").focus();
			return false;
		}else if ( $("#Id").val().length > 8 ) {
			$("#IdHelper").text("최대 8자리를 넘을 수 없습니다.");
			//비밀번호에 포커스
			$("#Id").focus();
			return false;
		}//end if
		$.ajax({
			url:"id_check.jsp",
			type:"POST",
			dataType:"html",
			data:{
				id:$("#Id").val()
			},
			success: function(data){
				if (data){
					$("#IdHelper").html(data);
					return false;
				}else {
					$("#IdHelper").html(data);
					return false;
				}//end else
			},//end success
			error: function(data){
				alert("오류가 발생했습니다.");
			}//end error
		});//end ajax
		$("#IdHelper").text("");
		return false;
	});//end click
});//end ajax function

function chkform(){
	var idchk = document.write_form.id_check2.value;
	if ( idchk == "" ) {
		$("#IdHelper").text("아이디 중복 버튼을 눌러 주세요.");
		$("#NameHelper").off("click").text("");
		$("#PasswordHelper").off("click").text("");
		$("#repasswordHelper").off("click").text("");
		$("#NickNameHelper").off("click").text("");
		$("#telHelper").off("click").text("");
		$("#email1Helper").off("click").text("");
		document.write_form.id_check2.value=1;
		return false;
	}else{
	$("#write_form").submit();
	}
};
