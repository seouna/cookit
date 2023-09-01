<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/member.css" rel="stylesheet">
<link href="${path }/resources/css/common.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function NotReload(){
    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
        event.keyCode = 0;
        event.cancelBubble = true;
        event.returnValue = false;
       	alet("이미 회원가입이 완료되었습니다.");
    } 
}
document.onkeydown = NotReload;
</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
		<div id="content">
			<div class="section group section-member">
			
				<div class="wrap-member-box wrap-join-box" id="join_confirm_section">
					<h1>가입성공</h1>
					<div class="member join-success">
						<div class="end">
							<div class="t1">
								<strong></strong> ${member.member_name }님<br>회원가입이 완료되었습니다.
							</div>
							<div class="btns">
								<a href="main" class="btn-type-main">메인화면</a>
								<a href="login" class="btn-typep-login">로그인</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		<jsp:include page="../footer.jsp" />
</body>
</html>