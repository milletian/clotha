<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css2/style.css' /> " type="text/css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type = "text/javascript"  src = "<c:url value='/js/jquery-latest.js' />" > </script>  
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> 

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
#wrap,#maincontent{
	border: 1px solid gray;
	margin: 10px;
	width: 100%;
	background: white;
	text-align: left;
	padding: 15px;
}
</style>
<div id="wrap">
	<form name="frmAccountList" id="frmAccountList">
		<b>사용 여부</b> <input type="radio" id="isall" checked="checked" name="accIsdeal" value="전체"><label for="isall">전체 </label>
		<input type="radio" id="use" name="accIsdeal" value="Y"><label for="use">사용 </label>
		<input type="radio" id="noneuse" name="accIsdeal" value="N"><label for="noneuse">미사용 </label>
		
		검색조건
		<select name="searchCondition"> 
			<option value="acc_Code">구매처코드</option>
			<option value="acc_No">사업자등록번호</option>
			<option value="acc_Name">회사명</option>
		</select>
		
		검색<input type="text" name="searchKeyword">
		
		<input type="button" id="btn" value="거래처 조회">
	</form>
</div>
<div id="maincontent">    
	<a href="#" onclick=popupOpen()><i class="fas fa-edit"></i></a>
	<a href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a>
	<a href="#"><i class="fas fa-trash-alt"></i></a>
	<div id="content1">
		<table cellspacing="1" class="tablesorter">             
		    <thead> 
		        <tr> 
		            <th>매입처코드</th> 
		            <th>회사명</th> 
		            <th>주소</th> 
		            <th>전화번호</th> 
		            <th>대표자 성명</th> 
		            <th>사업자 등록번호</th> 
		            <th>사용 여부</th> 
		            <th>특이사항</th> 
		        </tr> 
		    </thead> 
		    <tbody> 
		       
		    </tbody> 
		</table>
	</div>
</div>





