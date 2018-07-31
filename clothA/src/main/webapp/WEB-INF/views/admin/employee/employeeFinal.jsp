<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"	href="<c:url value='/css/view.css'/>">
<script src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		$('.employeeApp').click(function () {
			 var result = confirm('하시겠습니까?');
				
				if(result){
					 location.href="<c:url value='/admin/employee/employeeApp.do?empNo=${map.EMP_NO }'/> ";
				}else{
					return false;
				}
		})
	})//제이쿼리

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
					<span>${map.EMP_NO }</span>
				</div>
				<div>
					<label for="deptNo" class="label-right">부서코드</label> 
					<span>${map.DEPT_NAME }</span>
				</div>
				<div>
						<label for="empName">이름</label> 
						<span>${map.EMP_NAME }</span>
				</div>
				<div>
					<label for="empZipcode">우편번호</label> 
					<span>${map.EMP_ZIPCODE }</span><br>
					<label for="empAddress">주소</label>
					<c:set var="address" value="${map.EMP_ADDRESS.split('~') }"></c:set>
					<span>${address[0] }</span><br>
					<label for="addressDetail">상세주소</label>
					<span>${address[1] }</span><br> 
				</div>
				<div>
					<label for="empJumin">주민등록번호</label>
					<c:set var="jumin" value="${map.EMP_JUMIN.split('-') }"></c:set>  
					<span>${jumin[0] }-${jumin[1] }</span>
				</div>
				<div>
					<label for="empTel" >핸드폰</label>
					<span>${map.EMP_TEL }</span><br>
				</div>
				<div>
					<label for="empEmail">이메일 주소</label> 
					<c:set var="email" value="${map.EMP_EMAIL.split('@') }"></c:set>
					<span>${email[0]}@${email[1]}</span>
				</div>
				<div>
					<label for="empJob">담당업무</label> 
					<span>${map.EMP_JOB }</span>
				</div>
				<div>
					<label for="gradeCode">직급</label>
					<span>${map.GRADE_NAME }</span>
				</div>
		</div>
		<div>
			<input type="button" value="승인" class="employeeApp">
			<input type="reset" value="취소" >
			<input type="text" name="empNo" value="${map.EMP_NO }">
		 </div>
	</div>
</div>
