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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="${path }/resources/css/common.css" rel="stylesheet">
<link href="${path }/resources/css/sub.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="${path }/resources/js/member.js"></script>
<script>


</script>


</head>
<body>
<jsp:include page="../nav.jsp" />
<article id="joinForm">
		<h2>회원 가입</h2>
		<form action="MemberJoinPro.me" method="post" class="joinForm">
			<table>
				<tr>
					<th class="td_left">ID</th>
					<td class="td_right">
						<input type="text" name="id" id="id" placeholder="4 ~ 12글자 사이 입력" required="required">
<!-- 						<input type="button" value="중복확인" id="btnCheckId"> -->
						<button type="button" class="btn btn-info btnDup">중복확인</button>
						<br><span id="checkIdResult"></span>
					</td>
				</tr>
				<tr>
					<th class="td_left">이름</th>
					<td class="td_right">
						<input type="text" name="name" id="name" required="required">
						<span id="checkNameResult"></span>
					</td>
				</tr>
				<tr>
					<th class="td_left">비밀번호</th>
					<td class="td_right">
						<input type="text" name="passwd" id="passwd" placeholder="8 ~ 16글자 사이 입력" required="required">
						<span id="checkPasswdResult"></span>
					</td>
				</tr>
				<tr>
					<th class="td_left">비밀번호확인</th>
					<td class="td_right">
						<input type="password" name="passwd2" id="passwd2" onchange="checkConfirmPasswd(this.value)" required="required">
						<span id="checkPasswd2Result"></span>
					</td>
				</tr>
				<tr>
					<th class="td_left">전화번호</th>
					<td class="td_right">
						<input type="text" name="phoneNum" class="phoneNum" required="required" placeholder="ex) 010-1234-3552">
					</td>
				</tr>
				<tr class="email">
					<th class="td_left">E-Mail</th>
					<td class="td_right">
						<input type="text" name="email1" class="email" required="required">@<input type="text" name="email2" class="email" required="required">
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
						<select class="box" id="birth-year">
					  	</select>
						<select class="box" id="birth-month">
						</select>
						<select class="box" id="birth-day">
						</select>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" id="btnArea">
						<button type="button" class="btn btn-info">가입하기</button>
						<button type="button" class="btn btn-secondary">가입취소</button>
					</td>
				</tr>
			</table>
		</form>
	</article>


<jsp:include page="../footer.jsp" />
</body>
</html>