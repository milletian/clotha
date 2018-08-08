<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet"	href="<c:url value='/css/view.css'/>">
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js" ></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/> " ></script>
<script>
	$(document).ready(function(){
		$('input[type=submit]').click(function(){
			if($("input[name=noticeTitle]").val()=="" || $("input[type=text]").length>3){
				alert("제목을 입력하세요.");
				return false;
			}else if(CKEDITOR.instances.editor1.getData()==null || CKEDITOR.instances.editor1.getData()=='' ){
				alert("내용을 입력해 주세요.");
				return false;
			}
			
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
	input[name=noticeTitle]{
		width: 90%;
		margin-bottom: 20px;
	}
	input[type=submit]{
		margin-top: 20px;
	    margin-left: 90%;
	}
	
</style>

<div class="viewBody">
	<!-- Main content  -->
	<div class="box1">
		<h1> 공지사항 </h1>
	</div>
	<div class="box1">
		<form action="<c:url value='/notice/noticeWrite.do'/> " method="post" name="frm1" >
			제목  :  <input type="text" name="noticeTitle" >
			<textarea rows="10" cols="80" name="noticeContent" id="editor1" >
				
			</textarea>
			<script>
				CKEDITOR.replace('editor1');
			</script>
			<input type="submit" value="등록">
		</form>
	</div>
</div>


