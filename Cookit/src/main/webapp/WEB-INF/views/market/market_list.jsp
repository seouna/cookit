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
	
<jsp:include page="../nav.jsp" />
<div class="home__bg_content"></div>
<div class="container">
	<div class="main-content">
		<section class="home__content_header">
			<div class="home__content_header__title">
				<p>쿠킷 마켓 <br> <strong>C O O K I T ~</strong></p>
			</div>
			<div class="search__form_box__2">
				<span id="mainSearchIcon" onclick="mainSearchBtn()" class="search__icon__2"><img alt="" src="${path }/resources/images/014-search.png"> </span>
				<input type="text" id="searchText" placeholder="재료 검색" autocomplete="off">
			</div>
			<ul id="recentSearchBox" class="recent_box" style="display: none; left: 579.6px;">
			    <li name="searchFirst" class="recent_first_item">최근 검색어</li>
				<li name="searchLast">최근검색어 5개까지</li>
			</ul>
		</section>
	
		<div class="recipe-container">
			<div class="recipeTit"><h1>OUR MARKET</h1><h2>COOKIT에서 재료를 구매해 보세요.</h2></div>
			<ul id="recipeCategory" class="recipeCategory">
				<li class="selOff" id="all">모두보기</li>
				<li class="selOff" id="fruit">과일</li>
				<li class="selOff" id="vegetable">채소</li>
				<li class="selOff" id="rice">쌀/잡곡/견과</li>
				<li class="selOff" id="meat">정육/계란류</li>
				<li class="selOff" id="seafood">수산물/건해산</li>
				<li class="selOff" id="milk">우유/유제품</li>
				<li class="selOff" id="seasoning">양념/오일</li>
			</ul>
			
			<div class="row row-cols-1 row-cols-md-4 g-4">
				<!--  반복 -->
				<c:forEach items="${productList }" var="productList">
					<div class="col">
						<div class="card">
							<img src="${path }/resources/images/food1.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">${productList.product_name }</h5>
								<p class="card-text">${productList.product_price }</p>
								<button type="button" class="btn btn-info btn-join">구매하기</button>
							</div>
						</div>
					</div>
				</c:forEach>
				<!--  -->
			</div>		
		</div>
	</div>
</div>

<jsp:include page="../footer.jsp" />
<script type="text/javascript">
	var categoryItems = document.querySelectorAll("#recipeCategory li");
	
	categoryItems.forEach(function(item) {
	    item.addEventListener("click", function() {
	    	// 카테고리 css변경(class변경)
	        categoryItems.forEach(function(otherItem) {
	            otherItem.classList.remove("selOn");
	            otherItem.classList.add("selOff");
	        });
	        this.classList.remove("selOff");
	        this.classList.add("selOn");
	        
	    });
	});

</script>
</body>
</html>