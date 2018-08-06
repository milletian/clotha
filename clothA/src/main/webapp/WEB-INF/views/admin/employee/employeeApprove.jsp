<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet"	href="<c:url value='/css/view.css'/>">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css2/style.css' /> " type="text/css" />
<script src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<link rel="stylesheet" href="<c:url value='/css/view.css' /> " type="text/css" />
<script type="text/javascript">
$(function() {
	
	/* 테이블 정렬 */
	$("table").tablesorter(); 
	
	/* 인사정보리스트 */
	$('#btnSearch').click(function() { 
		$.ajax({
	    	type:"POST",
	    	url : "<c:url value='/admin/employee/ajaxEmployeeApprove.do' />",
	    	data:$("#empApprove").serialize(),
	    	dataType:'json',
	    	success:function(res){
	    		if (res.length > 0) {
	    			$("table tbody").html('');
	 				$.each(res, function(idx, item) {
	 					var empList =
	 					"<tr ondblclick=popupOpen('"+item.EMP_NO+"')><td>"+item.EMP_NO+"</td>"
	 					+"<td>"+item.STORE_NAME+"</td>"
	 					+"<td>"+item.EMP_NO+"</td>"
	 					+"<td>"+item.DEPT_NAME+"</td>"
	 					+"<td>"+item.EMP_NAME+"</td>"
	 					+"<td>"+item.EMP_ZIPCODE+item.EMP_ADDRESS+"</td>"
	 					+"<td>"+item.EMP_JUMIN+"</td>"
	 					+"<td>"+item.EMP_TEL+"</td>"
	 					+"<td>"+item.EMP_EMAIL+"</td>"
	 					+"<td>"+item.EMP_JOB+"</td>"
	 			 		+"<td>"+item.GRADE_NAME+"</td>"
	 			 		+"<td>"+item.EMP_DEL+"</td></tr>";
	 					 $("table tbody").append(empList);
	 					 //undefined 항목 빈칸으로 출력
	 					$('tbody td').each(function (idx,item) {
	 					 var a = $(this).text();
		 				if(a=='undefined'){
		 					$(this).text('');
							}
		 				})
	 					});
	 				
	 				}else{
	 					$("table tbody").html('해당 내역이 없습니다.');
	 				}
	    		 $("table").trigger("update"); 
	             return false; 
	    	 },
			error: function(xhr, status, error){
				alert("올바른 조건을 입력해 주세요");
			}
	    
			}); 
		}); 
	//클릭 이벤트
	$(document ).on( "click" , "table tbody tr", function() {              
		$('table tbody tr td').removeClass('successsss');
		$(this).find('td').addClass('successsss');
		accCode=$(this).find('td:first').text();        
		
		
    });
})//제이쿼리

function popupOpen(empNo){

	$.ajax({
		url:"<c:url value='/admin/employee/employeeFinal.do' />",
		data:{"empNo":empNo},
		dataType:"json",
		success:function(res){
			$('#modal-EmpFinal #empFace img').remove();
			$('#modal-EmpFinal #empFace').text("");
			if(res.EMP_FACE!=null && res.EMP_FACE!=""){
			$('#modal-EmpFinal #empFace').append("<img src='<c:url value='/pd_images/"+res.EMP_FACE+"'/>width=150px;'>"); 
			}else{
			$('#modal-EmpFinal #empFace').text("사진을 등록해주세요");
			}
			$('#modal-EmpFinal #empNo').val(res.EMP_NO);
			$('#modal-EmpFinal #storeCode').val(res.STORE_CODE);
			$('#modal-EmpFinal #deptName').val(res.DEPT_NAME);
			$('#modal-EmpFinal #empName').val(res.EMP_NAME);
			$('#modal-EmpFinal #empZipcode').val(res.EMP_ZIPCODE);
			$('#modal-EmpFinal #empAddress').val(res.EMP_ADDRESS);
			$('#modal-EmpFinal #empJumin').val(res.EMP_JUMIN);
			$('#modal-EmpFinal #empTel').val(res.EMP_TEL);
			$('#modal-EmpFinal #empEmail').val(res.EMP_EMAIL);
			$('#modal-EmpFinal #empJob').val(res.EMP_JOB);
			$('#modal-EmpFinal #gradeName').val(res.GRADE_NAME);
			$('#modal-EmpFinal #empDel').val(res.EMP_DEL);
			
			$('#openmodal').trigger('click');
		},
		error:function(x,e){ 
			if(x.status==0){
				alert('You are offline!!n Please Check Your Network.'); 
			}else if(x.status==404){ 
				alert('Requested URL not found.'); 
			}else if(x.status==500){ 
				alert('Internel Server Error.'); 
			}else if(e=='parsererror'){ 
				alert('Error.nParsing JSON Request failed.'); 
			}else if(e=='timeout'){
				alert('Request Time out.'); 
			}else { 
				alert('Unknow Error.n'+x.responseText); } 
			}
	})
}





</script>
<style type="text/css">
table.tablesorter tbody td.successsss{
		background-color: skyblue;
	}
</style>
<div class="viewBody">

	<div class="box1" style="padding: 10px">
		<form name=empApprove id="empApprove">
			<button type="button" id="btnSearch">&nbsp;조회</button>
		</form>
	</div>
	<div class="box2">
	<a data-toggle="modal" data-target="#modal-EmpFinal"  role="button" data-backdrop="static">
	<input type="hidden" id="openmodal"></a>
		<div id="content1">
			<table cellspacing="1" class="tablesorter">
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
					<col style="width:5%;" />		
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
						<th scope="col">직급</th>
						<th scope="col">승인요청</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
	</div>
</div>

<div id="modal-EmpFinal" class="modal fade" tabindex="-1" role="dialog" style="display: none; z-index: 1050;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="employeeFinal.jsp" %>
        </div>
    </div>
</div>


