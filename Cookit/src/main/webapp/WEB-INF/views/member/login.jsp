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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
//카카오 로그인
Kakao.init('f373b556906a6599b1025ca0712b4051'); 
Kakao.isInitialized(); 
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
		       	console.log(response)
		       	var accessToken = Kakao.Auth.getAccessToken();
		       	Kakao.Auth.setAccessToken(accessToken);
		       	var account = response.kakao_account;
					
				$('#form-kakao-login input[name=email]').val(account.email);
				$('#form-kakao-login input[name=name]').val(account.profile.nickname);
				$('#form-kakao-login input[name=gender]').val(account.gender);
				$('#form-kakao-login input[name=accessToken]').val(accessToken);
				// 사용자 정보가 포함된 폼을 서버로 제출.
				document.querySelector('#form-kakao-login').submit();
        	  
        	  
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }

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
    <form id="form-kakao-login" method="post" action="kakaoLogin">
		<input type="hidden" name="email"/>
		<input type="hidden" name="name"/>
		<input type="hidden" name="gender"/>
		<input type="hidden" name="accessToken"/>
	</form>	
	<jsp:include page="../footer.jsp" />
</body>
</html>