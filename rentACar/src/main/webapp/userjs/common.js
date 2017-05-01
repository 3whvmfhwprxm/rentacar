// 날짜를 나타내는 객체
function Datetime(y, m, d) {
    this.year = y;
    this.month = m;
    this.day = d;

    this.compare = function(dt) {
        return parseInt(this.toString()) - parseInt(dt.toString());
    };

    this.toString = function() {
    	this.validateLength();
        return (this.year + "-" + this.month + "-"  + this.day);
    };

    this.validateLength = function() {
        this.year = ("0000" + this.year).substring((new String(this.year)).length);
        this.month = ("00" + this.month).substring((new String(this.month)).length);
        this.day = ("00" + this.day).substring((new String(this.day)).length);
    };

    this.clone = function() {
        return new Datetime(this.year, this.month, this.day);
    };
}

function trimmed(value) {
    value = value.replace(/^\s+/, "");  /* remove leading white spaces */
    value = value.replace(/\s+$/g, ""); /* remove trailing while spaces */
    return value;
}

// JavaScript Document	
function gnbOpen(){//메뉴전체보기 열기
	$("#gnb").animate({height:259},250);
	$("#btnGnbClose").removeClass("divHide");
	$("#btnGnbOpen").addClass("divHide");
}

function gnbClose(){//메뉴전체보기 닫기
	$("#gnb").animate({height:40},250);
	$("#btnGnbClose").addClass("divHide");
	$("#btnGnbOpen").removeClass("divHide");
}

$(document).ready(function(){
	//lnb hover효과
	$(".lnb-wrap dd").mouseenter(function(){
		$(this).find('img').attr('src',$(this).find('img').attr('src').replace("_off","_on"));
	}).mouseleave(function(){
		$(this).find('img').attr('src',$(this).find('img').attr('src').replace("_on","_off"));
	});
});


//자동차 용어 사전
//<![CDATA[
$(function(){
 var article = $('.index_list .article');
   article.addClass('hide');
   article.children('.a').slideUp(100);
 $('.index_list .article .trigger').click(function(){
  var myArticle = $(this).parents('.article:first');
  if(myArticle.hasClass('hide')){
   article.addClass('hide').removeClass('show'); // 아코디언 효과를 원치 않으면 이 라인을 지우세요
   article.children('.a').slideUp(100); // 아코디언 효과를 원치 않으면 이 라인을 지우세요
   myArticle.removeClass('hide').addClass('show');
   myArticle.children('.a').slideDown(100);
  } else {
   myArticle.removeClass('show').addClass('hide');
   myArticle.children('.a').slideUp(100);
  }
 });
 $('.index_list .hgroup .trigger').click(function(){
  var hidden = $('.index_list .article.hide').length;
  if(hidden > 0){
   article.removeClass('hide').addClass('show');
   article.children('.a').slideDown(100);
  } else {
   article.removeClass('show').addClass('hide');
   article.children('.a').slideUp(100);
  }
 });
});
//]]>

//주유상식
//<![CDATA[
$(function(){
 var article = $('.refuel_common .article');
   article.addClass('hide');
   article.children('.a').slideUp(100);
 $('.refuel_common .article .trigger').click(function(){
  var myArticle = $(this).parents('.article:first');
  if(myArticle.hasClass('hide')){
   article.addClass('hide').removeClass('show'); // 아코디언 효과를 원치 않으면 이 라인을 지우세요
   article.children('.a').slideUp(100); // 아코디언 효과를 원치 않으면 이 라인을 지우세요
   myArticle.children('.q').children('a').children('div.q-btn').html("<img src=\"/images/btn/ic_up.gif\" alt=\"up\" />");
   myArticle.removeClass('hide').addClass('show');
   myArticle.children('.a').slideDown(100);
  } else {
   myArticle.removeClass('show').addClass('hide');
   myArticle.children('.a').slideUp(100);
   myArticle.children('.q').children('a').children('div.q-btn').html("<img src=\"/images/btn/ic_down.gif\" alt=\"down\" />");
  }
 });
 $('.refuel_common .hgroup .trigger').click(function(){
  var hidden = $('.refuel_common .article.hide').length;
  if(hidden > 0){
   article.removeClass('hide').addClass('show');
   article.children('.a').slideDown(100);
  } else {
   article.removeClass('show').addClass('hide');
   article.children('.a').slideUp(100);
  }
 });
});
//]]>


//추천정비매장
//<![CDATA[
$(function(){
 var article = $('.recommend_list .article');
   article.addClass('hide');
   article.children('.a').slideUp(100);
 $('.recommend_list .article .trigger').click(function(){
  var myArticle = $(this).parents('.article:first');
  if(myArticle.hasClass('hide')){
   article.addClass('hide').removeClass('show'); // 아코디언 효과를 원치 않으면 이 라인을 지우세요
   article.children('.a').slideUp(100); // 아코디언 효과를 원치 않으면 이 라인을 지우세요
   myArticle.removeClass('hide').addClass('show');
   myArticle.children('.a').slideDown(100);
  } else {
   myArticle.removeClass('show').addClass('hide');
   myArticle.children('.a').slideUp(100);
  }
 });
 $('.recommend_list .hgroup .trigger').click(function(){
  var hidden = $('.recommend_list .article.hide').length;
  if(hidden > 0){
   article.removeClass('hide').addClass('show');
   article.children('.a').slideDown(100);
  } else {
   article.removeClass('show').addClass('hide');
   article.children('.a').slideUp(100);
  }
 });
});
//]]>


//오픈 레이어
$().ready( function() {
	$("#btn").toggle(
		function() { $("#myLayer").addClass("hidden"); },
		function() { $("#myLayer").removeClass("hidden"); }
	);
});


//메인 탭

function init_tabs() {
	$(".tab_content").css("display","none");
		if (!$('ul.tabs').length) { return; }
			$('div.tab_content_wrap').each(function() {
			$(this).find('div.tab_content:first').show();
		});
	$('ul.tabs a').click(function() {
		if (!$(this).hasClass('current1')) {
			$(this).addClass('current1').parent('li').siblings('li').find('a.current1').removeClass('current1');
			$($(this).attr('href')).show().siblings('div.tab_content').hide();
			}
				this.blur();
				return false;
		});

	}
	$(document).ready(function() {
		init_tabs();
});

/**
 * Ajax를 이용한 요청을 수행한다.
 *
 * @url 요청 URL로 상대 경로와 절대 경로가 모두 가능함
 * @params 요청 파라미터
 * @theMode 모드로 호출할 메소드의 이름을 의미함. IAction에 대한 요청인 경우에는 ""를 입력
 * @after 서버에서의 처리가 완료된 후에 호출되는 메소드
 */
function callAjax(url, params, theMode, after, options) {
	
    jprivate_callMethod = after;
    jprivate_mode = theMode;

	jprivate_returnValue = null;
	
    var _async = (options && options["async"] == false)? false : true; // async 여부
    var _method = (options && options["method"] == "POST" )? "POST" : "GET"; // GET or POST
	var _params;
	
	if (_method == "GET"){
		if (params){
			_params = (typeof params == "string")? encodeURI(params) : jprivate_parseParam(params);
		}
		
		
	}else{
		_params = params;
	}
	
	url += "?mode=" + theMode;	
    
    /* 웹 브라우저에 따른 분기 */
    if (window.XMLHttpRequest) {                             /* 모질라 계열 */
    	
        jprivate_request = new XMLHttpRequest();
        jprivate_request.onreadystatechange = jprivate_process;
    
        if (_method == "GET"){
            jprivate_request.open(_method, url + "&" + _params, _async);
            jprivate_request.send(null);
            
        }else{
        	/*
        	 * 기존 소스 
				jprivate_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	            jprivate_request.open(_method, url, _async);
	            jprivate_request.send(_params);
        	 */
        	jprivate_request.open(_method, url, _async);
        	jprivate_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        	//jprivate_request.onreadystatechange = after;
            jprivate_request.send(_params);
        }
        if (_async == false && navigator.userAgent.toLowerCase().indexOf("firefox") > -1){
        	jprivate_process();
        }
      
    } else if (window.ActiveXObject) {                       /* MS IE */
        
        
        try {
            // IE6
            //return new ActiveXObject("Msxml2.XMLHTTP");
            jprivate_request = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                // IE4, IE5
               // return new ActiveXObject("Microsoft.XMLHTTP");
            	jprivate_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e2) {
            	alert(2222);        
            }
        }
        
        
        
        
        jprivate_request.onreadystatechange = jprivate_process;
        
        if (_method == "GET"){
        	
            jprivate_request.open(_method, url + "&" + _params, _async);
            jprivate_request.send();
        }else{
        	/*
            jprivate_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            jprivate_request.open(_method, url, _async);
            jprivate_request.send(_params);
            */
        	
        	jprivate_request.open(_method, url, _async);
        	jprivate_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        	//jprivate_request.onreadystatechange = after;
            jprivate_request.send(_params);
        	
        	
        }
    }
    
    /*
    var style = "font: 12px 굴림, Tahoma, sans-serif;";
    style += "position: absolute; top: 6%; right: 5%;";
    style += "color: #fff; background-color: #008aff;";
    
    jprivate_message = (top) ? top.document.createElement("div") : document.createElement("div");
    jprivate_body = (top) ? top.document.getElementsByTagName("body")[0] : document.getElementsByTagName("body")[0];
    jprivate_message.innerHTML = "<span style=\"" + style + "\">작업중입니다...</span>";
    jprivate_body.appendChild(jprivate_message);
    */
    
    if (_async == false){ // synchronous 방식일 경우 after 함수의 리턴값을 되돌림
    	return jprivate_returnValue;
    }    
}

/**
 * 서버에서 Ajax 요청이 처리가 된 후 호출되는 메소드로 간단한 에러 처리를 한다. 성공적으로 수행된 경우에는
 * 사용자가 지정한 callMethod를 호출한다. 
 */
function jprivate_process() {
    try {
    	if (jprivate_request.readyState == 4) {
            //jprivate_body.removeChild(jprivate_message);
						//alert(jprivate_request.status);
						//alert(jprivate_request.xml);
            if (jprivate_request.status == 200) {
            	jprivate_returnValue = jprivate_callMethod(jprivate_request, jprivate_mode);
            } else {
                alert("1. 예외가 발생하였습니다. (메시지=" + jprivate_request.statusText + ")");
            }
        }
    } catch (e) {
        alert("2. 예외가 발생하였습니다. (메시지=" + e.message + ")");
    }
}

function getParams(select, name) {
    var size = select.options.length;
    var result = "";
    for (var i = 0; i < size; i++) {
        if (select.options[i].selected) {
            result += "&" + name + "=" + select.options[i].value
        }
    }
    return result;
}

/**
 * item 태그의 내용을 나타내는 클래스
 *
 * @param id 아이디
 * @param properties 속성 리스트
 */
function JItem(id, properties) {
    this.id = id;
    this.properties = properties;

    this.getProperty = function(name) {
                           return properties[name]; 
                       };
}

/**
 * id에 해당하는 item 태그의 내용을 JItem 객체로 반환한다.
 *
 * @param element response 태그를 나타내는 DOM 객체
 * @param id 아이디. 아이디가 없는 경우에는 첫번째 item 태그가 반환된다.
 */
function getItem(element, id) {
    var items = element.getElementsByTagName("item");
    for (var i = 0; i < items.length; i++) {
        if (id == null || items[i].getAttribute("id") == id) {
            var properties = items[i].getElementsByTagName("property");
            var args = new Array;
            for (var j = 0; j < properties.length; j++) {
                args[properties[j].getAttribute("name")] = properties[j].getAttribute("value");
            }
            return new JItem(id, args);
        }
    }
    return;
}

/**
 * id에 해당하는 list 태그의 내용을 JItem 객체를 담고 있는 배열로 반환한다.
 *
 * @param element response 태그를 나타내는 DOM 객체
 * @param id 아이디. 아이디가 없는 경우에는 첫번째 list 태그가 반환된다.
 */
function getList(element, id) {
    var lists = element.getElementsByTagName("list");
    for (var i = 0; i < lists.length; i++) {
        if (id == null || lists[i].getAttribute("id") == id) {
            var result = new Array;
            var items = lists[i].getElementsByTagName("item");
            for (var j = 0; j < items.length; j++) {
                var properties = items[j].getElementsByTagName("property");
                var args = new Array;
                for (var k = 0; k < properties.length; k++) {
                    args[properties[k].getAttribute("name")] = properties[k].getAttribute("value");
                }
                result[j] = new JItem(j, args);
            }
            return result;
        }
    }
    return new Array;
}

/**
 * 입력 변수에 3 자리마다 콤마(,)를 붙여 반환한다.
 * @param field 콤마를 붙일 값
 */
function formatCommas(numString) {
    var re = /,|\s+/g;
    numString = numString.replace(re, "");

    re = /(-?\d+)(\d{3})/;
    while (re.test(numString)) {
        numString = numString.replace(re, "$1,$2");
    }
    return numString;
}

function stripCommas(numString) {
    var re = /,/g;
    return numString.replace(re, "");
}

/**
 * 텍스트 필드에 입력한 값에 3자리마다 콤마(,)를 붙인다.
 * 텍스트 필드에 아래를 기입한다. onkeyup="toMoney(this)"
 * @param field 텍스트 필드
 */
function toMoney(field) {
    var value = field.value;
    var indexOfPoint = value.indexOf(".");
    if (indexOfPoint == -1) {
        field.value = formatCommas(value);
    } else {
        field.value = formatCommas(value.substring(0, indexOfPoint)) +
                        value.substring(indexOfPoint, value.length);
    }
}