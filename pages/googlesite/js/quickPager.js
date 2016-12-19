//-------------------------------------------------
//		Quick Pager jquery plugin
//		Created by dan and emanuel @geckonm.com
//		www.geckonewmedia.com
// 
//
//		18/09/09 * bug fix by John V - http://blog.geekyjohn.com/
//		1.2 - allows reloading of pager with new items
//-------------------------------------------------

(function($) {
	$swinth = $(window).width();
	$.fn.quickPager = function(options) {
		if($swinth<970)
		{
			var defaults = {
			pageSize: 6,
			currentPage: 1,
			holder: null,
			pagerLocation: "after"
		};
		}
		else{
		var defaults = {
			pageSize: 10,
			currentPage: 1,
			holder: null,
			pagerLocation: "after"
		};
		}
		var options = $.extend(defaults, options);
		
		
		return this.each(function() {
	
						
			var selector = $(this);	
			var pageCounter = 1;
			
			selector.wrap("<div class='simplePagerContainer'></div>");
			
			selector.parents(".simplePagerContainer").find("ul.simplePagerNav").remove();
			
			selector.children().each(function(i){ 
				if(i < pageCounter*options.pageSize && i >= (pageCounter-1)*options.pageSize) {
				$(this).addClass("simplePagerPage"+pageCounter);
				}
				else {
					$(this).addClass("simplePagerPage"+(pageCounter+1));
					pageCounter ++;
				}	
				
			});
			
			// show/hide the appropriate regions 
			selector.children().hide();
			selector.children(".simplePagerPage"+options.currentPage).show();
			
			if(pageCounter <= 1) {
				return;
			}
			
			//Build pager navigation
			var pageNav = "<div id='pageNavbox'><ul class='simplePagerNav'>";	
			for (i=1;i<=pageCounter;i++){
				if (i==options.currentPage) {
					pageNav += "<li class='currentPage simplePageNav"+i+"'><a rel='"+i+"' href='#'>"+i+"</a></li>";	
				}
				else {
					pageNav += "<li class='simplePageNav"+i+"'><a rel='"+i+"' href='#'>"+i+"</a></li>";
				}
			}
			pageNav += "</ul><a class='prev'></a><a class='next'></a></div>";
			
			if(!options.holder) {
				switch(options.pagerLocation)
				{
				case "before":
					selector.before(pageNav);
				break;
				case "both":
					selector.before(pageNav);
					selector.after(pageNav);
				break;
				default:
					selector.after(pageNav);
				}
			}
			else {
				$(options.holder).append(pageNav);
			}
			
			//pager navigation behaviour
			selector.parent().find("#pageNavbox .simplePagerNav a").click(function() {				
				//grab the REL attribute 
				var clickedLink = $(this).attr("rel");
				options.currentPage = clickedLink;
				
				if(options.holder) {
					$(this).parent("li").parent("ul").parent(options.holder).find("li.currentPage").removeClass("currentPage");
					$(this).parent("li").parent("ul").parent(options.holder).find("a[rel='"+clickedLink+"']").parent("li").addClass("currentPage");
				}
				else {
					//remove current current (!) page
					$(this).parent("li").parent("ul").find("li.currentPage").removeClass("currentPage");
					//Add current page highlighting
					$(this).parent("li").parent("ul").find("a[rel='"+clickedLink+"']").parent("li").addClass("currentPage");
				}
				
				//hide and show relevant links
				selector.children().hide();			
				selector.find(".simplePagerPage"+clickedLink).show();
				
				return false;
			});
			//限制數量
			var ul_w = $("#pageNavbox ul").width();
			var li_w = $("#pageNavbox li").width();
			var li_n = $("#pageNavbox li").length;
			var navbox = $("#pageNavbox .simplePagerNav");
			var next = $("#pageNavbox .next");
			var prev = $("#pageNavbox .prev");
			//var page = Math.floor(ul_w/li_w);
			var li_max = li_w*li_n+100;
			if(li_max>ul_w){
				next.show();
				prev.show();				
				next.hover(
					function() {
					  thumbs_scroll_interval = setInterval(
						function() {
							var left = navbox.scrollLeft() + 1;
							navbox.scrollLeft(left);
						},
						20
					  );
					},
					function() {
					  clearInterval(thumbs_scroll_interval);
					}
				);
				prev.hover(
					function() {
					  thumbs_scroll_interval = setInterval(
						function() {
							var left = navbox.scrollLeft() - 1;
							navbox.scrollLeft(left);
						},
						20
					  );
					},
					function() {
					  clearInterval(thumbs_scroll_interval);
					}
				);
				
			}
			
		});
	}
	

})(jQuery);
