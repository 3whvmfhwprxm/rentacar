$.fn.quickmenu = function(){
	//var t
	//console.log(this[0].height());
	//console.log($(document).height());
	var sc = $(window).scrollTop();
	if(sc>232){
		this.css({
			"top":sc+25
		});
	}else{
		this.css({
			"top":232+25
		});
	}
};

$(document).ready(function(){
	$(window).scroll(function(){
		$(".quickmenu").quickmenu();
	});
	$(".quickmenu").quickmenu();
});