<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠킷</title>
<link href="${path }/resources/css/common.css" rel="stylesheet">
<link href="${path }/resources/css/member.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${path }/resources/js/member.js"></script>
<script>
// 도메인 셀렉트박스 처리
function selectDomain(domain) {
	alert(domain);
//	document.joinForm.email2.value = domain;
// 	let domain = $("#emailDomain").val();
	// 만약, 직접입력 항목 선택 시("" 입력 시) 입력 항목 포커스 요청 및 읽기 전용 해제
	// 아니면, 입력 항목 읽기 전용 설정
	if(domain == "") {
		$(".email2").val("");
		$(".email2").attr("readOnly",false);
		$(".email2").css("backgroundColor","white");
		$(".email2").focus();
	} else {
		$(".email2").attr("readOnly",true);
		$(".email2").css("backgroundColor","lightgray");
		$(".email2").val(domain);
	}
}


</script>


</head>
<body>
<jsp:include page="../nav.jsp" />
<article id="joinForm">
		<h2>회원 가입</h2>
		<form action="joinPro" method="post" class="joinForm">
			<table>
				<tr>
					<th class="td_left">ID</th>
					<td class="td_right">
						<input type="text" name="member_id" id="id" placeholder="4 ~ 12글자 사이 입력" required="required">
<!-- 						<input type="button" value="중복확인" id="btnCheckId"> -->
						<button type="button" class="btn btn-info btnDup">중복확인</button>
						<br><span id="checkIdResult"></span>
					</td>
				</tr>
				<tr>
					<th class="td_left">이름</th>
					<td class="td_right">
						<input type="text" name="member_name" id="name" required="required">
						<br><span id="checkNameResult"></span>
					</td>
				</tr>
				<tr>
					<th class="td_left">비밀번호</th>
					<td class="td_right">
						<input type="password" name="member_passwd" id="passwd" placeholder="8 ~ 16글자 사이 입력" required="required">
						<br><span id="checkPasswdResult"></span>
					</td>
				</tr>
				<tr>
					<th class="td_left">비밀번호확인</th>
					<td class="td_right">
						<input type="password" name="passwd2" id="passwd2" onchange="checkConfirmPasswd(this.value)" required="required">
						<br><span id="checkPasswd2Result"></span>
					</td>
				</tr>
				<tr class="address">
					<th class="td_left">주소</th>
					<td class="td_right">
						<input type="text" id="member_address" name="member_address" class="input" placeholder="주소입력" readonly="readonly">
                        <button type="button" class="btn btn-info btnAddress">주소검색</button>
                        <br><span class="joinCheck"></span>
					</td>
				</tr>
				<tr class="address-detail">
					<th class="td_left">상세주소</th>
					<td class="td_right">
						<input type="text" id="member_address_detail" name="member_address_detail" class="input" value="" placeholder="상세주소입력">
						<br><span class="joinCheck"></span>
					</td>
				</tr>
				<tr>
					<th class="td_left">전화번호</th>
					<td class="td_right">
						<input type="text" name="member_tel" class="member_tel" maxlength="11" equired="required" placeholder="ex) 01012343552">
						<button type="button" class="btn btn-info btnSend">본인인증</button>
						<br><span id="phoneCheck"></span>
					</td>
				</tr>
				<tr id="auth-cont">
					<th class="td_left">인증번호</th>
					<td class="td_right">
						<input type="text" name="member_tel2" class="member_tel2" maxlength="4" equired="required" placeholder="인증번호를 입력해주세요.">
						<button type="button" class="btn btn-info btnAuth">인증완료</button>
						<br><span id="phoneCheck2"></span>
						<input type="hidden" id="phoneDoubleChk"/>
					</td>
				</tr>
				
			
				<tr class="email">
					<th class="td_left">E-Mail</th>
					<td class="td_right">
						<c:if test="${empty param.email}">
							<input type="text" name="member_email1" class="email" required="required" >@<input type="text" name="email2" class="email2" required="required">
						</c:if>
						<c:if test="${not empty param.email}">
							<input type="text" name="member_email1" class="email" readonly="readonly" value=${param.email.split('@')[0] }>@
							<input type="text" name="member_email2" class="email2" readonly="readonly" value=${param.email.split('@')[1] }>
						</c:if>
						<select id="emailDomain" onchange="selectDomain(this.value)">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr class="bday">
					<th class="td_left">생년월일</th>
					<td class="td_right">
						<select class="box" id="birth-year" name="member_birth_year">
					  	</select>
						<select class="box" id="birth-month" name="member_birth_month">
						</select>
						<select class="box" id="birth-day" name="member_birth_day">
						</select>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" id="btnArea">
						<button type="submit" class="btn btn-info btn-join">가입하기</button>
						<button type="button" class="btn btn-secondary btn-back">가입취소</button>
					</td>
				</tr>
			</table>
		</form>
	</article>


<jsp:include page="../footer.jsp" />
</body>
</html>