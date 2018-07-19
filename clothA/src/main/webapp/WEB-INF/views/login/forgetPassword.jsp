<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	body{
		background-image: url("<c:url value='/images/logo1.png'/>");
		background-size: 200px;
		background-repeat: no-repeat;
	}
	div{
		margin: 0 auto;
		text-align: center;
		margin-top: 85px;
	}
	span{
		display: inline-block;
		width: 100px;
	}
	input[type=submit]{
		border: none;
		border-radius: 10px;
		background: black;
		color: white;
	}
</style>
<title>비밀번호찾기</title>
</head>
<body>
	<div>
		<form action="<c:url value='/login/forgetPassword.do'/>" method="post" >
			<span>사원코드 : </span><input type="text" name="empNo" ><br>
			<span>email : </span><input type="text" name="empEmail" ><br><br>
			<input type="submit" value="확인">
		</form>
	</div>
</body>
</html>