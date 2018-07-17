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
	<form name="frm" method="post" enctype="multipart/form-data" action="<c:url value='/admin/employee/employeeWrite.do'/>">

		<div class="box3">
			<div>
				<label for="deptNo">부서코드</label>
				<select name="deptNo" id="deptNo" title="부서코드" class="valid">
            		<option value="10">정직원</option>
            		<option value="20">계약직</option>
            		<option value="30">단기알바</option>
				</select>
			</div>
			<div>
				<label for="empName">이름 </label>
				<input type="text" name="empName" id="empName" class="valid">
			</div>
			<div>
				<label for="empPwd">비밀번호</label>
				<input type="password" name="empPwd" id="empPwd" class="valid">
			</div>
			<div>
        		<label for="pwd2">비밀번호 확인</label>
        		<input type="Password" name="pwd2" id="pwd2">
		    </div>
			 <div>
     		   <label for="zipcode">주소</label>
        	   <input type="text" name="empZipcode" id="empZipcode"  title="우편번호" >
        	   <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
        	  <!--  <span class="">&nbsp;</span> -->
       		   <input type="text" name="empAddress" id="empAddress" title="주소" ><br />
        	 <!--   <span class="">&nbsp;</span> -->
        	   <input type="text" name="addressDetail" title="상세주소"  >
    		</div>
			<div>
				<label for="empJumin">주민등록번호</label> 
				<input type="text" name="empJumin" id="empJumin" class="valid">
			</div>
			<div>
				<label for="empTel">전화번호</label>
				<input type="text" name="empTel" id="empTel" class="valid">
			</div>
			<div>
				<label for="empEmail">이메일</label>
				<input type="text" name="empEmail" id="empEmail" class="valid">
			</div>
			<div>
				<label for="uploadFace">증명사진첨부(image)</label>
				<input type="file" name="uploadFace" id="uploadFace">
			</div>
			<div>
				<label for="empJob">담당업무</label>
				<input type="text" name="empJob" id="empJob" class="valid">
			</div>
			<div>
				<label for="gradeCode">직급</label> 
				<select name="gradeCode" id="gradeCode" title="직급" class="valid">
					<option value="1" >마스터</option>
					<option value="2" >본사 관리자</option>
					<option value="3" >점장</option>
					<option value="4" >사원</option>
				</select>
			</div>
		 <input type ="submit" value="등록">
	     <input type ="reset"  value="취소" >
		</div>
	</form>
</div>


