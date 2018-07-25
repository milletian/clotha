<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/css/view.css'/>">
<style type="text/css">
</style>
</head>
<body>
<div class="pdImage">
	<img alt="${vo.pdName}" src="<c:url value='/pd_images/${vo.pdImage}'/>" class="pdImage">
</div>
<div >
	<div class="pdDetail">
		<input type="hidden" value="${param.pdCode}" class="pdDetail">
		<input type="hidden" value="${vo}" class="pdDetail">
		<label>상품코드</label>
		<span>${param.pdCode }</span>
	</div>
	<div class="pdDetail">	
		<label>상품이름</label>
		<span>${vo.pdName}</span>
	</div>
	
	<div class="pdDetail">	
		<label>생산년도</label>
		<span>${pdYear}년도</span>
	</div>
	<div class="pdDetail">
		<label>스타일</label>
		<span>${vo.styleName}</span>
	</div>
	<div class="pdDetail">	
		<label>입고가</label>
		<span>${vo.pdOriginalPrice }</span>
	</div>
	<div class="pdDetail">	
		<label>판매가</label>
		<span>${vo.pdSellPrice}</span>
	</div>
	<div class="pdDetail">	
		<label>사용여부</label>
		<span>${vo.pdDel}</span>
	</div>
</div>
<div class="pdDetail">
	<label>상품주의 사항</label>
	<c:if test="${empty vo.pdWarning}">
	<p>입력사항 없습니다.</p>
	</c:if>
	<c:if test="${!empty vo.pdWarning}">
	<p>${vo.pdWarning}</p>
	</c:if>
</div>
<div class="pdDetail">
	<label>상품설명</label>
	<c:if test="${empty vo.pdExplanation}">
	<p>입력사항 없습니다.</p>
	</c:if>
	<c:if test="${!empty vo.pdExplanation}">
	<p>${vo.pdExplanation}</p>
	</c:if>
</div>
	<br>
	<br>
	<a href="<c:url value='/admin/products/productsEdit.do?pdCode=${param.pdCode}'/>">수정</a> |
	<a href="<c:url value='/admin/products/productsList.do'/>">상품등록 목록</a>
</body>
</html>