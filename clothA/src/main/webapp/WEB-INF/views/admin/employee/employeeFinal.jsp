<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="modal-header bg-primary">

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
<style type="text/css">
.row{
		margin: 15px;
	}
</style>
	<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
	<h3 class="smaller lighter blue no-margin modal-title">인사등록 승인처리</h3>
</div>
<div class="modal-body">
	<!-- Main content  -->
	<div class="row">
		<div class="col-sm-10">
			<div class="form-group">
				<div id="empFace">
				</div>
			</div>
		</div>
	</div>	
	<div class="row">
		<div class="col-sm-10">
			<div class="form-group">
				<label for="empNo" class="col-sm-2 control-label">사원코드</label>
				<div class="col-sm-3">
					<input type="text" name="empNo" id="empNo" readonly="readonly" class="valid2 form-control">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-10">
			<div class="form-group">
				<label for="deptName" class="col-sm-2 control-label">부서이름</label>
				<div class="col-sm-3">
					<input type="text" name="deptName" id="deptName" readonly="readonly" class="valid2 form-control">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-10">
			<div class="form-group">
				<label for="empName" class="col-sm-2 control-label">이름</label>
				<div class="col-sm-3">
					<input type="text" name="empName" id="empName" readonly="readonly" class="valid2 form-control">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-10">
			<div class="form-group">
				<label for="empZipcode" class="col-sm-2 control-label">우편번호</label>
				<div class="col-sm-3">
					<input type="text" name="empZipdcode" id="empZipcode" readonly="readonly" class="valid2 form-control"><br>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-10">
			<div class="form-group">
				<label for="empAddress" class="col-sm-2 control-label">주소</label>
				<div class="col-sm-3">
					<input type="text" name="empAddress" id="empAddress" readonly="readonly" class="valid2 form-control">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-10">
			<div class="form-group">
				<label for="empJumin" class="col-sm-2 control-label">주민등록번호</label>
				<div class="col-sm-3">
					<input type="text" name="empJumin" id="empJumin" readonly="readonly" class="valid2 form-control">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-10">
			<div class="form-group">
				<label for="empTel" class="col-sm-2 control-label">핸드폰</label>
				<div class="col-sm-3">
					<input type="text" name="empTel" id="empTel" readonly="readonly" class="valid2 form-control"><br>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-10">
			<div class="form-group">
				<label for="empEmail" class="col-sm-2 control-label">이메일 주소</label>
				<div class="col-sm-3">
					<input type="text" name="empEmail" id="empEmail" readonly="readonly" class="valid2 form-control"> 
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-10">
			<div class="form-group">
				<label for="empJob" class="col-sm-2 control-label">담당업무</label>
				<div class="col-sm-3">
					<input type="text" name="empJob" id="empJob" readonly="readonly" class="valid2 form-control">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-10">
			<div class="form-group">
				<label for="gradeName" class="col-sm-2 control-label">직급</label>
				<div class="col-sm-3">
					<input type="text" name="gradeName" id="gradeName" readonly="readonly" class="valid2 form-control">
				</div>
			</div>
		</div>
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