  var process=null;
  var nowpernum = 0;
  $(document).ready(function(){
    var wh = $(window).height();
    var ww = $(window).width();
    $('#all_bd div._imgs').css({'width':ww+'px','height':wh+'px'});
    
	$("#all_bd").carouFredSel({
      width: ww,
      height: wh,
      align: false,
      items: {
        visible: 1,
        width: 'variable',
        height: 'variable'
      },
      scroll : {
        fx      : "crossfade",
        duration    : 1000,
        pauseDuration: 3000
      }
    }).trigger("pause");


					$('#thumbs a').click(function() {
												  var ttt = this.href.split('#').pop();
												  var tttt = ttt.split('.').shift();
					$('#all_bd').trigger('slideTo', '#'+tttt);
					$('#thumbs a').removeClass('selected');
					$(this).addClass('selected');
					return false;
				});

    var loading	= $('<div id="bd_loading" style="position:absolute; height:100px; width:100px;text-align:center;left:50%;top:50%;margin-top:-50px;margin-left:-50px;"><font face="Arial" size="5" style="color: #F0F0F0;">0%</font></div>');
    $('body').append(loading);
    var start = new Date().getTime();
    process = setInterval(function(){
      fn_showloading(2);
    }, 200);
    var imgcc=0;

    $('#all_bd IMG').each(function(idx){
      var _self = $(this);
      var src = this.src + '?random=' + (new Date()).getTime();
      var img = new Image();
      img.src = src;
      _self.hide();
      $(img).load(function() {
        var oh = img.height;
        var ow = img.width;
        _self.attr("data-w", ow);
        _self.attr("data-h", oh);
        var scalex = 1;
        var scaley = 1;
        if (wh > ww){
          nh = wh;
          scalex = ( wh / oh );
          nw = Math.round(ow * scalex);
        }else{
          nw = ww;
          scaley = ( ww / ow );
          nh = Math.round(oh * scaley);
        }
        var fx = nw / ww;
        var fh = nh / wh;
        var fix_h = (wh - nh )/2;
        var fix_x = (ww - nw)/2;
        if (fix_h>0) fix_h=0;
        _self.attr("src", src);
        _self.css({'width':nw+'px','height':nh+'px','margin-top':fix_h+'px','margin-left':fix_x+'px'});
        if (idx == 0) {
          fn_showloading(100);
        }else{
          _self.fadeIn();
        }
      });
    });
  
    $(window).bind("resize", function() {
      setTimeout(function(){
        bulidBannerIMGs();
      }, 500);
    });
  });
  var oldnum = 0;
  var isstart = false;
  function fn_showloading(shownum){
    if (process!=null){
      clearInterval(process);
      oldnum = nowpernum;
      for(var i=oldnum;i<=shownum;i++){
        $('#bd_loading').html('<font face="Arial Black" size="5" style="color: #F0F0F0;">'+i+'%</font>');
        nowpernum = i;
      }
      if (nowpernum < 90){
        process = setInterval(function(){
          fn_showloading(nowpernum+5);
        }, 200);
      }else if (shownum==100){
            $('#bd_loading').hide().remove();
          $('#all_bd div._imgs').eq(0).find('IMG').fadeIn(800,function(){
            $("#all_bd").trigger("play");

            isstart = true;
          });
      }
      end = new Date().getTime();
    }
  }
  function bulidBannerIMGs(){
    $("#all_bd").trigger("pause");
    var wh = $(window).height();
    var ww = $(window).width();
    var newCss = {
      width: ww,
      height: wh
    };
    var _size = $('#all_bd div').length;
    $('#all_bd').css( {'width':newCss.width*_size+'px' ,'height':newCss.height+'px'});
    $('#all_bd div._imgs').css(newCss);
    $('#all_bd IMG').hide();
    $('#all_bd IMG').each(function(i){
      var img = $(this);
      var oh = parseInt(img.attr("data-h"));
      var ow = parseInt(img.attr("data-w"));
      if (isNaN(oh) || isNaN(ow)) return false;
      var scalex = 1;
      var scaley = 1;
      if (wh > ww){
        nh = wh;
        scalex = ( wh / oh );
        nw = Math.round(ow * scalex);

      }else{
        nw = ww;
        scaley = ( ww / ow );
        nh = Math.round(oh * scaley);
      }
      var fx = nw / ww;
      var fh = nh / wh;
      var fix_h = (wh - nh )/2;
      var fix_x = (ww - nw)/2;
      if (fix_h>0) fix_h=0;
      img.show().animate({'width':nw+'px','height':nh+'px','margin-top':fix_h+'px','margin-left':fix_x+'px'});
    });
    if (isstart){
    setTimeout(function(){
      $("#all_bd").trigger("play");
    }, 1500);
    }
  }