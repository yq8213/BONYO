
$(function(){
	/*頁籤*/
	var _showTab = 0;
	$('.tabbox').each(function(){
		// 目前的頁籤區塊
		var $tab = $(this);
		var $defaultLi = $('.class_type li', $tab).eq(_showTab).addClass('current');
		$($defaultLi.find('a').attr('href')).siblings().hide();
		console.log($defaultLi.find('a').attr('href'))
		$('.class_type li', $tab).click(function() {			
			var $this = $(this),
				_clickTab = $this.find('a').attr('href');			
			$this.addClass('current').siblings('.current').removeClass('current');			
			$(_clickTab).stop(false, true).fadeIn().siblings().hide();
			return false;
		}).find('a').focus(function(){
			this.blur();
		});
	});
	/*新增小孩帳號*/
	$('.add_child').click(function(){		
		$(this).before('<input type="text" class="form_input input_normal" placeholder="請輸入您的小孩的帳號">');
	});
	/*新增教學講義*/
	$('.add_file').click(function(){		
		$(this).before('<input type="file" class="form_input">');
	});
	/*新增課程*/
	$('.add_class').click(function(){		
		$('.addlistbox').slideToggle();
	});
	$('.addlistbox dl').click(function(){				
		$('.add_class').before('<span class="form_input class_name">戰國時代<font class="del_class" onclick="deleteRow(this)" >+</font>');
	});
	/*手機主選單收合*/
	$('.mb_search_btn').click(function(){		
		$('header').toggleClass('mb_nav_close');
		$(this).parents('header').find('.topnav').slideToggle();
		$(this).parents('.logobox').find('.mb_nav_btn').toggleClass('mb_nav_close');
		$(this).parents('header').find('.topnav .search').focus();
	});
	$('.mb_nav_btn').click(function(){
		$(this).parents('header').find('.topnav').slideToggle();
		$(this).toggleClass('mb_nav_close');
	});
});
//刪除課程
function deleteRow(elem) {
	var row = $(elem).parent('.class_name');
	row.remove();

}