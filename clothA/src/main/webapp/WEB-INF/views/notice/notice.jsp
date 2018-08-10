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
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
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
		border-collapse: collapse;
	}
	#noticeWrite{
	    margin-left: 90%;
	}
	#noticeWrite{
		margin-top: 20px;
	}
	th{
		font-size: 1.5em;
		background: #599ab9bf;
		color: white;
	}
	tr th, td{
		border-bottom: 1px solid #444444;
		height: 40px;
	}
	a{
		text-decoration: none;
	}
	.divPage, .divSearch{
		text-align: center;
	}
</style>

<div class="viewBody">
	<!-- Main content  -->
	<form name="frmPage" method="post"
		action="<c:url value='/notice/notice.do'/>">
		<input type="hidden" name="currentPage" >
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="searchCondition" value="${param.searchCondition}">	
	</form>
	<div class="box1">
	
		<h1>공지사항</h1>
		<table>
			<colgroup>
				<col style="width:7%;" />
				<col style="width:63%;" />
				<col style="width:22%;" />
				<col style="width:*%;" />
			</colgroup>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">조회수</th>
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
		<div class="divPage">
			<!-- 페이지 번호 추가 -->		
			<!-- 이전 블럭으로 이동 -->
			<c:if test="${pageVo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${pageVo.firstPage-1})">
					<img alt="이전 블럭으로 이동" src="<c:url value='/images/first.JPG'/> ">
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
					<img alt="다음 블럭으로 이동" src="<c:url value='/images/last.JPG'/>">
				</a>	
			</c:if>
			<!--  페이지 번호 끝 -->
		</div>

		<div class="divSearch">
		   	<form name="frmSearch" method="post" 
		   		action='<c:url value="/notice/notice.do"/>'>
		        <select name="searchCondition">        	
		            <option value="notice_title"
		            	<c:if test="${param.searchCondition=='notice_title'}">
		            		selected="selected"
		            	</c:if>	 
		            >제목</option>
		            <option value="notice_content"
		            	<c:if test="${param.searchCondition=='notice_content'}">
		            		selected="selected"
		            	</c:if>
		            >내용</option>
		            <option value="emp_name"
		            	<c:if test="${param.searchCondition=='emp_name'}">
		            		selected="selected"
		            	</c:if>
		            >작성자</option>
		        </select>   
		        <input type="text" name="searchKeyword" title="검색어 입력"
		        	value="${param.searchKeyword}">   
				<input type="submit" value="검색">
		    </form>
		</div>
	</div>
</div>


