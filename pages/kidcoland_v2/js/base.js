
$(function(){
	/*開啟搜尋列*/
	$('.topsearch').click(function(){		
		$(this).addClass('topsearch_open');
		$(this).find('.topsearch_input').focus();
	});
	/*搜尋點擊收合*/
	$(document).click(function(e){
		var target = $(e.target);
		var targetprev = target.parent();
		if(!target.is('.topsearch_content') && !targetprev.is('.topsearch_content')){
			$('.topsearch').removeClass('topsearch_open');
		}
	});
	/*選單收合*/
	$('.topnav .topnav_btn').click(function(){		
		$('body').addClass('scroll_hide');
		$('.menubox').addClass('menubox_show');
		setTimeout(function(){
			$('.menubg').addClass('scroll_show');
		},1000);
	});
	$('.menubox .topnav_btn').click(function(){	
		$('.menubg').removeClass('scroll_show');	
		$('body').removeClass('scroll_hide');
		$('.menubox').removeClass('menubox_show');
	});
});