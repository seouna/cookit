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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${path }/resources/js/member.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="../nav.jsp" />
 <body>
    
    <!--  html 전체 영역을 지정하는 container -->
    <div id="container">
      <!--  login 폼 영역을 : loginBox -->
      <div id="loginBox">
      
        <!-- 로그인 페이지 타이틀 -->
        <div id="loginBoxTitle">C O O K I T<br>LOGIN</div>
        <!-- 아이디, 비번, 버튼 박스 -->
        <form id="loginForm"  action ="loginPro" method="post">
	        <div id="inputBox">
	          <div class="input-form-box"><span>아이디 </span><input type="text" name="member_id" class="form-control" required="required"></div>
	          <div class="input-form-box"><span>비밀번호 </span><input type="password" name="member_pw" class="form-control" required="required"></div>
	          <div class="button-login-box" >
	            <button type="submit" class="btn btn-info btn_login" style="width:100%">로그인</button>
	          </div>
	        </div>
        </form>
        <div class="orther-login">
			<p class="tit"><span><strong>간편로그인</strong></span></p>
			<div class="btns">
				<span onclick="kakaoLogin();">
				<a href="#" class="btn-kakao"><img src="resources/images/ico_kakao.png"></a>
				</span>
				<span>
				<a id="naverIdLogin_loginButton" href="javascript:void(0)" class="btn-naver"><img src="resources/images/ico_naver.png"></a>
				</span>
			</div>
		</div>
      </div>
    </div>
	<jsp:include page="../footer.jsp" />
</body>
</html>