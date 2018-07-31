<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/> " ></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("input[name=list]").click(function(){
			location.href="<c:url value='/mail/getMail.do'/>";
		});
		
	});
</script>
<style type="text/css">
	div div{
		width: 100%;
    	height: 290px;
	}
	input[type=button]:first-of-type{
		margin-left: 395px;
	}
</style>
<title>받은쪽지</title>
</head>
<body>
	<div>
		<h3>제목 : ${vo.mailName }</h3>
		<p>보낸이 : ${vo.empName }</p>
		<p>보낸날짜 : <fmt:formatDate value="${vo.mailSdate }" pattern="yyyy-MM-dd hh:mm:ss"/></p>
		<c:if test="${!empty vo.mailFile }">
			<p>첨부파일 : ${vo.mailFile }</p>
		</c:if>
		<hr>
		<div>
			${vo.mailContent }
		</div>
		<hr>
		<input type="button" value="목록" name="list" >
		<input type="button" value="삭제" name="delete" >
	</div>
</body>
</html>