
$(function(){
	/*手機主選單*/
	$('#mbnav .menu_bars').click(function(){
		$('.mask').toggleClass('maskon');
	});
	/*搜尋欄顯示*/
	$('.header_rightbox .icon_search').click(function(){
		$(this).next().toggleClass('search_hide');
		$(this).next().focus();
	});
	$('.menu_seach').click(function(){
		$(this).find('input').focus();
	});	
	mb_menu();
	pc_menu();

});

	
function mb_menu(){
	$('#mbnav li.submenu_btn').click(function(){		
		$clickname = $(this).find('a').attr('href');
		var getDiv = $($clickname).parents('.fadein_default');		
		var thisDiv = $(this).parents('.fadein_default');
		$($clickname).show().siblings().hide();
		$(getDiv).css('left','0');
		$(thisDiv).css('left','-100%');	
		return false;

	});
	$('#mbnav li.back_btn').click(function(){		
		$clickname = $(this).find('a').attr('href');		
		var getDiv = $($clickname).parents('.fadein_default');		
		var thisDiv = $(this).parents('.fadein_default');
		$(thisDiv).css('left','100%');
		$(thisDiv).prev().css('left','0');
		return false;
	});
}
function pc_menu(){	
	var _showTab = 0;
	$('#pcnav').each(function(){
		var $tab = $(this);
		$('#pcmenu li.submenu_btn').mouseover(function() {
			var overname = $(this).find('a').attr('href');
			var subname = $(overname).find('li.submenu_btn a').attr('href');
			$(overname).find('li.submenu_btn').eq(_showTab).addClass('active');
			$(overname).show().siblings().hide();
			if(subname!=undefined){
				$(subname).show().siblings().hide();
				//console.log(subname);
			}else{
				$('#pcsubmenu02 ul').hide();
			}
				$menuheight = 47+$('#pcsubmenu01').height()+$('#pcsubmenu02').height();
				$('#pcnav').stop().animate({height:$menuheight});
		});
		var $defaultLi = $('#pcsubmenu01 li.submenu_btn', $tab).eq(_showTab).addClass('active');
		$($defaultLi.find('a').attr('href')).siblings().hide();
		$('#pcsubmenu01 li.submenu_btn', $tab).mouseover(function() {
			$menuheight = 47+$('#pcsubmenu01').height()+$('#pcsubmenu02').height();
			$('#pcnav').stop().animate({height:$menuheight});	
			var $this = $(this),
				_clickTab = $this.find('a').attr('href');
			$this.addClass('active').siblings('.active').removeClass('active');
			$(_clickTab).stop(false, true).fadeIn().siblings().hide();
			return false;
		}).find('a').focus(function(){
			this.blur();
		});
	});
	/*點擊同按鈕收合*/
	$('#pcmenu li.submenu_btn').click(function(){
		$('#pcnav').stop().animate({height:'47px'});
		return false;
	});
	/*點擊收合*/
	$(document).click(function(e){
		var target = $(e.target);
		var targetprev = target.parent();
		var clickname = target.parents('#mbnav');
		var targetname= target.parents('.topsearch_box');
		if(!targetname.is('.topsearch_box')){			
			$('.search_input').addClass('search_hide');
		}
		if(!targetprev.is('#pcmenu') && !targetprev.is('#pcsubmenu01') && !targetprev.is('#pcsubmenu02')){
			$('#pcnav').stop().animate({height:'47px'});			
		}
		if(!clickname.is('#mbnav') || target.is('.maskon')){
			$('.mask').removeClass('maskon');			
		}
		
	});
}