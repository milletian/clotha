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

.pdDetail{
	border: 1px solid;
    width: 300px;
    float: left;
    clear: both;
}

</style>
</head>
<body>
<form name="frmPdEdit" method="post" action="<c:url value='/admin/products/productsEdit.do'/>" enctype="multipart/form-data" >
<div id="pdImage">
	<img alt="${vo.pdName}" src="<c:url value='/pd_images/${vo.pdImage}'/>" id="pdImage">
	<input type="file" name="changeFile" >
</div>
<div id="pdDetail">
	<input type="hidden" name="pdCode" value="${param.pdCode}">
	<input type="hidden" name="oldFileName" value="${vo.pdImage}">
	<label>상품코드</label>
	<span>${param.pdCode}</span>
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
	<span><input type="text" name="pdSellPrice" value="${vo.pdSellPrice}"></span>
	<br>
	
	<label>사용여부</label>
	<select name="pdDel">
		<option value="Y">사용</option>
		<option value="N">미사용</option>
	</select>
	<br>
</div>
<div id="pdDetail2">
	<label>상품주의 사항</label>
	<textarea name="pdWarning">${vo.pdWarning}</textarea>
</div>
<div id="pdDetail3">
	<label>상품설명</label>
	<textarea name="pdExplanation">${vo.pdExplanation}</textarea>
</div>
	<input type="submit" value="수정완료">
</form>

</body>
</html>