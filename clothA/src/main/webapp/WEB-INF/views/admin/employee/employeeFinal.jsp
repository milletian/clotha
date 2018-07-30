<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"	href="<c:url value='/css/view.css'/>">
<script type="text/javascript">

</script>
<style type="text/css">

</style>

<div class="viewBody">
	<!-- Main content  -->
		<div >
			<div >
				<div>
					<input type="hidden" name="oldFileName" value="${map.EMP_FACE}">
					<c:if test="${!empty map.EMP_FACE }">
					<img alt="직원사진" src="<c:url value='/pd_images/${map.EMP_FACE}'/>" style="width: 150px;">
					</c:if>
					<c:if test="${empty map.EMP_FACE }">
					<span>등록된 사진이 없습니다</span>
					</c:if>
				</div>
				<div>
					<label for="empNo">사원코드</label>
					<input type="text" name="empNo" value="${map.EMP_NO }" readonly="readonly">
				</div>
				<div>
					<label for="deptNo" class="label-right">부서코드</label> 
					<input type="text" name="deptNo" value="${map.DEPT_NO }" readonly="readonly">
				</div>
				<div>
						<label for="empName">이름</label> 
						<input type="text" name="empName" id="empName" class="valid" value="${map.EMP_NAME }" readonly="readonly">
				</div>
				<div>
					<label for="empZipcode">우편번호</label> 
					<input type="text" id="empZipcode" name="empZipcode" value="${map.EMP_ZIPCODE }" readonly="readonly"><br>
					<label for="empAddress">주소</label>
					<c:set var="address" value="${map.EMP_ADDRESS.split('~') }"></c:set>
					<input type="text" id="empAddress" name="empAddress" value="${address[0] }" readonly="readonly"><br>
					<label for="addressDetail">상세주소</label>
					<input type="text" id="addressDetail" name="addressDetail" value="${address[1] }" readonly="readonly"><br> 
				</div>
				<div>
					<label for="empJumin">주민등록번호</label>
					<c:set var="jumin" value="${map.EMP_JUMIN.split('-') }"></c:set>  
					<input type="text"	name="empJumin1" id="empJumin1" value="${jumin[0] }" readonly="readonly">-
					<input type="text" name="empJumin2" id="empJumin2"	value="${jumin[1] }" readonly="readonly">
				</div>
				<div>
					<label for="empTel" >핸드폰</label>
					<input type="text" id="empTel" name="empTel"value="${map.EMP_TEL }" readonly="readonly"><br>
				</div>
				<div>
					<label for="empEmail">이메일 주소</label> 
					<c:set var="email" value="${map.EMP_EMAIL.split('@') }"></c:set>
					<input type="text"	name="email1" id="email1" title="이메일주소 앞자리" value='${email[0]}' readonly="readonly">
					@ <input type="text" name="email2" id="email2" title="이메일주소 뒷자리" value='${email[1]}' readonly="readonly">
				</div>
				<div>
					<label for="empJob">담당업무</label> 
					<input type="text" name="empJob" id="empJob" value="${map.EMP_JOB }" readonly="readonly">
				</div>
				<div>
					<label for="gradeCode">직급</label>
					<input type="text" name="gradeCode" value="${map.GRADE_CODE }" readonly="readonly">
					 
			</div>
		</div>
		<div>
			<input type="button" value="승인">
			<input type="reset" value="취소" >
			<input type="text" name="empNo" value="${map.EMP_NO }">
		 </div>
	</div>
</div>
