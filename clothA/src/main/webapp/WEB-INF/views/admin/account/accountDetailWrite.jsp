<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>



<div class="modal-header bg-primary">
<script type="text/javascript">
$(function() {
	$("#WriteDetailtable").tablesorter(); 
	
	
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
			dataType:"text",
			success:function(res){
				alert("등록성공!!");
				$('#btnAccountDetailClose').trigger('click');
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
	.row {
	        margin: 10px;
	}

</style>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title">검수정보 등록</h3>
</div>
 
<div class="modal-body">
   <div id="wrap">
	<form name="accDetailWritefrm" id="accDetailWritefrm" method="post" action="<c:url value='/admin/account/accountDetailWrite.do' />">
	   <div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<label for="searchRegDate" class="col-sm-4 control-label">주문일자</label>
						<div class="col-sm-8">
							<input type="text" class="form-control searchDate" id="searchRegDate" name="accDtRegdate">
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label for="searchInDate" class="col-sm-4 control-label">입고예정일</label>
						<div class="col-sm-8">
							<input type="text" class="form-control searchDate" id="searchInDate" name="accDtIndate">
						</div>
					</div>
				</div>
		</div>
		
	   <div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<label for="whCode" class="col-sm-4 control-label">입고될 창고</label>
						<div class="col-sm-8">
							<input type="text" id="whCode" class="form-control" name="whCode" readonly="readonly">
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<div class="col-sm-8">
							<input type="button" id="whcbtn" class="btn btn-primary" value="창고 검색">
						</div>
					</div>
				</div>
		</div>
	   <div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<label for="pdCode" class="col-sm-4 control-label">상품코드</label>
						<div class="col-sm-8">
							<input type="text" id="pdCode" class="form-control" name="pdCode" readonly="readonly">
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<div class="col-sm-8">
							<input type="button" id="pdCbtn" class="btn btn-primary"  value="상품 검색">
						</div>
					</div>
				</div>
		</div>
		
	   <div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<label for="pdName"  class="col-sm-4 control-label">상품명</label>
						<div class="col-sm-8">
							<input type="text" id="pdName" name="pdName" class="form-control"  readonly="readonly">
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label for="accName" class="col-sm-4 control-label">매입처 이름</label>
						<div class="col-sm-8">
							<input type="text" id="accName" class="form-control" name="accName" readonly="readonly">
						</div>
					</div>
				</div>
		</div>
		
	   <div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<label for="accDtQty" class="col-sm-4 control-label">주문수량</label>
						<div class="col-sm-8">
							<input type="text" id="accDtQty" name="accDtQty" class="form-control">
						</div>
					</div>
				</div>
		</div>
		
	   <div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<label for="pdOriginalprice" class="col-sm-4 control-label">개당 원가</label>
						<div class="col-sm-8">
							<input type="text" id="pdOriginalprice" name="pdOriginalprice" class="form-control" readonly="readonly">
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<label for="pdSellprice" class="col-sm-4 control-label">개당 판매가</label>
						<div class="col-sm-8">
							<input type="text" id="pdSellprice" name="pdSellprice" class="form-control" readonly="readonly">
						</div>
					</div>
				</div>
		</div>
		
		
		<input type="hidden" id="staCode" name="staCode" readonly="readonly">
		<input type="hidden" id="accCode" name="accCode">
		
		<br>
		
		
		
	</form>
	</div>
	<div id="maincontent">
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
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnAccountDetailClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>


