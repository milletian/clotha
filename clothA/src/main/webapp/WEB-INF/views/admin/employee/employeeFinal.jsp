<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="modal-header">

<script type="text/javascript">
	$(document).ready(function() {
		
		$('#employeeApp').click(function () {
			if(confirm("승인 처리 하시겠습니까?")){
				$.ajax({
			    	type:"POST",
			    	url : "<c:url value='/admin/employee/employeeApp.do'/>",
			    	data:{"empNo":$('#empNo').val()},
			    	dataType:'text',
			    	success:function(res){
			    	 	alert(res);
			    	 	$('#employeeAppClose').trigger('click');
			    	},
					error: function(xhr, status, error){
						alert("승인 실패");
					}
			    
					}); 
				}; 
				
			});

		
		/* $('#employeeApp').click(function() {
		var result = confirm('승인처리 하시겠습니까?');

		if (result) {
  			location.href = "<c:url value='/admin/employee/employeeApp.do?empNo=${map.EMP_NO }'/> ";
		} else {
			return false;
				}
					}) */
})//제이쿼리
</script>

	<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
	<h3 class="smaller lighter blue no-margin modal-title">인사등록 승인처리</h3>
</div>
<div class="modal-body">
	<!-- Main content  -->
	<div id="empFace">
	</div>
	<div>
		<label for="empNo">사원코드</label>
		<input type="text" name="empNo" id="empNo" readonly="readonly">
	</div>
	<div>
		<label for="deptName" class="label-right">부서이름</label>
		<input type="text" name="deptName" id="deptName" readonly="readonly">
	</div>
	<div>
		<label for="empName">이름</label>
		<input type="text" name="empName" id="empName" readonly="readonly">
	</div>
	<div>
		<label for="empZipcode">우편번호</label>
		<input type="text" name="empZipdcode" id="empZipcode" readonly="readonly"><br>
		<label for="empAddress">주소</label>
		<input type="text" name="empAddress" id="empAddress" readonly="readonly">
	</div>
	<div>
		<label for="empJumin">주민등록번호</label>
		<input type="text" name="empJumin" id="empJumin" readonly="readonly">
	</div>
	<div>
		<label for="empTel">핸드폰</label>
		<input type="text" name="empTel" id="empTel" readonly="readonly"><br>
	</div>
	<div>
		<label for="empEmail">이메일 주소</label>
		<input type="text" name="empEmail" id="empEmail" readonly="readonly"> 
	</div>
	<div>
		<label for="empJob">담당업무</label>
		<input type="text" name="empJob" id="empJob" readonly="readonly">
	</div>
	<div>
		<label for="gradeName">직급</label>
		<input type="text" name="gradeName" id="gradeName" readonly="readonly">
	</div>
</div>
<div class="modal-footer">
	<div>
	<span class="btn btn-sm btn-success" id="employeeApp">
     	승인<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="employeeAppClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>

	</div>
</div>