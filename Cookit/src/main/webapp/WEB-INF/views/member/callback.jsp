<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>

<script type="text/javascript">
  var naver_id_login = new naver_id_login("blgJUSFIodH1QSzRZ4cw", "http://localhost:8080/cookit/callback");
  
  // 접근 토큰 값 출력
//   alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
 
//   alert(naver_id_login.get_naver_userprofile('mobile'));
  
//   var email, username, mobile, birthday,id;
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	  
	var email = naver_id_login.getProfileData('email');
	var username = naver_id_login.getProfileData('name');

	$.ajax({
		  type: "POST", // POST 또는 GET, 서버의 요구에 따라 설정
		  url: "main",
		  data: {
		    email: email,
		    username: username
		  },
		  success: function (response) {
		    // 서버에서 응답을 받았을 때 실행되는 콜백 함수
// 		    console.log("데이터 전송 성공:", response);
		    window.opener.location.href = "main";
		    window.close();
		  },
		  error: function (error) {
		    // 요청이 실패했을 때 실행되는 콜백 함수
// 		    console.error("데이터 전송 실패:", error);
		  },
	});
  }
</script>
</body>
</html>