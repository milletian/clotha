<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css2/style.css' /> "
	type="text/css" />
<link rel="stylesheet" href="<c:url value='/css/view.css'/>">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery-latest.js' />"> </script>
<script type="text/javascript"
	src="<c:url value='/js/jquery.tablesorter.js' />"> </script>

<script type="text/javascript">
$(function() {
	$("table").tablesorter(); 
	$('#btn').click(function() { 
    	$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/account/accountList.do' />",
        	data:$("#frmAccountList").serialize(),
        	dataType:'json',
        	success:function(res){
        		if (res.length > 0) {
        			$("table tbody").html('');
     				$.each(res, function(idx, item) {
     					var dsd ="<tr><td>"+item.accCode+"</td>"
     					+"<td>"+item.accName+"</td>"
     					+"<td>"+item.accAddress+"</td>"
     					+"<td>"+item.accTel+"</td>"
     					+"<td>"+item.accCeo+"</td>"
     					+"<td>"+item.accNo+"</td>"
     					+"<td>"
     					if(item.accIsdeal=='Y'){
     						dsd+="사용";
     					}else{
     						dsd+="미사용";
     					}
     					+"</td>";
     					dsd+="<td>"+item.accUnique+"</td></tr>";
     					 $("table tbody").append(dsd);
     					});
     				}else{
     					$("table tbody").html('');
     				}
        		 $("table").trigger("update"); 
                 return false; 
        	 },
			error: function(xhr, status, error){
				alert("sdsds");
			}
        
   		}); 
	})
})
function popupOpen(acc_Code){

	var popUrl = "<c:url value='/admin/account/accountWrite.do?acc_Code="+acc_Code+" '/>";	//팝업창에 출력될 페이지 URL

	var popOption = "width=800, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"정보입력",popOption);

	}

</script>
<style type="text/css">
</style>
<div class="viewBody">

	<div class="box1" style="padding: 10px">
		<form name=employeeList id="employeeList">
			<b>매장</b> 
			<select>
				<option>선택하세요</option>
				<option>전체</option>
				<option>강남점</option>
				<option>혜화점</option>
				<option>신도림점</option>
				<option>영등포점</option>
			</select>
		</form>
	</div>
	<div class="box2">
		<a href="#" onclick=popupOpen()><i class="fas fa-edit"></i></a> <a
			href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a> <a href="#"><i
			class="fas fa-trash-alt"></i></a>
		<div id="content1">
			<table cellspacing="1" class="tablesorter">
				<colgroup>
					<col style="width:2%;" />
					<col style="width:5%;" />
					<col style="width:5%;" />
					<col style="width:5%;" />
					<col style="width:5%;" />
					<col style="width:15%;" />		
					<col style="width:5%;" />		
					<col style="width:5%;" />		
					<col style="width:5%;" />		
					<col style="width:5%;" />		
					<col style="width:5%;" />		
					<col style="width:5%;" />		
					<col style="width:5%;" />		
					<col style="width:5%;" />		
				</colgroup>
				<thead>
					<tr>
						<th scope="col">체크박스?</th>
						<th scope="col">매장코드</th>
						<th scope="col">직원코드</th>
						<th scope="col">deptno</th>
						<th scope="col">이름</th>
						<th scope="col">주소 + 상세주소</th>
						<th scope="col">주민등록번호</th>
						<th scope="col">전화번호</th>
						<th scope="col">메일</th>
						<th scope="col">사진</th>
						<th scope="col">담당업무</th>
						<th scope="col">입사일</th>
						<th scope="col">퇴사일</th>
						<th scope="col">직급</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
	</div>
</div>




