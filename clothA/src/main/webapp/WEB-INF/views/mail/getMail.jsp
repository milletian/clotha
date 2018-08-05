<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("input[type=hidden]").each(function(){
			if($(this).val() == "Y"){
				$(this).parent().css("color","#aaaaaa");
				$(this).siblings("td").find("a").css("color","#aaaaaa");
			}
		});
		
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
		
		$('input[type=button]').click(function(){
			$('form[name=chfrm]').attr("action","<c:url value='/mail/getSave.do'/>").submit();
			
		});
		
		
	});
	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
	
	
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
		width: 215px;
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
	.divPage, .divSearch{
		text-align: center;
	}
</style>
<title>받은쪽지</title>
</head>
<body>
	<div>
		<h2>받은쪽지</h2>
		<form name="frmPage" method="post"
			action="<c:url value='/mail/getMail.do'/>">
			<input type="hidden" name="currentPage" >
			<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
			<input type="hidden" name="searchCondition" value="${param.searchCondition}">	
		</form>
		<form action="<c:url value='/mail/getMulti.do'/> " name="chfrm" method="post" >
			<table>
				<tr>
					<th><input type="checkbox" name="checkAll" onclick="allChecked(this.checked)" ></th>
					<th>번호</th>
					<th>제목</th>
					<th>보낸이</th>
					<th>날짜</th>
				</tr>
				<c:if test="${empty list }">
					<tr>
						<td colspan="5">받은 쪽지가  없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="vo" >
						<tr>
							<input type="hidden" value="${vo.getMailRead }">
							<td><input type="checkbox" name="chk" value="${vo.mailNo }" ></td>
							<td>${vo.mailNo }</td>
							<td><a href="<c:url value='/mail/mailDetail.do?mailNo=${vo.mailNo }'/>" >${vo.mailName }</a></td>
							<td>${vo.empName }</td>
							<td><fmt:formatDate value="${vo.mailSdate }" pattern="yyyy-MM-dd" /> </td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<input type="submit" value="삭제" name="delete">
			<input type="button" value="보관" name="save">
		</form>
	</div>
	<div class="divPage">
		<!-- 페이지 번호 추가 -->		
		<!-- 이전 블럭으로 이동 -->
		<c:if test="${pageVo.firstPage>1 }">
			<a href="#" onclick="pageFunc(${pageVo.firstPage-1})">
				<img alt="이전 블럭으로 이동" src="<c:url value='../images/first.JPG'/> ">
			</a>		
		</c:if>
		
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<c:forEach var="i" begin="${pageVo.firstPage }" end="${pageVo.lastPage}">
			<c:if test="${i==pageVo.currentPage }">
				<span style="color: blue;font-weight: bold;font-size:1.0em">
					${i}</span>
			</c:if>
			<c:if test="${i!=pageVo.currentPage }">
				<a href="#" onclick="pageFunc(${i})">
				[${i }]</a>
			</c:if>
		</c:forEach>
			
		<!-- 다음 블럭으로 이동 -->
		<c:if test="${pageVo.lastPage<pageVo.totalPage }">
			<a href="#" onclick="pageFunc(${pageVo.lastPage+1})">
				<img alt="다음 블럭으로 이동" src="<c:url value='/images/last.JPG'/> ">
			</a>	
		</c:if>
		<!--  페이지 번호 끝 -->
	</div>
	<div class="divSearch">
	   	<form name="frmSearch" method="post" 
	   		action='<c:url value="/mail/getMail.do"/>'>
	        <select name="searchCondition">        	
	            <option value="mail_name"
	            	<c:if test="${param.searchCondition=='mail_name'}">
	            		selected="selected"
	            	</c:if>
	            >제목</option>
	            <option value="mail_content"
	            	<c:if test="${param.searchCondition=='mail_content'}">
	            		selected="selected"
	            	</c:if>
	            >내용</option>
	            <option value="emp_name"
	            	<c:if test="${param.searchCondition=='emp_name'}">
	            		selected="selected"
	            	</c:if>	 
	            >보낸이</option>
	        </select>   
	        <input type="text" name="searchKeyword" title="검색어 입력"
	        	value="${param.searchKeyword}">   
			<input type="submit" value="검색">
	    </form>
	</div>
</body>
</html>