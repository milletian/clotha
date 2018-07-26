<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet"	href="<c:url value='/css/view.css'/>">
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js" ></script>
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
	<!-- Main content  -->
	<div class="box1">
		<h1> 공지사항 </h1>
	</div>
	<div class="box1">
		<form action="<c:url value='/notice/noticeEdit.do'/> " method="post" name="frm1" >
			<input type="hidden" name="noticeNo" value="${vo.noticeNo }" >
			제목  :  <input type="text" name="noticeTitle" value="${vo.noticeTitle }" >
			<textarea rows="10" cols="80" name="noticeContent" id="editor1" >
				${vo.noticeContent }
			</textarea>
			<script>
				CKEDITOR.replace('editor1');
			</script>
			<input type="submit" value="수정">
		</form>
	</div>
</div>


