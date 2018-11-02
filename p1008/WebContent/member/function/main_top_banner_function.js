$(document).ready(function() {
	var height = $('#blockB a').height();//blockB의 높이 설정
	var timeout = 0;//자동으로 움직일 때의 시간 설정

	
	function nextA() {
	clearTimeout(timeout);//자동 움직임 시간을 설정
		
	$('#blockB').css({bottom: 0});//blockB의 css 설정
		$('#blockB').animate({bottom: -height}, 600);	//blockB의 밑으로 가게 설정
		$('#blockB a:last-child').prependTo('#blockB');
	$myclone = $('#blockB a:last-child').clone(); //blockB에 blockA의 마지막 child를 복사
	
	var image_manipulation = $myclone.html() ;	//복사했던 것을 html에 가져온다.

	$big_image  = image_manipulation.replace(/\s/, ''); //blockB에 있는 그림의 이름에서 _small을 replace로 자른다.
	$('#blockA a').html($big_image); //_small을 자른 것을 blockA의 a태그에 넣는다.
	$('#blockA img').removeClass("min").addClass("max");	//blockA에 class라고 정의한 min를 삭제하고, class라고 정의한 max를 추가한다.
	$('#blockA img').css({opacity: 0}).animate({opacity: 1}, 600);		//blockA img에 css 투명도를 0으로 하고, 투명도가 1로 되도록 0.6초의 시간으로 주면서 천천히 실행(그림이 바뀔 때 실행한다.)
		timeout = setTimeout(function() {
			nextA();
		}, 2000);	//setTimeout으로 3초마다 그림이 바뀌도록 설정
	}
	
	// 마우스를 올렸을 때의 이벤트 설정 (opacity는 낮으면 투명도가 높아진다.)
	$('#block-itunes')	.mouseenter(function() {
			$('#bi-button').stop().animate({opacity: 1});	//버튼을 멈추면 투명도가 기본으로 되도록 설정(기본은 1의 값)
		}).mouseleave(function() {
			$('#bi-button').stop().animate({opacity: 0});	//버튼을 멈추면 투명도가 높아지게 설정 
		});
	$('#bi-button')	.css({opacity: 0})	//버튼의 기본 투명도는 0으로 안 보이게 설정
		.bind('keydown mousedown', function(){
			$(this).addClass('btn-down');	//버튼의 class에 설정한 것을 추가한다.
		})
		.bind('keyup blur mouseup mouseleave', function(){
			$(this).removeClass('btn-down');		//버튼에 마우스를 떼게 되면 버튼의 class btn-down을 삭제한다.
		})
		.click(function() {		//버튼을 클릭하면 다음 그림으로 실행하도록 click 실행
			nextA();
		});
			nextA();// call function nextA() => This is where it starts ! :)
});