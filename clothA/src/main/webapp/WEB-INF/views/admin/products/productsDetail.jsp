<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#pdImage{
    width: 240px;
    height: 220px;
    float: left;
}
 
</style>
</head>
<body>
<div id="pdImage">
	<img alt="${vo.pdName}" src="<c:url value='/pd_images/${vo.pdImage}'/>" id="pdImage">
</div>
<div id="pdDetail">
	<input type="hidden" value="${param.pdCode}">
	<input type="hidden" value="${vo}">
	<label>상품코드</label>
	<span>${param.pdCode }</span>
	<br>
	
	<label>상품이름</label>
	<span>${vo.pdName}</span>
	<br>
	
	<label>생산년도</label>
	<span>${pdYear}년도</span>
	<br>
	
	<label>스타일</label>
	<span>${vo.styleName}</span>
	<br>
	
	<label>입고가</label>
	<span>${vo.pdOriginalPrice }</span>
	<br>
	
	<label>판매가</label>
	<span>${vo.pdSellPrice}</span>
</div>
<div id="pdDetail2">
	<label>상품주의 사항</label>
	<c:if test="${empty vo.pdWarning}">
	<p>입력사항 없습니다.</p>
	</c:if>
	<c:if test="${!empty vo.pdWarning}">
	<p>${vo.pdWarning}</p>
	</c:if>
</div>
<div id="pdDetail3">
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