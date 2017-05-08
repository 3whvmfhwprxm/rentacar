<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	footer {
	    margin-top: 100px;
	}
	#carousel-example-generic {
		margin-bottom: -100px;
	}
</style>
	<!-- footer -->
	<footer>
        <div class="container"  id="#footer">
            <div class="row">
                <div class="col-md-9" style="">
                	<style>
                	.bottom-info {
                		margin: 0;
                		padding: 0;
                		overflow: hidden;
                	}
                	.bottom-info > li {
                		float: left;
                	}
                	
                	.bottom-info > li:not(:last-child):after {
                		content: "";
                		padding: 0.5em;
                	}
                	ul{
                		list-style: none;
                	}
                	
                	</style>
                	<ul class="bottom-info">
			            <li><strong>뉴프랜 - 3조렌터카</strong></li>
			            <li><strong>사업자등록번호</strong> 105-87-76000</li>
			            <li><strong>통신판매신고</strong> 제2015-제주연동-43호</li>
			        </ul>
                	<ul class="bottom-info">
			            <li><strong>주소 - 서울특별시 영등포구 당산동 287-14</strong></li>
			            <li><strong>이메일 : </strong>3teamRentCar@naver.com</li>
			            <li><strong>전국대표번호 : </strong>1544-0445 (HP.010-7844-0114) 팩스번호 : 0505-554-7000</li>
			            <li><strong>대표이사</strong> 홍길동</li>
			            <li>Copyright ⓒ 3조렌터카. All Rights Reserved</li>
			        </ul>
					
                </div>
                <div class="col-md-3" style="">
                	<ul class="bottom-info">
			            <li><strong>고객센터</strong></li>
			            <li><strong>월 - 토요일</strong></li>
			            <li>09:00 - 18:00</li>
			        </ul>
			        <ul class="bottom-info">
			            <li>1544-0445</li>
			            <li><strong>점심시간</strong></li>
			            <li>12:00 - 13:00</li>
			        </ul>
			        
                
                </div>
            </div>
        </div>
    </footer>
<div class="quickmenu" style="padding: 10;">
	<span class="line">&nbsp;</span>
	<ul>
		<li><a href="<c:url value="/user/realTime.do"/>"><img src="<c:url value="/user_img/quickmenu1.jpg"/>" alt="실시간예약" title="실시간예약" /></a></li>
		<li><a href="<c:url value="/user/confirm.do"/>"><img src="<c:url value="/user_img/quickmenu2.jpg"/>" alt="회원예약확인" title="회원예약확인" /></a></li>
		<li><a href="<c:url value="/user/serviceCenter.do"/>" onclick="popup('/rent/rentcar/popup_nonmember_login.do','popup',650,420, 'center', 'scroll'); return false;"><img src="<c:url value="/user_img/quickmenu7.jpg"/>" alt="비회원예약확인" title="비회원예약확인" /></a></li>
		<li><a href="<c:url value="/user/review.do"/>"><img src="<c:url value="/user_img/quickmenu6.jpg"/>" alt="상담신청" title="상담신청" /></a></li>
	</ul>
	
	<a href="#" class="btntop"><img src="<c:url value="/user_img/top.jpg"/>" alt="TOP" /></a>
</div>
</body>
</html>