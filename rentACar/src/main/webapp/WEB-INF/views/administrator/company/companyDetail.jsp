<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var nsc = "my.info"+ "";
var ccsrv = "cc.naver.com";
 
function toggle(obj){
	if(document.getElementById("p_" + obj).style.display == "block"){
		document.getElementById("p_" + obj).style.display="none";
		document.getElementById("i_" + obj).className="spico ico_arr3_dn";
	}else{
		document.getElementById("p_" + obj).style.display="block";
		document.getElementById("i_" + obj).className="spico ico_arr3_up";
	}
	
	setContainerHeight(document.getElementById('content').clientHeight);
}

function changeImage() {
	var goUrl = "/user2/help/naverProfile.nhn?lang=ko_KR";
	document.location.href = goUrl;
}
</script>
</head>
<body>
	<div id="content" class="section_home">
		<div class="column">
			<div class="sh_group">
				<div class="sh_header">
					<h2>업체정보</h2>
				</div>
				<div class="sh_content">
					<dl class="sh_lst">
						<dt class="blind">업체로고</dt>
						<dd class="pic_desc">
							<a href="#"
								onclick="changeImage();clickcr(this,'imn.prfmodify','','',event);">
								<img
								src="https://static.nid.naver.com/images/web/user/default.png"
								width="80" height="80" alt=""> <span
								class="spimg img_frame"></span>
							</a>
						</dd>
						<dt class="blind">&nbsp;</dt>
						<dd class="intro_desc">&nbsp;</dd>
						<dt class="nic_tit">별명</dt>
						<dd class="nic_desc">퐁퐁퐁</dd>
					</dl>
				</div>
				<p class="btn_area_btm">
					<a href="#"
						onclick="changeImage();clickcr(this,'imn.prfmodify','','',event);"
						class="btn_model"><b class="btn2">수정</b></a>
				</p>
			</div>

			<!-- 지역 설정 -->
			<div class="sh_group">
				<div class="sh_header">
					<h2>지역 설정</h2>
					<a href="javascript:toggle('region');"
						onclick="clickcr(this,'imn.reghelp','','',event);"
						class="link_help"><i id="i_region" class="spico ico_arr3_dn">도움말</i></a>
					<p id="p_region" class="contxt" style="display: none">
						네이버 서비스에서 <em>공통으로 사용되는 지역 정보</em>입니다. <br> 설정되어 있는 모든 지역을
						보거나 수정하시려면 설정하기를 클릭하세요.
					</p>
				</div>
				<div class="sh_content">
					<p class="contxt">
						설정된 지역이 없습니다.<br>지금 내 주변의 관심지역을 설정하세요!
					</p>
				</div>
				<p class="btn_area_btm">
					<a href="/user2/help/region.nhn?menu=nid&lang=ko_KR"
						onclick="clickcr(this,'imn.regmodify','','',event);"
						class="btn_model"><b class="btn2">설정하기</b></a>
				</p>
			</div>
		</div>
		<div class="column">
			<!-- 일반아이디 연락처 -->
			<div class="sh_group">
				<div class="sh_header">
					<h2>연락처</h2>
					<a href="javascript:toggle('userInfo');"
						onclick="clickcr(this,'imn.cnthelp','','',event);"
						class="link_help"><i id="i_userInfo" class="spico ico_arr3_dn">도움말</i></a>
					<p id="p_userInfo" class="contxt" style="display: none">
						네이버에서 <em>중요 내용을 알려드릴 때 사용</em>하는 연락처 정보입니다. 보다 안전한 정보 보호를 위해 등록된
						연락처의 일부만 보여드립니다. 이름 및 정확한 연락처 정보는 수정 화면에서 확인 가능합니다.
					</p>
				</div>
				<div class="sh_content">
					<dl class="sh_lst2">
						<dt>기본 이메일</dt>
						<dd>ma******@n*******.com</dd>
						<dt>본인확인 이메일</dt>
						<dd>ma******@h*******.net</dd>
						<dt>휴대전화</dt>
						<dd>+82 10-2***-***3</dd>
					</dl>
				</div>
				<p class="btn_area_btm">
					<a href="/user2/help/changeUserInfo.nhn?menu=nid&lang=ko_KR"
						onclick="clickcr(this,'imn.cntmodify','','',event);"
						class="btn_model"><b class="btn2">수정</b></a>
				</p>
			</div>

			<!-- 가입된 단체아이디 -->
		</div>
	</div>
</body>
</html>