<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet"	href="<c:url value='/css/view.css'/>">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$(".backlist").click(function(){
			location.href="<c:url value='/notice/notice.do'/> ";
		});
		
		$(".editNotice").click(function(){
			location.href="<c:url value='/notice/noticeEdit.do?noticeNo=${vo.noticeNo}'/> ";
		});
		
		$('.deleteNotice').click(function(){
			var result = confirm('정말 삭제하시겠습니다?');
			
			if(result){
				location.href="<c:url value='/notice/noticeDelete.do?noticeNo=${vo.noticeNo}'/> "; 
			}else{
				return false;
			}
		});
		var gradeCode = ${sessionScope.gradeCode };
		if(gradeCode < 3){
			$(".backlist").css("margin-left","85%");
		}else{
			$(".backlist").css("margin-left","95%");
		}
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
</style>

<div class="viewBody">
	<div class="box1">
		<h2>제목 : ${vo.noticeTitle } </h2>
		<h3>작성자 : ${vo.empName }</h3><br>
		<h3>내용</h3>
		<div>${vo.noticeContent }</div><br>
		<input type="button" class="backlist" value="목록" >
		<c:if test="${sessionScope.gradeCode < 3 }">
			<input type="button" class="editNotice" value="수정" >
			<input type="button" class="deleteNotice" value="삭제" >
		</c:if>
	</div>
</div>


