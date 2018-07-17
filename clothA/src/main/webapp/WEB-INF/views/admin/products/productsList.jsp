<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<!-- 상품 검색조건 설정 -->
	</div>

	<table>
		<thead>
			<tr>
				<th>거래처</th>
				<th>상품코드</th>
				<th>상품이름</th>
				<th>원가</th>
				<th>판매가격</th>
				<th>상품 등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="">
				<tr>
					<td colspan="6">상품이 없습니다.</td>
				</tr>
			</c:if>
			<!-- 반복 시작 -->
			<!-- 반복 끝 -->
		</tbody>
	</table>
</body>
</html>