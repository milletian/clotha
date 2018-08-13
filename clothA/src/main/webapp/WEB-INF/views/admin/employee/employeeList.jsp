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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<link rel="stylesheet" href="<c:url value='/css/view.css' /> " type="text/css" /> <!-- 만든 view css  -->
<script src="<c:url value='/js/FileSaver.js' />"></script><!-- 엑셀 플러그인 -->
<script src="<c:url value='/js/xlsx.core.min.js' />"></script><!-- 엑셀 플러그인 -->
<script src="<c:url value='/js/tableexport.js' /> "></script><!-- 엑셀 플러그인 -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script><!-- 부트스트랩 -->
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> <!-- 테이블 플러그인 -->
<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet"><!-- 테이블 플러그인 -->

<script type="text/javascript">
$(function() {
	
	var liveTableData = $("#empTable").tableExport({
	    headings: true,                    // (Boolean), display table headings (th/td elements) in the <thead>
	    footers: true,                     // (Boolean), display table footers (th/td elements) in the <tfoot>
	    formats: ["xlsx"],    // (String[]), filetypes for the export
	    fileName: "id",                    // (id, String), filename for the downloaded file
	    bootstrap: true,                   // (Boolean), style buttons using bootstrap
	    position: "bottom",                 // (top, bottom), position of the caption element relative to table
	    ignoreRows: null,                  // (Number, Number[]), row indices to exclude from the exported file
	    ignoreCols: null,                   // (Number, Number[]), column indices to exclude from the exported file
	    ignoreCSS: ".tableexport-ignore"   // (selector, selector[]), selector(s) to exclude from the exported file
	});
	
	/* 테이블 정렬 */
	$("#empTable").tablesorter(); 

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
	/* 매장코드로 검색 */
	
	
	
	$(".ajax").select2();
	$(".ajax2").select2();
	$(".ajax3").select2();
	
	/* 인사정보리스트 */
	$('#btnSearch').click(function() { 
		$.ajax({
	    	type:"POST",
	    	url : "<c:url value='/admin/employee/ajaxEmployeeList.do' />",
	    	data:$("#employeeList").serialize(),
	    	dataType:'json',
	    	success:function(res){
	    		if (res.length > 0) {
	    			$("#empTable tbody").html('');
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
		 					liveTableData.reset();
	 					});
	 				
	 				}else{
	 					$("#empTable tbody").html('해당 내역이 없습니다.');
	 				}
	    		 $("#empTable").trigger("update"); 
	             return false; 
	    	 },
			error: function(xhr, status, error){
				alert("올바른 조건을 입력해 주세요");
			}
	    
			}); 
		}); 
	
	$(document).on( "click" , "table tbody tr", function() {              
		$('table tbody tr td').removeClass('successsss');
		$(this).find('td').addClass('successsss');
		accCode=$(this).find('td:first').text();        
    });
	
})//제이쿼리


function popupOpen(empNo){

	$.ajax({
		url:"<c:url value='/admin/employee/employeeDetail.do' />",
		data:{"empNo":empNo},
		dataType:"json",
		success:function(res){
			var juminArr=res.EMP_JUMIN.split('-');
			var addressArr=res.EMP_ADDRESS.split('~');
			var emailArr=res.EMP_EMAIL.split('@');

			$('#employeeDetail #empFace img').remove();
			$('#employeeDetail #empFace').text("");
			if(res.EMP_FACE!=null && res.EMP_FACE!=""){
				$('#employeeDetail #empFace').append("<img src='<c:url value='/pd_images/"+res.EMP_FACE+"'/>' width=150px;>"); 
				$('#employeeDetail #oldFileName').val(res.EMP_FACE); 
			}else{
				$('#employeeDetail #empFace').text("사진을 등록해주세요");
			}
			$('#employeeDetail #storeCode2').val(res.STORE_CODE);
			$('#employeeDetail #empNo2').val(res.EMP_NO);
			$('#employeeDetail #deptNo2').val(res.DEPT_NO);
			$('#employeeDetail #empName2').val(res.EMP_NAME);
			$('#employeeDetail #empZipcode2').val(res.EMP_ZIPCODE);
			$('#employeeDetail #empAddress2').val(addressArr[0]);
			$('#employeeDetail #addressDetail2').val(addressArr[1]);
			$('#employeeDetail #empJumin3').val(juminArr[0]);
			$('#employeeDetail #empJumin4').val(juminArr[1]);
			$('#employeeDetail #empTel2').val(res.EMP_TEL);
			$('#employeeDetail #Email3').val(emailArr[0]);
			$('#employeeDetail #Email4').val(emailArr[1]);
			$('#employeeDetail #empJob2').val(res.EMP_JOB);
			$('#employeeDetail #gradeCode2').val(res.GRADE_CODE);
			
			$('#openmodal2').trigger('click');
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
/*리스트 행 클릭 된 행 색변화*/
 
</style>
<div class="viewBody">
	<div class="box1" style="padding: 10px">
		<form name=employeeList id="employeeList">
			<div class="row">
				<div class="col-sm-11">
					<div class="form-group">
							<label for="storeCode" class="col-sm-1 control-label">매장이름</label>
							<div class="col-sm-2">
								<select style="max-height: 30px;width: 100px" name="storeCode" data-placeholder="입력할 매장을 선택하세요" id="searchStore" class="ajax form-control"></select>
							</div>
							<label for="empName" class="col-sm-1 control-label">이름</label>
							<div class="col-sm-1">
								<input type="text" name="empName" class="form-control">
							</div>
							<label for="searchDeptNo" class="col-sm-1 control-label">고용형태</label>
							<div class="col-sm-2">
								<select name="deptNo" class="form-control">
									<option value="">선택하세요</option>
									<option value="10">정직원</option>
									<option value="20">계약직</option>
									<option value="30">단기알바</option>
								</select>
							</div>
							<label for="searchGrade" class="col-sm-1 control-label">직급</label>
							<div class="col-sm-2">
								<select name="gradeCode" class="form-control">
									<option value="">선택하세요</option>
									<option value="1">마스터</option>
									<option value="2">본사관리자</option>
									<option value="3">점장</option>
									<option value="4">사원</option>
								</select>
							</div>
							<button type="button" id="btnSearch" class="btn btn-primary">조회</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="box2">
		<a class="btn btn-xs btn-success" data-toggle="modal" data-target="#modal-employeeWrite"  
		role="button" data-backdrop="static"><i id="openmodal" class="fas fa-edit"></i>인사등록</a>
	<div style="display: none;">
		<a class="btn btn-xs btn-success" data-toggle="modal" data-target="#modal-employeeDetail"  role="button" data-backdrop="static"><i id="openmodal2" class="fas fa-edit"></i>인사수정</a>
	</div>
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

<div id="modal-employeeWrite" class="modal fade" tabindex="-1" role="dialog" 
	 style="display: none; z-index: 1050;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="employeeWrite.jsp" %>
        </div>
    </div>
</div>

<div id="modal-employeeDetail" class="modal fade" tabindex="-1" role="dialog" style="display: none; z-index: 1050;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="employeeDetail.jsp" %>
        </div>
    </div>
</div>
