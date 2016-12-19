
$(function(){
	changeWidth();
	/*手機MENU*/	
	$('.menubox nav').click(function(){
		console.log('123');
		$(this).next('ul').slideToggle();		
	})
	/*呼叫頁碼*/
	$("#list").quickPager();
	
});
function changeWidth(){
	$swinth = $(window).width();
}