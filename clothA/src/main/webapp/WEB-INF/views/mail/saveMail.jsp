<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('form[name=chfrm]').submit(function(){
			var count=0;
			$('input[name=chk]').each(function(idx, item){
				if($(this).is(':checked')){
					count++;
				}
			});	
			
			if(count==0){
				alert('삭제할 글을 체크하세요');
				return false;
			}
		});
		
		$('form[name=chfrm1]').submit(function(){
			var count=0;
			$('input[name=chk1]').each(function(idx, item){
				if($(this).is(':checked')){
					count++;
				}
			});	
			
			if(count==0){
				alert('삭제할 글을 체크하세요');
				return false;
			}
		});
		
	});
	
	
	function allChecked(bool){
		$('input[name=chk]').prop('checked', bool);
	}
	
	function allChecked1(bool){
		$('input[name=chk1]').prop('checked', bool);
	}
	
</script>
<style type="text/css">
	table{
		text-align: center;
		font-weight: bold;
	}
	.d2 table tr th:nth-of-type(3){
		width: 290px;
	}
	.d2 table tr th:last-child{
		width: 115px;
	}
	.d1 table tr th:nth-of-type(3){
		width: 215px;
	}
	.d1 table tr th:last-child{
		width: 115px;
	}
	input[name=delete]{
		margin-left: 390px;
    	margin-top: 20px;
	}
	a{
		color: black;
		text-decoration: none;
	}
</style>
<title>보관함</title>
</head>
<body>
	<div>
		<div class="d1">
			<h2>받은쪽지 보관함</h2>
			<form action="<c:url value='/mail/getMulti.do'/> " name="chfrm" method="post" >
				<table>
					<tr>
						<th><input type="checkbox" name="checkAll" onclick="allChecked(this.checked)" ></th>
						<th>번호</th>
						<th>제목</th>
						<th>보낸이</th>
						<th>날짜</th>
					</tr>
					<c:if test="${empty getList }">
						<tr>
							<td colspan="5">받은쪽지 보관함이 비어있습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty getList }">
						<c:forEach items="${getList }" var="gvo" >
							<tr>
								<input type="hidden" value="${gvo.getMailRead }">
								<td><input type="checkbox" name="chk" value="${gvo.mailNo }" ></td>
								<td>${gvo.mailNo }</td>
								<td><a href="<c:url value='/mail/mailDetail.do?mailNo=${gvo.mailNo }'/>" >${gvo.mailName }</a></td>
								<td>${gvo.empName }</td>
								<td><fmt:formatDate value="${gvo.mailSdate }" pattern="yyyy-MM-dd" /> </td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<input type="submit" value="삭제" name="delete">
			</form>
		</div>
		
		<div class="d2">
		<h2>보낸쪽지 보관함</h2>
		<form action="<c:url value='/mail/sendMulti.do'/> " name="chfrm1" method="post" >
			<table>
				<tr>
					<th><input type="checkbox" name="allchk1" onclick="allChecked1(this.checked)" ></th>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
				<c:if test="${empty sendList }">
					<tr>
						<td colspan="4">보낸쪽지 보관함이 비어있습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty sendList }">
					<c:forEach var="svo" items="${sendList }" >
						<tr>
							<td><input type="checkbox" name="chk1" value="${svo.mailNo }" ></td>
							<td>${svo.mailNo }</td>
							<td><a href="<c:url value='/mail/sendDetail.do?mailNo=${svo.mailNo }'/> " >${svo.mailName }</a></td>
							<td><fmt:formatDate value="${svo.mailSdate }" pattern="yyyy-MM-dd" /> </td>
						</tr>
					</c:forEach>
				</c:if>
				</table>
				<input type="submit" value="삭제" name="delete">
			</form>
		</div>
	</div>
	
</body>
</html>