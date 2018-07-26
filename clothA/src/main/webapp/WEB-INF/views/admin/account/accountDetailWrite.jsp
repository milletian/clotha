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
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script>

<script type="text/javascript">
$(function() {
	$("table").tablesorter(); 
	$('#closeWrite').click(function() {
		self.close();
	})
	
	$('#btn').click(function() { 
    	$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/account/accountDetailList.do' />",
        	data:$("#frmAccountDetailList").serialize(),
        	dataType:'json',
        	success:function(res){
        		if (res.length > 0) {
        			$("table tbody").html('');
     				$.each(res, function(idx, item) {
     					var dsd ="<tr><td>"+item.ACCDTCODE+"</td>"
     					+"<td>"+item.ACCCODE+"</td>"
     					+"<td>"+item.ACCDTREGDATE+"</td>"
     					+"<td>"+item.PDCODE+"</td>"
     					+"<td>"+item.PDNAME+"</td>"
     					+"<td>"+item.SIZECODE+"</td>"
     					+"<td>"+item.ACCDTQTY+"</td>"
     					+"<td>"+item.ACCDTINDATE+"</td>"
     					+"<td>"+item.WHCODE+"</td>"
     					+"<td>"+item.ACCNAME+"</td></tr>";
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
	
	$('#searchRegDate').daterangepicker({
		singleDatePicker: true,
	      locale: {
	        format: "YYYY-MM-DD"
	      }
	});
	$('#searchInDate').daterangepicker({
		singleDatePicker: true,
	      locale: {
	        format: "YYYY-MM-DD"
	      }
	});
	
	$('#pdCbtn').click(function() {
		popupOpen();
	})
})
function popupOpen(){

	var popUrl = "<c:url value='/admin/products/productsSearch.do'/>";	//팝업창에 출력될 페이지 URL

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
	<form name="accDetailWritefrm" method="post" action="<c:url value='/admin/account/accountDetailWrite.do' />">
		<label for="searchRegDate">주문일자</label><input type="text" class="searchDate" id="searchRegDate" name="accDtRegdate" readonly="readonly">
		<label for="searchInDate">입고예정일</label><input type="text" class="searchDate" id="searchInDate" name="accDtIndate"><br>
		<label for="whCode">입고될 창고</label><input type="text" id="whCode" name="whCode">
		<input type="button" id="whcbtn" value="창고 검색">
		<label for="pdCode">상품코드</label><input type="text" id="pdCode" name="pdCode">
		<input type="button" id="pdCbtn" value="상품 검색">
		<label for="pdName">상품명</label><input type="text" id="pdName" name="pdName"><Br>
		<input type="hidden" id="accCode" name="accCode" value="acc9">
		<label for="accCode">매입처 코드</label><input type="text" id="accCode" name="accCode">
		<label for="accDtQty">주문수량</label><input type="text" id="accDtQty" name="accDtQty"><br>
		<label for="pdOriginalprice">개당 원가</label><input type="text" id="pdOriginalprice" name="pdOriginalprice">
		<label for="pdSellprice">개당 판매가</label><input type="text" id="pdSellprice" name="pdSellprice">
		<input type="button" id="closeWrite" value="닫기">
		<input type="submit" value="저장">
</form>
</div>
<div id="maincontent">    
	<a href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a>
	<a href="#"><i class="fas fa-trash-alt"></i></a>
	<div id="content1">
		<table cellspacing="1" class="tablesorter">             
		    <thead> 
		        <tr> 
		            <th>구매현황코드</th> 
		            <th>구매처</th> 
		            <th>주문일자</th> 
		            <th>상품코드</th> 
		            <th>상품명</th> 
		            <th>사이즈 코드</th> 
		            <th>주문수량</th> 
		            <th>입고예정일</th> 
		            <th>입고예정창고</th> 
		            <th>구매처명</th> 
		        </tr> 
		    </thead> 
		    <tbody> 
		       
		    </tbody> 
		</table>
	</div>
</div>
