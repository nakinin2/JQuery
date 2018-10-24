/*
function id_chk(){
	open("id_check.jsp?id="+document.writeform.id.value,target="_self"); //중복체크를 확인을 위해 사용하는 명령어
}
*/
jQuery.noConflict();

$(function(){
	$("body").click(function(){
		$("#nameHelper").off("click").text("");
		$("#idHelper").off("click").text("");
		$("#passwordHelper").off("click").text("");
		$("#repasswordHelper").off("click").text("");
		$("#nicknameHelper").off("click").text("");
		$("#telHelper").off("click").text("");
		$("#email1Helper").off("click").text("");
	});
});

//윈도우 모드(return false;를 해 주면 submit이 정보가 일치하지 않아도 넘어가는 현상을 막을 수 있다.)

//이름 메소드
$(function(){
	//name에 포커스
	$("#name").focus();
	//등록 버튼 클릭 시
	$("#s_insert").click(function(){
		var space1=document.writeform.name.value.replace(/\s|　/gi, "");
		var num1=/^([a-z]|[ㄱ-힣]){0}[a-zA-Zㄱ-힣]{1,10}$/;
		//닉네임이 공백이거나 1자 미만일 경우 실행
		if( space1 == ""){
			if( $("#name").val().length > 8 && !space1){
				//오류 출력
				$("#nameHelper").text("최대 8자리를 넘을 수 없습니다.");
				//이름에 포커스
				$("#name").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}
			$("#nameHelper").text("이름을 입력해 주세요.");
			$("#name").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정

		//이름이 숫자로 시작하면 실행
		}else if( !document.writeform.name.value.match(num1) ) {
			if( ($("#name").val().length > 8) && !document.writeform.name.value.match(num1) ){
				$("#nameHelper").text("최대 8자리를 넘을 수 없습니다.");
				$("#name").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}
			$("#nameHelper").text("숫자와 특수문자는 올 수 없습니다.");
			$("#name").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if($("#name").val().length > 8){
			$("#nameHelper").text("최대 8자리를 넘을 수 없습니다.");
			$("#name").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if($("#name").val().length < 2){
			$("#nameHelper").text("최소 2자리 이상 입력해 주세요.");
			$("#name").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else{
			$("#nameHelper").text("");
			$("#writeform").submit();
		}
	});
});

//아이디 메소드
$(function(){
	//ID에 포커스
	$("#id").focus();
	//등록 버튼 클릭 시
	$("#s_insert").click(function(){
		var num2=/^([a-zA-Zㄱ-힣]){1}[a-zA-Zㄱ-힣0-9,!,@,#,$,%,^,&,*,(,),_,\-,=,+]{0,7}$/;
		var space2=document.writeform.id.value.replace(/\s|　/gi, "");
		//아이디가 공백이거나 8자 초과할 경우 실행
		if( "" == space2 ){
			if( $("#id").val().length > 8 ){
				//오류 출력
				$("#idHelper").text("최대 8자리를 넘을 수 없습니다.");
				//아이디에 포커스
				$("#id").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}
			//오류 출력
			$("#idHelper").text("아이디를 입력해 주세요.");
			//아이디에 포커스
			$("#id").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		//이름이 공백이나 숫자이거나 2자 미만이면 실행
		}else if( !document.writeform.id.value.match(num2) ){
			if(  $("#id").val().length > 8  ){
				$("#idHelper").text("최대 8자리를 넘을 수 없습니다.");
				//아이디에 포커스
				$("#id").focus();
				return false;
			}else{
				$("#idHelper").text("숫자로 시작할 수가 없습니다.");
				//아이디에 포커스
				$("#id").focus();
				return false;
			}
		}else if(  $("#id").val().length < 2 ){
			$("#idHelper").text("최소 2자리 이상 입력해 주세요.");
			//아이디에 포커스
			$("#id").focus();
			return false;
		}else{
			$("#idHelper").text("");
			$("#writeform").submit();
		}
	});
});

//비밀번호 메소드
$(function(){
	//passwd에 포커스
	$("#passwd").focus();
	//등록 버튼 클릭 시
	$("#s_insert").click(function(){
		//var space3=document.writeform.passwd.value.replace(/\s+|  /gi, "");
		var space3=document.writeform.passwd.value.replace( /^\s+|\s+$/g, "");

		var passnum1=/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;
		//비밀번호가 공백이거나 8자 초과할 경우 실행
		if( space3 == "" ){
			if( $("#passwd").val().length >8){
				//오류 출력
				$("#passwordHelper").text("최대 8자리를 넘을 수 없습니다.");
				//비밀번호에 포커스
				$("#passwd").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}
			//오류 출력
			$("#passwordHelper").text("비밀번호를 입력해 주세요.");
			$("#passwd").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		//비밀번호 확인 공백이거나 비밀번호와 일치 않으면 실행
		}else if( !document.writeform.passwd.value.match(passnum1) ){

			if ( ($("#passwd").val().length > 8) ){
				$("#passwordHelper").text("최대 8자리를 넘을 수 없습니다.");
				//비밀번호에 포커스
				$("#passwd").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}else if ( ($("#passwd").val().length < 3) ){
				$("#passwordHelper").text("최소 3자리 이상 입력해 주세요.1");
				//비밀번호에 포커스
				$("#passwd").focus();
				return false;
			}else if ( (document.writeform.passwd.value.indexOf(" ") > -1) ){
				$("#passwordHelper").text("공백 없이 입력해 주세요.");
				//비밀번호에 포커스
				$("#passwd").focus();
				return false;
			}
			$("#passwordHelper").text("특수문자를 입력해 주세요.");
			//비밀번호에 포커스
			$("#passwd").focus();
			return true;
		}else if( document.writeform.passwd.value.match(passnum1) ){
			if ( ($("#passwd").val().length < 3) ){
				$("#passwordHelper").text("최소 3자리 이상 입력해 주세요.2");
				//비밀번호에 포커스
				$("#passwd").focus();
				return false;
			}else if ( ($("#passwd").val().length > 8) ){
				$("#passwordHelper").text("최대 8자리를 넘을 수 없습니다.");
				//비밀번호에 포커스
				$("#passwd").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}else if ( (document.writeform.passwd.value.indexOf(" ") > -1) ){
				$("#passwordHelper").text("공백 없이 입력해 주세요.");
				//비밀번호에 포커스
				$("#passwd").focus();
				return false;
			}
		}
		else{
			$("#passwordHelper").text("");
			$("#writeform").submit();
		}
	});
});

//비밀번호 확인 메소드
$(function(){
	//repasswd에 포커스
	$("#repasswd").focus();
	//등록 버튼 클릭 시
	$("#s_insert").click(function(){
		//비밀번호 확인이 공백이거나 비밀번호와 일치하지 않을 경우 실행
		if( $("#repasswd").val() == "" || $("#passwd").val() != $("#repasswd").val()){
			//오류 출력
			$("#repasswordHelper").text("비밀번호가 일치하지 않습니다.");
			$("#repasswd").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		//닉네임이 공백이면 실행
		}else{
			$("#repasswordHelper").text("");
			$("#writeform").submit();
		}
	});
});

//닉네임 메소드
$(function(){
	//nickname에 포커스
	$("#nickname").focus();
	$("#s_insert").click(function(){
		var space4=document.writeform.nickname.value.replace(/\s|　/gi, "");
		var nickname2=/([!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~])/;
		//닉네임이 공백이거나 비밀번호 확인이 공백이면 실행
		if( space4 == ""){
			if( $("#nickname").val().length > 8){
				//오류 출력
				$("#nicknameHelper").text("닉네임을 2자리 ~ 8자리까지 입력해 주세요.");
				//닉네임에 포커스
				$("#nickname").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}else if ( (document.writeform.nickname.value.indexOf(" ") > -1) ){
				$("#nicknameHelper").text("공백 없이 입력해 주세요.");
				//비밀번호에 포커스
				$("#nickname").focus();
				return false;
			}
			//오류 출력
			$("#nicknameHelper").text("닉네임을 입력해 주세요.");
			$("#nickname").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if( document.writeform.nickname.value.match(nickname2) ){
			if( $("#nickname").val().length > 8 && nickname2){
				//오류 출력
				$("#nicknameHelper").text("최대 8자리를 넘을 수 없습니다.");
				//닉네임에 포커스
				$("#nickname").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}
			else{
				$("#nicknameHelper").text("특수문자를 넣을 수가 없습니다.");
				$("#nickname").focus();
				return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
			}
		}else if( $("#nickname").val().length > 8 ){
			$("#nicknameHelper").text("최대 8자리를 넘을 수 없습니다.");
			$("#nickname").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if( $("#nickname").val().length < 2){
			$("#nicknameHelper").text("최소 2자리 이상 입력해 주세요.");
			$("#nickname").forcus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if ( (document.writeform.nickname.value.indexOf(" ") > -1) ){
			$("#nicknameHelper").text("공백 없이 입력해 주세요.");
			//비밀번호에 포커스
			$("#nickname").focus();
			return false;
		}else{
			$("#nicknameHelper").text("");
			$("#writeform").submit();
		}
	});
});

//휴대폰 메소드
$(function(){
	//tel에 포커스
	$("#tel").focus();
	$("#s_insert").click(function(){
		var phone1 = /^(01)([0|1|2|3|4|5|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;
		//var phon1 = tel.concat(phone1,"$1-$2-$3");
		//var phon2 = $("#tel").val().replace(/(\d{3})(\d{4})(\d{5})/g, "$1-$2-$3");
		//전화번호가 공백이거나 
		if( $("#tel").val() == "" ){
  		//오류 출력
			$("#telHelper").text("전화번호를 입력해 주세요.");
			$("#tel").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if( $("#tel").val().length > 11){
			$("#telHelper").text("휴대폰 번호가 유효하지 않습니다.");
			$("#tel").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if( !document.writeform.tel.value.match(phone1) ){
			$("#telHelper").text("휴대폰 번호가 유효하지 않습니다.");
			$("#tel").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else{
			$("#telHelper").text("");
			$("#writeform").submit();
		}
	});
});
/*
//jQuery 로 핸드폰 번호 입력시 하이푼(-) 자동으로 넣고 빼기 

$(function(){ 
    $("#tel").blur(function(){
    	var num = $("#tel").val();
    	blur(num)
    });
    $("#tel").click(function(){
    	var num = $("#tel").val();
    	focus(num);
    });
});

function focus(num) {//액션이 발생하면 실행
	num = num.replace(/[^0-9]/g, '');
	$("#tel").val(num);
}

function blur(num) {//액션이 끝났을 때 실행
	num = num.replace(/[^0-9]/g, '');
	var tmp = '';
	tmp += num.substr(0, 3);
	tmp += '-';
	tmp += num.substr(3, 4);
	tmp += '-';
	tmp += num.substr(7);
	$("#tel").val(tmp);
}

*/

//이메일 메소드
$(function(){
	//eamil1에 포커스
	$("#email1").focus();
	$("#s_insert").click(function(){
		var email_pattern =/^([a-z0-9])[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/i;
		//이메일이 공백이거나 10자 초과일 시 실행
		if( $("#email1").val() == "" ){
			//오류 출력
			$("#email1Helper").text("이메일을 입력해 주세요.");
			$("#email1").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else if( !document.writeform.email1.value.match(email_pattern) ){
			$("#email1Helper").text("유효하지 않는 이메일입니다.");
			$("#email1").focus();
			return false;	//flase로 리턴 하여 true일 때만 실행하게 설정
		}else{
			$("#email1Helper").text("");
			$("#writeform").submit();
		}
	});
});

