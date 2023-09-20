<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%-- <link href="${path }/resources/css/main.css" rel="stylesheet"> --%>
<link href="${path }/resources/css/market.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%-- <script src="${path }/resources/js/market.js"></script> --%>
</head>
<jsp:include page="../nav.jsp" />
<body>

<div id="container">
	<div class="main-content">
		<!-- 상품등록 페이지 타이틀 -->
        <form action="marketRegisterPro" method="post" name="product" id="marketRegisterForm" enctype="multipart/form-data">
        	<h2>상품등록</h2>
        	<table>
        		<tr>
        			<th class="td_left">재료명</th>
        			<td class="td_right">
        				<input type="text" name="product_name" id="product_name" required="required">
        			</td>
        		</tr>
        		<tr>
        			<th class="td_left">카테고리</th>
        			<td class="td_right">
        				<select id="product_category" name="product_category">
        					<option value="">카테고리를 선택해주세요.</option>
        					<option value="과일">과일</option>
        					<option value="채소">채소</option>
        					<option value="쌀/잡곡/견과">쌀/잡곡/견과</option>
        					<option value="정육/계란류">정육/계란류</option>
        					<option value="수산물/건해산">수산물/건해산</option>
        					<option value="우유/유제품">우유/유제품</option>
        					<option value="양념/오일">양념/오일</option>
        				</select>
        			</td>
        		</tr>
        		<tr>
        			<th class="td_left">재료사진</th>
        			<td class="td_right">
						<input type="file" name="file" class="fileUpload" accept="image/*" required multiple style="display: none;">
						<div class="uploadArea">이미지를 등록해주세요.</div>
						<ul class="imagePreview" style="display: none;"></ul>
        			</td>
        		</tr>
        		<tr>
        			<th class="td_left">가격</th>
        			<td class="td_right">
        				<input type="text" name="product_price" id="product_price" required="required"> 원
        			</td>
        		</tr>
        		<tr>
					<td colspan="2" id="btnArea">
						<button type="submit" class="btn btn-info btn-join">등록하기</button>
						<button type="button" class="btn btn-secondary btn-back">취소</button>
					</td>
				</tr>
        	</table>
        </form>
	</div>
</div>	
<script>
	const fileUpload = document.querySelector('.fileUpload');
	const upload = document.querySelector('.uploadArea');
	// 이미지 업로드 미리보기
    function getImageFiles(e) {
    	const uploadFiles = [];
		const files = e.currentTarget.files;
        console.log(typeof files, files);
    	const imagePreview = document.querySelector('.imagePreview');
    	const docFrag = new DocumentFragment();
    	
    	[...files].forEach(file => {
    	uploadFiles.push(file);
        const reader = new FileReader();
        reader.onload = (e) => {
          const preview = createElement(e, file);
          imagePreview.appendChild(preview);
        };
        reader.readAsDataURL(file);
    	});
    	
//     	upload.style.display = 'none';
    	imagePreview.style.display = 'flex';
	}

    function createElement(e, file) {
        const li = document.createElement('li');
        const img = document.createElement('img');
        img.setAttribute('src', e.target.result);
        img.setAttribute('data-file', file.name);
        li.appendChild(img);
        return li;
	}
    
 	// input태그 숨기고 대신 클릭할 부분
    upload.addEventListener('click', () => fileUpload.click());
 	// 이미지 업로드 시 미리보기 이벤트 실행
    fileUpload.addEventListener('change', getImageFiles);
    
</script>
</body>
<jsp:include page="../footer.jsp" />
</html>