// JavaScript Document

$(document).ready(function(){
  $(".menu_hover").each(function(){
    $(this).css({'position':'relative','display':'block'});
    var img1 = $(this).find('IMG').eq(0);
    img1.css({'z-index':'2','position':'absolute',top:0,left:0}).show();
    var img2 = $(this).find('IMG').eq(1);
    img2.css({'z-index':'1','position':'absolute',top:0,left:0}).show();
    $(this).hover(
  	  function(){
        if ($(this).hasClass('stop')) return false;
        img1.stop().animate({opacity: '0'},500,function(){});
  	  },
  	  function(){
        if ($(this).hasClass('stop')) return false;
        img1.stop().animate({opacity: '1'},800,function(){});
      }
    );
  });
});
function set2Stop($obj){
  $('.stop').removeClass('stop');
  var img1 = $obj.find('IMG').eq(0);
  $obj.addClass('stop');
  img1.stop().animate({opacity: '0'},500,function(){});
}
function set2Start($obj){
  var img1 = $obj.find('IMG').eq(0);
  $obj.removeClass('stop');
  img1.stop().animate({opacity: '1'},800,function(){});
}