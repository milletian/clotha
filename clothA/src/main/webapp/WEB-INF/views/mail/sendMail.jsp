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
		
		$('input[name=save]').click(function(){
			$('form[name=chfrm]').attr("action","<c:url value='/mail/sendSave.do'/>").submit();
			
		});
		
	});
	
	
	function allChecked(bool){
		$('input[name=chk]').prop('checked', bool);
	}
	
	
</script>
<style type="text/css">
	table{
		text-align: center;
		font-weight: bold;
	}
	tr th:nth-of-type(3){
		width: 290px;
	}
	tr th:last-child{
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
<title>보낸쪽지</title>
</head>
<body>
	<div>
		<h2>보낸쪽지</h2>
		<form action="<c:url value='/mail/sendMulti.do'/> " name="chfrm" method="post" >
			<table>
				<tr>
					<th><input type="checkbox" name="allchk" onclick="allChecked(this.checked)" ></th>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
				<c:if test="${empty list }">
					<tr>
						<td colspan="4">보낸 쪽지가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="vo" items="${list }" >
						<tr>
							<td><input type="checkbox" name="chk" value="${vo.mailNo }" ></td>
							<td>${vo.mailNo }</td>
							<td><a href="<c:url value='/mail/sendDetail.do?mailNo=${vo.mailNo }'/> " >${vo.mailName }</a></td>
							<td><fmt:formatDate value="${vo.mailSdate }" pattern="yyyy-MM-dd" /> </td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<input type="submit" value="삭제" name="delete">
			<input type="button" value="보관" name="save">
		</form>
	</div>
</body>
</html>