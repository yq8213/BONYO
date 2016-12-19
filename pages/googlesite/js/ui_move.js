
$(function(){
	var $block = $('.photo_box'),
		pic = $block.find('li'),		
		showIndex = 0,
		speed = 3000;		
	pic.css({
		opacity: 0,
		zIndex: 1
	}).eq(showIndex).css({
		opacity: 1,
		zIndex: 2
	});	
	function autoRun(){	
		showIndex = (showIndex + 1) % pic.length;	
		pic.eq(showIndex).fadeTo(speed, 1,function(){
			timer = setTimeout(autoRun, speed + speed);
		}).css('zIndex', 2).siblings(pic).fadeTo(speed, 0).css('zIndex', 1);	
		//console.log(showIndex);			
	}
	timer = setTimeout(autoRun, speed);
	$("#list").quickPager();
});
