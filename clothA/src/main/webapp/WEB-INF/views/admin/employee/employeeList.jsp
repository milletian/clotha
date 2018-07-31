<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css2/style.css' /> " type="text/css" />
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
	
	$(".ajax").select2();
	
	/* 인사정보리스트 */
	$('#btnSearch').click(function() { 
		$.ajax({
	    	type:"POST",
	    	url : "<c:url value='/admin/employee/ajaxEmployeeList.do' />",
	    	data:$("#employeeList").serialize(),
	    	dataType:'json',
	    	success:function(res){
	    		if (res.length > 0) {
	    			$("table tbody").html('');
	 				$.each(res, function(idx, item) {
	 					var empList =
	 					"<tr ondblclick=popupOpen2('"+item.EMP_NO+"')><td>"+item.EMP_NO+"</td>"
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
	

	
})//제이쿼리

function popupOpen(){

	var popUrl = "<c:url value='/admin/employee/employeeWrite.do'/>";	//팝업창에 출력될 페이지 URL

	var popOption = "width=800, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"정보입력",popOption);

}
function popupOpen2(empNo){

	var popUrl = "<c:url value='/admin/employee/employeeDetail.do?empNo="+empNo+" '/>";	//팝업창에 출력될 페이지 URL

	var popOption = "width=800, height=700, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"정보입력",popOption);

}



</script>
<style type="text/css">
</style>
<div class="viewBody">

	<div class="box1" style="padding: 10px">
		<form name=employeeList id="employeeList">
			<label for="searchStore">매장</label>
			<select style="max-height: 30px;width: 100px" name="storeCode" data-placeholder="검색할 매장을 선택하세요" id="searchStore" class="ajax"></select>
			
			<label for="empName">이름</label>
			<input type="text" name="empName" id="empName">
			
			<label for="searchDeptNo">고용형태</label>
			<select name="deptNo">
				<option value="">선택하세요</option>
				<option value="10">정직원</option>
				<option value="20">계약직</option>
				<option value="30">단기알바</option>
			</select>
			
			<label for="searchGrade">직급</label>
			<select name="gradeCode">
				<option value="">선택하세요</option>
				<option value="1">마스터</option>
				<option value="2">본사관리자</option>
				<option value="3">점장</option>
				<option value="4">사원</option>
			</select>
			<button type="button" id="btnSearch">&nbsp;조회</button>
		</form>
	</div>
	<div class="box2">
		<a href="#" onclick="popupOpen()"><i class="fas fa-edit"></i></a> 
		<a href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a> 
		<a href="#"><i class="fas fa-trash-alt"></i></a>
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




