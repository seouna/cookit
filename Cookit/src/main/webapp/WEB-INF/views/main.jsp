<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>쿠킷</title>
<link href="${path }/resources/css/common.css" rel="stylesheet">
<link href="${path }/resources/css/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body id="top">
	
<jsp:include page="nav.jsp" />
<div class="home__bg_content"></div>
<div class="container">
	<div class="main-content">
		<section class="home__content_header">
			<div class="home__content_header__title">
				<p>요리를 즐겁게 <br> <strong>C O O K I T ~</strong></p>
			</div>
			<div class="search__form_box__2">
				<span id="mainSearchIcon" onclick="mainSearchBtn()" class="search__icon__2"><img alt="" src="${path }/resources/images/014-search.png"> </span>
				<input type="text" id="searchText" placeholder="레시피, 재료, 아티스트, 태그 검색" autocomplete="off">
			</div>
			<ul id="recentSearchBox" class="recent_box" style="display: none; left: 579.6px;">
			    <li name="searchFirst" class="recent_first_item">최근 검색어</li>
				<li name="searchLast">최근검색어 5개까지</li>
			</ul>
		</section>
	
		<div class="recipe-container">
			<div class="recipeTit"><h1>OUR RECIPES</h1><h2>COOKIT과 맛있는 음식을 만들어 보세요.</h2></div>
			<ul class="recipeCategory">
				<li class="selOff">모두보기</li>
				<li class="selOn">메인요리</li>
				<li class="selOff">밑반찬</li>
				<li class="selOff">간식</li>
				<li class="selOff">간단요리</li>
				<li class="selOff">초대요리</li>
				<li class="selOff">채식</li>
				<li class="selOff">한식</li>
				<li class="selOff">양식</li>
				<li class="selOff">일식</li>
				<li class="selOff">중식</li>
				<li class="selOff">퓨전</li>
				<li class="selOff">분식</li>
				<li class="selOff">안주</li>
				<li class="selOff">베이킹</li>
				<li class="selOff">다이어트</li>
				<li class="selOff">도시락</li>
				<li class="selOff">키토</li>
				<li class="selOff">오븐 요리</li>
			</ul>
			
			<div class="row row-cols-1 row-cols-md-4 g-4">
			<!--  반복 -->
				<div class="col">
					<div class="card">
						<img src="${path }/resources/images/food1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
								This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.
							</p>
						</div>
					</div>
				</div>
			<!--  반복 -->
				<div class="col">
					<div class="card">
						<img src="${path }/resources/images/food1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
	
							<p class="card-text">
								This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.
							</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img src="${path }/resources/images/food1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
								This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.
							</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img src="${path }/resources/images/food1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
								This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.
							</p>
						</div>
					</div>
				</div>
				
				<div class="col">
					<div class="card">
						<img src="${path }/resources/images/food1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">
								This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.
							</p>
						</div>
					</div>
				</div>
				
				
			</div>		
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>