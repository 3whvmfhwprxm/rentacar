<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp"%>

<link href="https://fonts.googleapis.com/css?family=Oleo+Script:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Teko:400,700"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company.css/company_detail.css" />
<script type="text/javascript">
	var btnType = '';
	$(document).ready(
			function() {
				$("#comPwd").focus();

				$("#frmEdit").submit(
						function() {
							if (!$("#comPwd").val()) {
								alert('비밀번호를 입력하세요');
								$("#comPwd").focus();
								return false;
							} else if ($("#comPwd").val() != $("#comPwd1")
									.val()) {
								alert('비밀번호가 일치하지 않습니다');
								$("#comPwd").focus();
								return false;
							} else if (!validate_hp($("#comTel2").val())
									|| !validate_hp($("#comTel3").val())) {
								alert('숫자만 입력하셔야 합니다.');
								$("#comTel2").focus();
								return false;
							}
						});

				$("#comlogo").change(
						function(str) {
							// 확장자 가져오기
							if ($("#comlogo").val() != "") {
								var ext = $('#comlogo').val().split('.').pop()
										.toLowerCase();
								if ($.inArray(ext, [ 'gif', 'png', 'jpg',
										'jpeg' ]) == -1) {
									alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
									$("#comlogo").val("");
									return;
								} else {
									file = $('#comlogo').prop("files")[0];
									blobURL = window.URL.createObjectURL(file);
									$('#image_preview img')
											.attr('src', blobURL);
									$('#image_preview').slideDown(); //업로드한 이미지 미리보기 
								}

							}
							/* if(!/(\.png|\.PNG|\.jpg|\.JPG|\.bmp|\.BMP|\.gif|\.GIF)$/i.test(str)) {
							    alert("jpg, png, bmp, gif 파일만 등록할 수 있습니다.");
							    $("#comLogo").val("");
							    return;
							} */
						});

				$("[id^=btnZipcode]").click(function() {
					btnType = $(this);
					goPopup();
				});
			});

	//휴대폰  정규식
	function validate_hp(hp) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(hp);
		/*  정규식  /^[0-9]*$/g
		0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 
		(^는 시작, $는 끝을 의미)
		닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복  
		return 값이 true면 정규식을 통과 false면 정규식을 통과하지못했음을 의미
		 */
	}

	//주소  불러오기
	function goPopup() {
		window.open("../userzipcode/jusoPopup.do", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(addrDetail) {
		if (btnType.attr('id') != 'btnZipcode1') {
			$('#comReturnPlace').val(addrDetail);
		} else {
			$('#comAddress').val(addrDetail);
		}
	}
</script>

<section id="contact">
	<br>
	<div class="container">
		<legend>내 업체 정보</legend>
		<pre>
		<code>
		업체의 현재 등록된 세부정보를 보여주며, 아이디,사업자 번호,대표자 를 제외한 나머지 부분들은 수정이 가능합니다
		
		**<strong>DB(데이터베이스)</strong> 관리는 관리자에게만 주어지는 기능이나 임의 삭제는 불가하며, 요청시 사 내 규정에 따라 처리됩니다.
    	</code>
		</pre>

		<form name="frmEdit" id="frmEdit" method="post"
			enctype="multipart/form-data"
			action="<c:url value='/com_manage/company_detail.do' />">
			<input type="hidden" name="comId" value="${companyVo.comId}">
			<input type="hidden" name="comName" value="${companyVo.comName}">
			<input type="hidden" name="comNum" value="${companyVo.comNum}">
			<input type="hidden" name="comAccNum" value="${companyVo.comAccNum}">
			<input type="hidden" name="comCeo" value="${companyVo.comCeo}">
			<div
				class="col-lg-8 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">${companyVo.comName}</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12 ">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td>아이디</td>
											<td>${companyVo.comId}</td>
										</tr>
										<tr>
											<td>사업자 번호</td>
											<td>${companyVo.comNum}</td>
										</tr>
										<tr>
											<td>대표자</td>
											<td>${companyVo.comCeo}</td>
										</tr>
										<tr>
											<td>비밀번호</td>
											<td><input type="password" name="comPwd" id="comPwd"></td>
										</tr>
										<tr>
											<td>비밀번호 확인</td>
											<td><input type="password" name="comPwd1" id="comPwd1"></td>
										</tr>
										<tr>
											<td>대표번호</td>
											<td><input type="text" name="comTel1" id="comTel1"
												value="${companyVo.comTel1}"> <input type="text"
												name="comTel2" id="comTel2" value="${companyVo.comTel2}">
												<input type="text" name="comTel3" id="comTel3"
												value="${companyVo.comTel3}"></td>
										</tr>
										<tr>
											<td>휴대폰</td>
											<td><select class="col-lg-4" name="comMobile1"
												id="comMobile1">
													<option value="010"
														<c:if test="${companyVo.comMobile1==010}"> selected </c:if>>010</option>
													<option value="011"
														<c:if test="${companyVo.comMobile1==011}"> selected </c:if>>011</option>
													<option value="016"
														<c:if test="${companyVo.comMobile1==016}"> selected </c:if>>016</option>
													<option value="017"
														<c:if test="${companyVo.comMobile1==017}"> selected </c:if>>017</option>
													<option value="019"
														<c:if test="${companyVo.comMobile1==019}"> selected </c:if>>019</option>
											</select> <input type="text" name="comMobile2" id="comMobile2"
												value="${companyVo.comMobile2}"> <input type="text"
												name="comMobile3" id="comMobile3"
												value="${companyVo.comMobile3}"></td>
										</tr>
										<tr>
											<td>팩스번호</td>
											<td><input type="text" name="comFax1" id="comFax1"
												value="${companyVo.comFax1}"> <input type="text"
												name="comFax2" id="comFax2" value="${companyVo.comFax2}">
												<input type="text" name="comFax3" id="comFax3"
												value="${companyVo.comFax3}"></td>
										</tr>
										<tr>
											<td>주소</td>
											<td><input type="text" name="comAddress" id="comAddress"
												readonly="readonly" value="${companyVo.comAddress}">
												<input type="Button" value="업체주소찾기" id="btnZipcode1"
												title="새창열림"></td>
										</tr>
										<tr>
											<td>인수/반납</td>
											<td><input type="text" name="comReturnPlace"
												id="comReturnPlace" readonly="readonly"
												value="${companyVo.comReturnPlace}"> <input
												type="Button" value="인수/반납장소" id="btnZipcode2" title="새창열림"></td>
										</tr>
										<tr>
											<td>이메일</td>
											<td><input type="text" name="comEmail" id="comEmail"
												value="${companyVo.comEmail}"></td>
										</tr>
										<tr>
											<td>업체 로고</td>
											<td><c:if test="${!empty companyVo.comLogo}">
													<div id="image_preview">
														<img
															src="<c:url value='/companyLogo/${companyVo.comLogo}'/>" />
													</div>
												</c:if> <input type="file" name=comlogo id="comlogo"
												value="${companyVo.comLogo}"> <c:if
													test="${!empty companyVo.comLogo}">
													<span class="sp1"></span>
													<span style="color: darkgreen; font-weight: bold"> ※
														첨부 파일을 새로 지정할 경우 기존파일 <img
														src="<c:url value='/images/file.gif'/>" alt="파일 이미지">
														${companyVo.comLogo } 은 삭제됩니다.
													</span>
												</c:if></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div id="submitdiv">
							<input class="btn btn-default submit" type="submit"
								id="detailSubmit" value="수정">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</section>


<%@ include file="../inc_company/company_bottom.jsp"%>