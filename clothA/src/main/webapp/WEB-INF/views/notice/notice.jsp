<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet"	href="<c:url value='/css/view.css'/>">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"  >
	$(document).ready(function(){
		$("#noticeWrite").click(function(){
			location.href="<c:url value='/notice/noticeWrite.do'/>";
		});
	});
</script>
                               
<style type="text/css">
	.box1{
	
	padding: 5px;
	background: white;
		
    border-width: 3px 1px 1px;
    border-style: solid;
    border-color: rgb(210, 214, 222);
    border-image: initial;
    border-top: 3px solid rgb(210, 214, 222);
    margin-bottom: 20px;
	}
	.box2{
	
	padding: 5px;
	background: white;
		
    border : 1px solid black;
    margin-bottom: 20px;
	}
	table{
		width: 97%;
		text-align: center;
	}
	#noticeWrite{
	    margin-left: 90%;
	}
	#noticeWrite{
		margin-top: 20px;
	}
</style>

<div class="viewBody">
	<!-- Main content  -->
	<div class="box1">
		<h1>공지사항</h1>
	</div>
	<div class="box1">
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="4">공지사항이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var="vo" items="${list }" >
					<tr>
						<td>${vo.noticeNo }</td>
						<td><a href="<c:url value='/notice/noticeDetail.do?noticeNo=${vo.noticeNo }'/> " >${vo.noticeTitle }</a></td>
						<td>${vo.empName }</td>
						<td>${vo.noticeRead }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<c:if test="${sessionScope.gradeCode < 3 }">
			<button id="noticeWrite" >공지사항 등록</button>
		</c:if>
	</div>
</div>


