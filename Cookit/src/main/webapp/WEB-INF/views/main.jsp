<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>쿠킷</title>
<link href="${path }/resources/css/main.css" rel="stylesheet">
<link href="${path }/resources/css/bootstrap.css" rel="stylesheet">
<link href="${path }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="resourrces/js/bootstrap.js"></script>
<script type="text/javascript" src="resourrces/js/bootstrap.min.js"></script>
</head>
<body id="top">
	
	<jsp:include page="nav.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>