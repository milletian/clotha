<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	
<div class="modal-header">
	<script type="text/javascript">
	$(function() {
	
	/* 테이블 정렬 */
	$("table").tablesorter(); 

	/* 매장코드로 검색 */
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/store/ajaxStoreList.do' />",
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$("#searchStore").html('');
    				var option1 = "<option value=''>전체</option>";
    				$("#searchStore").append(option1);
    			$.each(res,function(idx, item){
    				var option2 =
   					"<option value='"+item.storeCode+"'>";
    				option2 += item.storeName;
    				option2 += "</option>";
        			$("#searchStore").append(option2);
    			})
    		}else{
    			$("#searchStore").html('');
    		}
    	},
    	error: function(xhr, status, error){
			alert("등록된 매장을 선택해주세요");
		}
	});//ajax  
	   //검색버튼
	
	/* $(".ajax").select2(); */
	
	/* 인사정보리스트 */
	$('#btnSearchEmp').click(function() { 
		$.ajax({
	    	type:"POST",
	    	url : "<c:url value='/admin/employee/ajaxEmployeeSearch.do' />",
	    	data:$("#employeeList").serialize(),
	    	dataType:'json',
	    	success:function(res){
	    		if (res.length > 0) {
	    			$("#empTable tbody").html('');
	 				$.each(res, function(idx, item) {
	 					var empList =
	 					"<tr ondblclick=popupEmpText('"+item.EMP_NO+"','"+item.EMP_NAME+"')><td>"+item.EMP_NO+"</td>"
	 					+"<td>"+item.STORE_NAME+"</td>"
	 					+"<td>"+item.EMP_NO+"</td>"
	 					+"<td>"+item.DEPT_NAME+"</td>"
	 					+"<td>"+item.EMP_NAME+"</td>"
	 					+"<td>"+item.EMP_ZIPCODE+item.EMP_ADDRESS+"</td>"
	 					+"<td>"+item.EMP_JUMIN+"</td>"
	 					+"<td>"+item.EMP_TEL+"</td>"
	 					+"<td>"+item.EMP_EMAIL+"</td>"
	 					+"<td>"+item.EMP_JOB+"</td>"
	 					+"<td>"+item.EMP_JOINDATE+"</td>"
	 			 		+"<td>"+item.GRADE_NAME+"</td></tr>";
	 					 $("#empTable tbody").append(empList);
	 					 //undefined 항목 빈칸으로 출력
	 					$('#empTable td').each(function (idx,item) {
	 					 var a = $(this).text();
		 				if(a=='undefined'){
		 					$(this).text('');
							}
		 				})
	 					});
	 				
	 				}else{
	 					$("#empTable tbody").html('해당 내역이 없습니다.');
	 				}
	    		 $("table").trigger("update"); 
	             return false; 
	    	 },
			error: function(xhr, status, error){
				alert("올바른 조건을 입력해 주세요");
			}
	    
			}); 
		}); 
	

	
	})//제이쿼리

	function popupEmpText(empNo,empName){
		var obj = new Object();
		obj.empNo=empNo;
		obj.empName=empName;
		
		window.returnValue = obj;
		window.returnValueRead('Emp');
		$('#btnsearchEmpClose').trigger('click');
	}



	</script>
	<style type="text/css">
	</style>
	<div class="viewBody">
	
		<div class="box1" style="padding: 10px">
			<form name=employeeList id="employeeList">
				<button type="button" id="btnSearchEmp">&nbsp;점장조회</button>
			</form>
		</div>
		<div class="box2">
			<div id="content1">
				<table cellspacing="1" class="tablesorter" id="empTable">
					<colgroup>
						<col style="width:5%;" />
						<col style="width:5%;" />
						<col style="width:5%;" />
						<col style="width:5%;" />
						<col style="width:5%;" />
						<col style="width:15%;" />		
						<col style="width:8%;" />		
						<col style="width:5%;" />		
						<col style="width:5%;" />		
						<col style="width:5%;" />		
						<col style="width:7%;" />		
						<col style="width:5%;" />		
					</colgroup>
					<thead>
						<tr>
							<th scope="col">매장코드</th>
							<th scope="col">매장이름</th>
							<th scope="col">직원코드</th>
							<th scope="col">고용형태</th>
							<th scope="col">이름</th>
							<th scope="col">주소</th>
							<th scope="col">주민등록번호</th>
							<th scope="col">전화번호</th>
							<th scope="col">메일</th>
							<th scope="col">담당업무</th>
							<th scope="col">입사일</th>
							<th scope="col">직급</th>
						</tr>
					</thead>
					<tbody>
	
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="modal-footer">
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnsearchEmpClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>



