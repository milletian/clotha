<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호찾기</title>
</head>
<body>
	<div>
		<form action="<c:url value='/login/forgetPassword.do'/>" method="post" >
			사원코드 : <input type="text" name="empNo" ><br>
			email : <input type="text" name="empEmail" ><br>
			<input type="submit" value="확인">
		</form>
	</div>
</body>
</html>