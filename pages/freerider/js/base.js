
$(function(){
	//banner
	$('.pagedown_btn').click(function() {			
		$('body').animate({
			scrollTop: $('.index_productinfo').offset().top
		}, 1000);
	});
	/*產品介紹與照片集切換*/
	var _showTab = 0;
	$('.productmask section').each(function(){
		var $defaultLi = $('.productbtn a').eq(_showTab).addClass('active');		
		$($defaultLi.attr('href')).siblings('section').hide();		
		$('.productbtn a').click(function() {			
			var $this = $(this),
				_clickTab = $this.attr('href');
			$this.addClass('active').siblings('.active').removeClass('active');			
			$(_clickTab).fadeIn().siblings('section').hide();
			return false;
		});
		$('.productmask .flip a').click(function() {			
			var $this = $(this),
				_clickTab = $this.attr('href');
				_clickbtn = $('.productbtn .active').attr('href');
			if(_clickbtn != _clickTab)
				$('.productbtn .active').removeClass('active').siblings('a').addClass('active');			
			$(_clickTab).fadeIn().siblings('section').hide();
			return false;
		});
	});

	//cover
	var colorname = $('.product_color li').data('color');
	var colorpic = $('.product_color li').data('link');
	var colornum = $('.product_color li').css('border-color');
	$('.product_color h5').find('font').html(colorname);
	$('.product_color h5').find('i').css({'border-color':colornum,'background':colornum});
	$('#cover .pic').find('img').attr('src',colorpic);
	$('.product_color li').mouseenter(function(){
		var colorname = $(this).data('color');
		var colorpic = $(this).data('link');
		var colornum = $(this).css('border-color');
		$('.product_color h5').find('font').html(colorname);
		$('.product_color h5').find('i').css({'border-color':colornum,'background':colornum});
		$('#cover .pic').find('img').attr('src',colorpic);
	});
	//gallery
	var gallerybox = $('#gallery .photo li')
	$(gallerybox).click(function(){
		$thisindex = $(gallerybox).index(this);	
		$Maxphoto = $(gallerybox).length;
		var photolink = $(gallerybox).eq($thisindex).find('img').data('link');
		$('.gallerybox').show();
		$('body').addClass('scroll_hide');
		$('.gallerybox .galleryphoto').find('img').attr('src',photolink)
		$thisindex>0?$(".gallerybox .prev").show():$(".gallerybox .prev").hide();
		$thisindex+1<$Maxphoto?$(".gallerybox .next").show():$(".gallerybox .next").hide();
		$(".gallery").on("swipeleft",function(){		
			$thisindex++
			var photolink = $(gallerybox).eq($thisindex).find('img').data('link');
			$('.gallerybox .galleryphoto').find('img').attr('src',photolink)
			$thisindex>0?$(".gallerybox .prev").show():$(".gallerybox .prev").hide();
			$thisindex+1<$Maxphoto?$(".gallerybox .next").show():$(".gallerybox .next").hide();
		});
		$(".gallery").on("swiperight",function(){
			--$thisindex
			var photolink = $(gallerybox).eq($thisindex).find('img').data('link');
			$('.gallerybox .galleryphoto').find('img').attr('src',photolink)
			$thisindex>0?$(".gallerybox .prev").show():$(".gallerybox .prev").hide();
			$thisindex+1<$Maxphoto?$(".gallerybox .next").show():$(".gallerybox .next").hide();			
		});
	});
	$(".gallerybox .next").click(function(){
		$thisindex++
		var photolink = $(gallerybox).eq($thisindex).find('img').data('link');
		$('.gallerybox .galleryphoto').find('img').attr('src',photolink)
		$thisindex>0?$(".gallerybox .prev").show():$(".gallerybox .prev").hide();
		$thisindex+1<$Maxphoto?$(".gallerybox .next").show():$(".gallerybox .next").hide();
	});
	$(".gallerybox .prev").click(function(){
		--$thisindex
		var photolink = $(gallerybox).eq($thisindex).find('img').data('link');
		$('.gallerybox .galleryphoto').find('img').attr('src',photolink)
		$thisindex>0?$(".gallerybox .prev").show():$(".gallerybox .prev").hide();
		$thisindex+1<$Maxphoto?$(".gallerybox .next").show():$(".gallerybox .next").hide();		
	});
	//highlights
	$('.pic_posdot').mouseenter(function(){
		/*先抓圖片寬度和座標位置*/
		var imgWidth = $(this).parent().find('img').width();
		var thisLeft = parseInt($(this).css('left'));
		//抓取內容
		var picTitle = $(this).data('title');
		var picText = $(this).data('text');
		var picSrc = $(this).data('src');
		$('.appinfobox').html("<a class='close_btn'></a><h3>"+picTitle+"</h3><p>"+picText+"</p><span><img src='"+picSrc+"'></span>")
		if(imgWidth/2 > thisLeft){			
			$('.rightinfo').addClass('rightin');
		}else{			
			$('.leftinfo').addClass('leftin');
		}
	});
	$('.pic_posdot').mouseleave(function(){
		$('.rightinfo').removeClass('rightin');
		$('.leftinfo').removeClass('leftin');		
	});
	$('.close_btn').click(function(){
		$('.rightinfo').removeClass('rightin');
		$('.leftinfo').removeClass('leftin');
		$('.gallerybox').hide();
		$('body').removeClass('scroll_hide')
	});
	//appearance
	apppic();
	//exhibition
	exhipic();
	exhiyear();
	//worldwide
	$('.worldmap_marker').click(function() {			
		var maplink = $(this).data('link');		
		$('body').animate({
			scrollTop: $(maplink).offset().top
		}, 1000);
	});
	//history
	$('.history_box').mouseenter(function() {
		$(this).addClass('history_box_show');
	});
	$('.history_box').mouseleave(function() {
		$(this).removeClass('history_box_show');
	});
	//technology
	$('#pop_box').hide();
	$('.close_btn').click(function() {
        $('#pop_box').hide();
        $('#technologymovie').attr('src', '');
    });
    $('.movie li').click(function() {
        $('#pop_box').show();
        $('.close_btn').show();
        $('#pop_box .technology_picbox').hide();
        $('#pop_box .technology_moviebox').show();
        var movieSrc = $(this).data('link');        
        $('#technology_movie').attr('src', movieSrc + '?rel=0&amp;controls=0&amp;showinfo=0');
    });
    //award
    $('.content dl').mouseenter(function() {
        $(this).addClass('award_show');
    });
    $('.content dl').mouseleave(function() {
        $(this).removeClass('award_show');
    });
    //download
    $('.download_leftbox .cate h2').click(function() {        
        var cateName = $(this).text();
        $('.download_rightbox').find('div').hide().siblings('#'+cateName).fadeIn(); 
        $('.download_rightbox')
    });
});
function apppic(){
	var winWidth = $(window).width()
	var moveWidth = winWidth>1140?1140:100;
	var pageNum = 0;
	var defaultul = $(".apppicbox").find('ul');
	var Maxpage = defaultul.find('li').length
	defaultul.css('width',Maxpage + '00vw')
	$(".apppicbox").on("swipeleft",function(){		
		if(pageNum<Maxpage-1)
			pageNum++;
		if(winWidth<1140){
			var movewidth= 'translateX(-' + pageNum*100 + 'vw)'
		}else{
			var movewidth= 'translateX(-' + pageNum*1140 + 'px)'
		}
		defaultul.css('transform',movewidth)
		pageNum>0?$(".apppicbox .prev").show():$(".apppicbox .prev").hide();
		pageNum+1<Maxpage?$(".apppicbox .next").show():$(".apppicbox .next").hide();
	});
	$(".apppicbox").on("swiperight",function(){
		if(pageNum>0)
			--pageNum;
		if(winWidth<1140){
			var movewidth= 'translateX(-' + pageNum*100 + 'vw)'
		}else{
			var movewidth= 'translateX(-' + pageNum*1140 + 'px)'
		}
		defaultul.css('transform',movewidth)
		pageNum>0?$(".apppicbox .prev").show():$(".apppicbox .prev").hide();
		pageNum+1<Maxpage?$(".apppicbox .next").show():$(".apppicbox .next").hide();
	});
	$(".apppicbox .next").click(function(){		
		if(pageNum<Maxpage-1)
			pageNum++;
		if(winWidth<1140){
			var movewidth= 'translateX(-' + pageNum*100 + 'vw)'
		}else{
			var movewidth= 'translateX(-' + pageNum*1140 + 'px)'
		}
		defaultul.css('transform',movewidth)
		pageNum>0?$(".apppicbox .prev").show():$(".apppicbox .prev").hide();
		pageNum+1<Maxpage?$(this).show():$(this).hide();		
	});
	$(".apppicbox .prev").click(function(){
		if(pageNum>0)
			--pageNum;
		if(winWidth<1140){
			var movewidth= 'translateX(-' + pageNum*100 + 'vw)'
		}else{
			var movewidth= 'translateX(-' + pageNum*1140 + 'px)'
		}
		defaultul.css('transform',movewidth)
		pageNum>0?$(this).show():$(this).hide();
		pageNum+1<Maxpage?$(".apppicbox .next").show():$(".apppicbox .next").hide();		
	});
}
function exhipic(){
	var defaultul_pic = $('.exhibitionphoto_spic li:first-child').find('img').data('link');
	var total = $(".exhibitionphoto_spic li").length;
	var move_w = $('.exhibitionphoto_spic').width(); 
	var page = 1;
	var maxpage = Math.floor(total%5) == 0 ? Math.floor(total/5) : Math.floor(total/5)+1 ;
	$('.exhibitionphoto_ctrl .prev').hide();
	maxpage > 1 ? $('.exhibitionphoto_ctrl .next').show() : $('.exhibitionphoto_ctrl .next').hide(); 
	$("#imgB").attr('src',defaultul_pic)
	$('.exhibitionphoto_spic li').click(function(){
		$("#imgB").css("opacity", 0);		
		var bigpic = $(this).find('img').data('link');
		$("#imgB").attr('src',bigpic)
		$("#imgB").stop();
		$("#imgB").fadeTo(1000, 1.0);
		return false;		
	});
	$('.exhibitionphoto_ctrl .next').click(function(){
		if(page!=maxpage){
			page++;
			$('.exhibitionphoto_ctrl .prev').show();
		}
		if(page == maxpage){
			$('.exhibitionphoto_ctrl .next').hide();
		}
		//滾動縮圖
		$(".exhibitionphoto_spic ul").animate({left:-move_w*(page-1)},1000);
		return false;		
	});
	$('.exhibitionphoto_ctrl .prev').click(function(){
		if(page>1){
			page--;
			$('.exhibitionphoto_ctrl .next').show();
		}
		if(page == 1){
			$('.exhibitionphoto_ctrl .prev').hide();
		}
		//滾動縮圖
		$(".exhibitionphoto_spic ul").animate({left:-move_w*(page-1)},1000);
		return false;		
	});
}
function exhiyear(){
	var mask_h = $('.yearmask').height();
	var total_h = $('.yearmask ul').height();
	//var def_t = parseInt($('.yearmask ul').css('top'));
	var move_h =  mask_h;
	var page = 1;
	var maxpage = Math.floor(total_h%move_h) == 0 ? Math.floor(total_h/move_h) : Math.floor(total_h/move_h)+1 ;
	$('.year_prev').hide();
	maxpage > 1 ? $('year_next').show() : $('year_next').hide();
	$('.year_next').click(function(){
		if(page!=maxpage){
			page++;
			$('.year_prev').show();
		}
		if(page == maxpage){
			$('.year_next').hide();
		}
		//滾動縮圖
		
		$(".yearmask ul").animate({top:-move_h*(page-1)},1000);		
		return false;		
	});
	$('.year_prev').click(function(){
		if(page>1){
			page--;
			$('.year_next').show();
		}
		if(page == 1){
			$('year_prev').hide();
		}
		//滾動縮圖
		$(".yearmask ul").animate({top:-move_h*(page-1)},1000);
		return false;		
	});
}
function subpages(){
	//單元子頁
	var subtop = $('#subpage').offset().top;
	var subpage = $('.subpage_pagename li');
	$('.subpage_pagename li:first-child').addClass('active');
	$(window).on("load resize scroll",function() {
		var bodytop = $('body').scrollTop();
		if(bodytop>subtop){
			$('#subpage').addClass('subpage_movetop')
		}else{
			$('#subpage').removeClass('subpage_movetop')
		}		
		var top = (window.pageYOffset !== undefined) ? window.pageYOffset : (document.documentElement || document.body.parentNode || document.body).scrollTop;
		var art = [];
		$('.subpage_linkname').map(function(k, v){ 
	    	var itemID = $(v).attr('href');
			var itemTop = $(itemID).offset().top;
			if(itemTop < (top + 200)) {
				art.push(v);
			}			
	    });
	 	var gg = $(art.pop()).parent()
	    $(gg).addClass('active').siblings('.active').removeClass('active');
	    
	});
	$(subpage).click(function(){
		var subpagename = $(this).find('a').attr('href');
		$('body').animate({
			scrollTop: $(subpagename).offset().top - 120
		}, 1000);
		return false;
	});
}
function pagegotop(){
	var $win = $(window),
		$ad = $('.page_gotop').hide(),
		_width = $ad.width(),
		_height = $ad.height(),
		_diffY = 20, _diffX = 20,
		_moveSpeed = 800;
	$ad.css({
		top: $(document).height(),
		left: $win.width() - _width - _diffX,
	});
	$win.bind('scroll resize', function(){
		var $this = $(this),
			_win_height = $win.scrollTop(),
			_hide = _win_height/4;
		if(_win_height>_hide)
		{
			$('.page_gotop').fadeIn();
		}else{
			$('.page_gotop').fadeOut();
		}
		$ad.stop().animate({
			top: $this.scrollTop() + $this.height() - _height - _diffY,
			left: $this.scrollLeft() + $this.width() - _width - _diffX
		}, _moveSpeed);
	}).scroll();
	$('.page_gotop').click(function(){
		$('body').animate({
			scrollTop: 0
		}, 1000);
		return false;
	});
}
$(window).on('resize', function () {
	apppic();
});