
$(function(){
	//menu
	$('.nav_toggle').click(function() {			
		$('.nav_toggle').toggleClass('nav_isopen');
		$('.nav').toggleClass('nav_isin');
		$('.container_body').toggleClass('container_bodyin');
		$('.wrapper').toggleClass('body_hid');
		return false;
	});
	$(document).click(function(e){
		var target = $(e.target);
		if(!target.is('.nav')){			
			$('.nav_toggle').removeClass('nav_isopen');
			$('.nav').removeClass('nav_isin');
			$('.container_body').removeClass('container_bodyin');
			$('.wrapper').removeClass('body_hid');
		}
	});
	$('.scroll_btn').click(function(){
		$('.nav_toggle').removeClass('nav_isopen');
		$('.nav').removeClass('nav_isin');
		$('.container_body').removeClass('container_bodyin');
		$('.wrapper').removeClass('body_hid');
	});
	//卷軸滑動
	$('.scroll_btn').click(function(){
		_movename = $(this).attr('href');
		//console.log(_movetop)
		$('html,body').animate({
			scrollTop: $(_movename).offset().top
		}, 600);
		return false;
	});
	//問卷
	$('#contact_submit').click(function(){		
		_name = $("#name").val();
		_email = $("#email").val();
		_message = $("#message").val();
		if(_name!==""&&_email!==""&&_message!==""){
	 		$('.pop_box').attr('onclick','send_box()')
	 		$.getScript("https://docs.google.com/forms/d/e/1FAIpQLSfQHPeAH_nOR9TFRA3h5c3ErNthP1rTqua-5MgRfetWw3-Cug/formResponse?entry.358507525="+ _name +"&entry.1166596340="+ _email +"&entry.1436156744=" + _message);
			$('.pop_message p').text('您的留言已成功送出♡')
		}else{
			$('.pop_box').attr('onclick','error_box()')
			$('.pop_message p').text('請確實填寫完畢再送出喔♡')
		}
		$('.pop_box').toggleClass('pop_show');
		$('.wrapper').toggleClass('body_hid');
	});
});
function error_box(){
	$('.pop_box').toggleClass('pop_show');
	$('.wrapper').toggleClass('body_hid');
}
function send_box(){
	$('.pop_box').toggleClass('pop_show');
	$('.wrapper').toggleClass('body_hid');
	location.reload();
}