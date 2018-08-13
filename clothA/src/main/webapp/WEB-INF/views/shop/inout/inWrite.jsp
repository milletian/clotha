<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>



<div class="modal-header">
<script type="text/javascript">
$(function() {
	
	
	$('#inoutStartdate').daterangepicker({
		singleDatePicker: true,
	      locale: {
	        format: "YYYY-MM-DD"
	      }
	});
	$('#inoutEnddate').daterangepicker({
		singleDatePicker: true,
	      locale: {
	        format: "YYYY-MM-DD"
	      }
	});
	$('#areaStart').change(function() {
		changeLimit();
	})
	
	$('#submit').click(function() {
		var bool =true;
		if(bool){
			$('#inoutWritefrm input[type=text]').each(function() {
				if($(this).val().replace(/ /gi, "")==''){
					bool=false;
					alert($(this).prev().text()+"는 필수 입력사항입니다.");
					return false;
				}
			})
		}
		if(bool){
			if($('#limitQty').val()<$('#inoutDetailQty').val()){
				bool=false;
				alert("주문 개수는 해당 창고의 재고수량을 넘을수 없습니다.");
				return false;
			}
		}
		if(bool){
			$.ajax({
				type:"POST",
				url:"<c:url value='/admin/inout/ajaxInOutWrite.do' />",
				/* data:{"inoutStartdate":$('#inoutStartdate').val(),
					"inoutEnddate":$('#inoutEnddate').val(),
					"areaStart":$('#areaStart').val(),
					"areaEnd":$('input[name=areaEnd]').val(),
					"pdCode":$('#pdCode').val(),
					"inoutStatus":$('#inoutStatus').val(),
					"isIn":$('#isIn').val(),
					"inoutDetailQTY":$('#inoutDetailQty').val()
					}, */
				data:$("#inoutWritefrm").serialize(),
				dataType:"text",
				success:function(res){
					alert(res);
					$('#btnInoutWriteClose').trigger('click');
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
	})
	
})
function changeLimit() {
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/stock/ajaxStockList.do' />",
    	data:{"pdCode" : $('#pdCode').val(),
    		  "staCode" : $('#areaStart').val()},
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$("#limitQty").val('');
    			$.each(res,function(idx, item){
    				$("#limitQty").val(item.STOCK_QTY);
    			})
    		}else{
    			$("#limitQty").val('');
    		}
    	},
    	error: function(xhr, status, error){
			alert("sdsds");
		} 
	});
}
function whView() {
	var pdcode = $('#pdCode').val();
	
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/warehouse/ajaxWarehouseListBypdQty.do' />",
    	data:{"pdCode" : pdcode},
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$("#areaStart").html('');
    			$.each(res,function(idx, item){
    				var option2 ="<option value='"+item.STA_CODE+"'>";
    				option2 += item.WH_NAME+"- 남은수량 :"+item.STOCK_QTY;
    				option2 += "</option>";
        			$("#areaStart").append(option2);
    			})	
    			$('#areaStartDiv').css('display','');
        		changeLimit();
    		}else{
    			alert("상품을 가지고 있는 창고가 없습니다.");
    			$("#areaStart").html('');
    		}
    		
    	},
    	error: function(xhr, status, error){
			alert("sdsds");
		} 
	});//ajex 매장
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
    <h3 class="smaller lighter blue no-margin modal-title">매장입고 등록</h3>
</div>
 
<div class="modal-body">
   <div id="wrap">
	<form name="inoutWritefrm" id="inoutWritefrm" method="post">
		<label for="inoutStartdate">출발날짜</label><input type="text" class="searchDate" id="inoutStartdate" name="inoutStartdate">
		<label for="inoutEnddate">입고예정일</label><input type="text" class="searchDate" id="inoutEnddate" name="inoutEnddate"><br>
		<label for="storeName">입고될 매장</label><input type="text" id="storeName" name="storeName" readonly="readonly">
		
		<input type="hidden" id="areaEnd" name="areaEnd">
		
		<label for="pdCode">상품코드</label><input type="text" id="pdCode" name="pdCode" readonly="readonly">
		<a data-toggle="modal"  data-target="#modal-searchPd" role="button" data-backdrop="static">
			 <span class="btn btn-xs btn-success">상품검색</span>
		</a>
		<label for="pdName">상품명</label><input type="text" id="pdName" name="pdName" readonly="readonly">
		<label for="inoutDetailQty">수량</label><input type="text" id="inoutDetailQty" name="inoutDetailQTY"><br>
		<div id="areaStartDiv" style="display: none;">
			<label for="areaStart">출발 창고</label>
			<select id="areaStart" name="areaStart">
			
			</select>
			<input type="hidden" id="limitQty">
		</div>
		<input type="hidden" id="inoutStatus" name="inoutStatus" value="승인대기">
		<input type="hidden" id="isIn" name="isIn" value="입고">
		
	</form>
	</div>
	
	
	
	       
	                       
</div>
 
<div class="modal-footer">
    <span class="btn btn-sm btn-success" id="submit">
        저장<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnInoutWriteClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>


