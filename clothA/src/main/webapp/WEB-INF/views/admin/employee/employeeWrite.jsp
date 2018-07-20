<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value='/css/view.css'/>">
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.tablesorter.js' />"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		/* 맨처음 입력 포커싱 */
		$('#deptNo').focus();
		
		
		/* 빈칸 입력 막는 검사  */
		$('form[name=employeeWrite]').submit(function(){
			
			var bool = true;
			
			$('.valid').each(function(idx,item){
				if($(this).val().length<1){
					alert($(this).prev().text()+"을 입력하세요.");
					$(this).focus();
					bool = false;
					return false;
				}
			});
			/*입력한 비밀번호 1과 확인 비밀번호 2의 일치여부 검사 */
			if(bool){
				if($('#empPwd').val()!=$('#empPwd2').val()){
					alert('비밀번호가 일치하지 않습니다.');
					$('#empPwd2').focus();
					bool= false;
					return false;
			/* 주민번호 자릿수 맞게 입력했는지 확인 */
				} else if($('#empJumin1').val().length<6){
					alert('올바른 주민등록 번호를 입력헤 주세요');
					$('#empJumin1').focus();
					bool= false;
					return false;
					
				}else if($('#empJumin2').val().length<7){
					alert('올바른 주민등록 번호를 입력헤 주세요');
					$('#empJumin2').focus();
					bool= false;
					return false;
				}
						
			
			}
			return bool;
		});
	});

	/*주민등록번호 유효성체크 */
	
	/* 숫자만입력하도록  */
	function jumin1Keyup(empJumin1) {
		if(empJumin1.value.match('[^0-9]')){
			  alert("주민등록번호는 숫자만 입력하셔야 합니다.");
		        return false;
	/*앞자리 6자리 숫자 입력하면 자동으로 뒷자리 입력칸으로 이동  */
		}else if(empJumin1.value.length >= 6){
				$('#empJumin2').focus();
		}
	}
	/* 숫자만 입력하도록 */
	function jumin2Keyup(empJumin2) {
		if(empJumin2.value.match('[^0-9]')){
			  alert("주민등록번호는 숫자만 입력하셔야 합니다.");
		        return false;
			}
		}
	
	


</script>

<style type="text/css">

</style>

<div class="viewBody">
	<!-- Main content  -->
	<form name="employeeWrite" method="post" enctype="multipart/form-data" action="<c:url value='/admin/employee/employeeWrite.do'/>">

		<div class="box3">
			<div>
				<label for="deptNo">부서코드</label>
				<select name="deptNo" id="deptNo" title="부서코드" class="valid">
            		<option value="">선택하세요</option>
            		<option value="10">정직원</option>
            		<option value="20">계약직</option>
            		<option value="30">단기알바</option>
				</select>
			</div>
			<div>
				<label for="empName">이름</label>
				<input type="text" name="empName" id="empName" class="valid">
			</div>
			<div>
				<label for="empPwd">비밀번호</label>
				<input type="password" name="empPwd" id="empPwd" class="valid">
			</div>
			<div>
        		<label for="empPwd2">비밀번호 확인</label>
        		<input type="Password" name="empPwd2" id="empPwd2" class="valid">
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
				<input type="text" name="empJumin1" id="empJumin1" class="valid" onkeyup="jumin1Keyup(this)" maxlength="6">-
				<input type="text" name="empJumin2" id="empJumin2" onkeyup="jumin2Keyup(this)"maxlength="7">
				
			</div>
			<div>
				<label for="emptel">핸드폰</label>&nbsp;
				 <span class="valid"><select name="hp1" id="hp1" title="휴대폰 앞자리">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>- 
				<input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리" >- 
				<input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리" ></span>
			</div>
			<div>
				<label for="empEmail">이메일 주소</label> 
				<input type="text" name="email1" id="email1" title="이메일주소 앞자리" class="valid">
				@ <select name="email2"	id="email2" title="이메일주소 뒷자리">
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="etc">직접입력</option>
				</select> 
				<input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden">
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
					<option value="">선택하세요</option>
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



