<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠킷!</title>
<link href="${path }/resources/css/bootstrap.css" rel="stylesheet">
<link href="${path }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/81736b67fc.js" crossorigin="anonymous"></script>
<script type="text/javascript">
function logout() {
	// 카카오 로그인 아닐시 session "token" = true
	let logout = confirm("로그아웃 하시겠습니까?");
	if(logout){
		location.href = "logout";
	}
	
	if(${sessionScope.token != true}){
		location.href="https://kauth.kakao.com/oauth/logout?client_id=1235075891ee575b4fb830f64b9a5bfd&logout_redirect_uri=http://localhost:8080/cookit/logout";
	}
}
</script>
</head>
<body>
<div class="nav-container">
	<div class="container">
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="main">C O O K I T</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="recipe">레시피</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">영상</a>
		        </li>
		         <li class="nav-item">
		          <a class="nav-link" href="market">마켓</a>
		        </li>
		        <c:choose>
		        	<c:when test="${sessionScope.sId eq 'admin' }">
			        	<li class="nav-item">
				          <a class="nav-link" href="marketRegisterForm">마켓 상품등록</a>
				        </li>
		        	</c:when>
		        </c:choose>
		      </ul>
<!-- 		      <form class="d-flex" role="search"> -->
<!-- 		        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"> -->
<!-- 		        <button class="btn btn-outline-success" type="submit">Search</button> -->
<!-- 		      </form> -->
		    </div>
	        <ul class="nav-ico">
<!-- 	        <i class="fa-solid fa-right-to-bracket"></i> -->
<!-- 			<i class="fa-solid fa-user"></i> -->
<!-- 			<i class="fa-solid fa-basket-shopping nav-ico"></i> -->

				<c:choose>
					<c:when test="${empty sessionScope.sId }">
				        <li><a href="joinForm">회원가입</a></li>
				        <li><a href="login">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="myPage">마이페이지</a></li>
						<li><a href="javascript:logout()" data-reload="reload" class="">로그아웃</a></li>
				        <li><a href="basket">장바구니</a></li>
				        <c:if test="${sessionScope.sId eq 'admin' }">
							<li><a href="admin" class="">관리자</a></li>
						</c:if>
					</c:otherwise>
				</c:choose>
	        </ul>
		  </div>
		</nav>		
	</div>
</div>

</body>
</html>