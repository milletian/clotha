<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value='/css/view.css'/>">

<style type="text/css">
.box3 {
	padding: 5px;
	background: white;
	border-width: 3px 1px 1px;
	border-style: solid;
	border-color: rgb(210, 214, 222);
	border-image: initial;
	border-top: 3px solid 1f84bf;
	margin-bottom: 20px;
}
</style>

<div class="viewBody">
	<!-- Main content  -->
	<form name="register" method="post" enctype="multipart/form-data" action="#">

		<div class="box3">
			<div>
				<label>사원코드 </label> <span>등록된 사원번호</span>
			</div>
			<div>
				<label>부서코드 <select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
				</select>
				</label>
			</div>
			<div>
				<label>이름 <input type="text">
				</label>
			</div>
			<div>
				<label>비밀번호 <input type="password">
				</label>
			</div>
			<div>
				<label>주소 <input type="button" value="검색">
				</label>
			</div>
			<div>
				<label>상세주소 <input type="text">
				</label>
			</div>
			<div>
				<label>주민번호 
				<input type="text">-<input type="password">
			</div>
			</label>
			<div>
				<label>전화번호 <input type="text">
				</label>
			</div>
			<div>
				<label>사진(이미지) <input type="file">
				</label>
			</div>
			<div>
				<label>담당업무 <input type="text">
				</label>
			</div>
			<div>
				<label>입사날짜 
				<select>
						<option>인사관리</option>
						<option>재고관리</option>
						<option>상품관리</option>
						<option>창고관리</option>
				</select>
				</label>
			</div>
			<div>
				<label>권한코드 
				<select>
						<option>전지전능</option>
						<option>할줄아는게있냐</option>
						<option>무쓸모</option>
				</select>
				</label>
			</div>
		</div>
	</form>
</div>


