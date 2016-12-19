$(document).ready(function(){
  $("#pic_align").hide();
  countwidth(false);
  $(window).resize(function() {
    countwidth(true);
  });
});
var _timer_carousel = null;
var _timer_hide = null;
function countwidth(isresize){
  
  if (_timer_carousel != null){
    clearTimeout(_timer_carousel);
  }
  var wh = $(window).height();
  var ww = $(window).width();
  //以高度為主
  var rate_x = wh/1080;
  var newleftw = Math.round(864 * rate_x);
  var newrightw = ww - newleftw;
  if (newrightw < 500) {
    newrightw = 500;
    newleftw = ww - newrightw;
  }
  if (newleftw < 375){
    newleftw = 375;
  }
  ww = newleftw+newrightw;
//
  $("#all_left").css({'width':ww+'px','height':wh+'px'});
  if (isresize){
    $("#content_margin").css({'width':newrightw+'px','height':wh+'px'});
    //content
    var mmh = $("#content").height();
    var fix_top = Math.round((wh - mmh)/2);
    $("#content").css({'margin-top':fix_top+'px'});
    $("#pic_align,#pic_zoom").css({'width':newleftw+'px','height':wh+'px'});
  }else{
    var mmh = $("#content").height();
    var fix_top = Math.round((wh - mmh)/2);
    $("#content").css({'margin-top':fix_top+'px'});
    $("#content_margin").animate({'width':newrightw+'px','height':wh+'px'}, 1000);
    $("#pic_align,#pic_zoom").animate({'width':newleftw+'px','height':wh+'px'},1000);
  }
  
  var oh = 1080;
  var ow = 864;
  var nnw,nnh;
  nnw = newleftw;
  nnh = wh;
  $("#pic_zoom ._item,#pic_zoom .caroufredsel_wrapper").css({'width':newleftw+'px','height':wh+'px'});
  if (isresize){
    $("#pic_s").trigger("pause");
    resizeIMG(nnw,nnh);
    _timer_carousel = setTimeout(function(){
      $("#pic_s").trigger("play");
    }, 1500);
  }else{
    resizeIMG(nnw,nnh);
    active_scroll();
  }
}
function resizeIMG(nnw,nnh){
  $('#pic_zoom ._item IMG').each(function(i){
    var img = $(this);
    var oh = parseInt(img.attr("data-h"));
    var ow = parseInt(img.attr("data-w"));
    if (isNaN(oh) || isNaN(ow)) {
      oh = img.height();
      ow = img.width();
      img.attr("data-w", ow);
      img.attr("data-h", oh);
    }
    var scalex = 1;
    var scaley = 1;
    var newimgh=nnh,newimgw=nnw;
    newimgw = nnw;
    scaley = ( nnw / ow );
    newimgh = Math.round(oh * scaley);
    var fix_h = Math.round((nnh-newimgh)/2);
    var fix_x = Math.round((nnw-newimgw)/2);
    img.stop().animate({'width':newimgw+'px','height':newimgh+'px','margin-top':fix_h+'px','margin-left':fix_x+'px'});
    });
}
function active_scroll(){
  $("#pic_align").fadeIn(1000);
  _timer_carousel = setTimeout(function(){
    $("#pic_s").carouFredSel({
    	prev	: "#product_prev",
    	next	: "#product_next",
      items : 1,
      auto  :{
        pauseOnHover: true
      },
      scroll : {
        fx      : "crossfade",
        duration    : 3000,
        pauseDuration: 2000
      },
      onCreate: function( data ) {
        $("#product_prev,#product_next").hide();
        $("#pic_align").hover(
          function () {
            if (_timer_hide != null){
              clearTimeout(_timer_hide);
            }
            showBtn();
          }, 
          function () {
            _timer_hide = setTimeout(function(){
              hideBtn();
            }, 800);
          }
        );
      }
    });
  }, 1500);
}

