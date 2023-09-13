<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<%-- 전달받은 메세지(msg 속성) 출력 후 지정된 페이지(target)로 이동 - 자바스크립트 --%>
<c:choose>
	<c:when test="${isClose eq true }">
		<script>
			alert("${msg}");
			
			// 부모창의 페이지를 지정한 페이지로 이동,자식창 닫기
			window.opener.location.href="${target}";
			window.close();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("${msg}");
			location.href="${target}"
		</script>
	</c:otherwise>
</c:choose>
<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("blgJUSFIodH1QSzRZ4cw", "http://localhost:8080/cookit/callback");
	// 접근 토큰 값 출력
	alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
	  alert(naver_id_login.getProfileData('name'));
	  alert(naver_id_login.getProfileData('birthday'));
	  alert(naver_id_login.getProfileData('birthyear'));
	  alert(naver_id_login.getProfileData('mobile'));
	  alert(naver_id_login.getProfileData('email'));
	}
</script>
