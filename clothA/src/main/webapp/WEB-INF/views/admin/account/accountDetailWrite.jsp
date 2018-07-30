<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>



<div class="modal-header">
<script type="text/javascript">
$(function() {
	$("#WriteDetailtable").tablesorter(); 
	$('#closeWrite').click(function() {
		self.close();
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
		popupOpen('pd');
	})
	
	$('#whcbtn').click(function() {
		popupOpen('wh');
	})
	$('#submit').click(function() {
		$.ajax({
			type:"POST",
			url:"<c:url value='/admin/account/ajaxAccountDetailWrite.do' />",
			data:{"accDtRegdate":$('#searchRegDate').val(),
				"accDtIndate":$('#searchInDate').val(),
				"whCode":$('#whCode').val(),
				"staCode":$('#staCode').val(),
				"accCode":$('#accCode').val(),
				"accDtQty":$('#accDtQty').val(),
				"pdCode":$('#pdCode').val()
				},
			dataType:"json",
			success:function(res){
				alert(res);
				self.close();
			},
			error:function(xhr, status, error){
				alert("sdsds");
			}
		})
	})
})

function ajaxStockByStaCode() {
	if($('#staCode').val()!=null && $('#staCode').val()!=''){
		$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/stock/ajaxSearchStockList.do' />",
        	data:{"staCode":$('#staCode').val()},
        	dataType:'json',
        	success:function(res){
        		if (res.length > 0) {
        			$("#WriteDetailtable tbody").html('');
     				$.each(res, function(idx, item) {
     					var dsd ="<tr><td>"+item.PD_CODE+"</td>"
     					+"<td>"+item.PD_NAME+"</td>"
     					+"<td>"+item.STOCK_QTY+"</td>"
     					+"<td>"+item.PD_ORIGINALPRICE+"</td>"
     					+"<td>"+item.PD_SELLPRICE+"</td>"
     					+"<td>"
     					if(item.PD_DEL=='Y'){
     						dsd+="사용";
     					}else{
     						dsd+="미사용";
     					}
     					+"</td>";
     					 $("#WriteDetailtable tbody").append(dsd);
     					liveTableData.reset();
     					});
     				}else{
     					$("#WriteDetailtable tbody").html('');
     				}
        		 $("#WriteDetailtable").trigger("update"); 
                 return false; 
        	 },
			error: function(xhr, status, error){
				alert("sdsds");
			}
        
   		}); 
	}
}

function popupOpen(str){
	var popOption = "width=800, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	if(str=='pd'){
		var popUrl = "<c:url value='/admin/products/productsSearch.do'/>";	//팝업창에 출력될 페이지 URL
		window.open(popUrl,"상품조회",popOption);
	}else{
		var popUrl = "<c:url value='/admin/warehouse/warehouseSearch.do'/>";	//팝업창에 출력될 페이지 URL		
		window.open(popUrl,"창고조회",popOption);
	}



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
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title">검수정보 등록</h3>
</div>
 
<div class="modal-body">
   <div id="wrap">
	<form name="accDetailWritefrm" id="accDetailWritefrm" method="post" action="<c:url value='/admin/account/accountDetailWrite.do' />">
		<label for="searchRegDate">주문일자</label><input type="text" class="searchDate" id="searchRegDate" name="accDtRegdate">
		<label for="searchInDate">입고예정일</label><input type="text" class="searchDate" id="searchInDate" name="accDtIndate"><br>
		<label for="whCode">입고될 창고</label><input type="text" id="whCode" name="whCode" readonly="readonly">
		<input type="hidden" id="staCode" name="staCode" readonly="readonly">
		<input type="button" id="whcbtn" value="창고 검색">
		<label for="pdCode">상품코드</label><input type="text" id="pdCode" name="pdCode" readonly="readonly">
		<input type="button" id="pdCbtn" value="상품 검색">
		<label for="pdName">상품명</label><input type="text" id="pdName" name="pdName" readonly="readonly"><Br>
		<input type="hidden" id="accCode" name="accCode">
		<label for="accName">매입처 이름</label><input type="text" id="accName" name="accName" readonly="readonly">
		<label for="accDtQty">주문수량</label><input type="text" id="accDtQty" name="accDtQty"><br>
		<label for="pdOriginalprice">개당 원가</label><input type="text" id="pdOriginalprice" name="pdOriginalprice" readonly="readonly">
		<label for="pdSellprice">개당 판매가</label><input type="text" id="pdSellprice" name="pdSellprice" readonly="readonly">
		
	</form>
	</div>
	<div id="maincontent">    
		<a href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a>
		<a href="#"><i class="fas fa-trash-alt"></i></a>
		<div id="content1">
			<table id="WriteDetailtable" cellspacing="1" class="tablesorter">             
			    <thead> 
			        <tr> 
			            <th>상품코드</th> 
			            <th>상품명</th> 
			            <th>재고 수량</th> 
			            <th>구매가</th> 
			            <th>판매가</th>
			            <th>사용 여부</th> 
			        </tr> 
			    </thead> 
			    <tbody> 
			       
			    </tbody> 
			</table>
		</div>
	</div>
	
	<a data-toggle="modal"  data-target="#modal-searchPd" role="button" data-backdrop="static">
	 <span class="btn btn-xs btn-success">상품검색</span>
	</a>
	
	<a data-toggle="modal"  data-target="#modal-searchWh" role="button" data-backdrop="static">
	 <span class="btn btn-xs btn-success">창고검색</span>
	</a>                     
</div>
 
<div class="modal-footer">
    <span class="btn btn-sm btn-success" id="submit">
        저장<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>


