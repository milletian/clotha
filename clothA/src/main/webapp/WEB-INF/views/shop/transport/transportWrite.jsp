<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>



<div class="modal-header">
<script type="text/javascript">
$(function() {
	var storeCode = '${storeCode}';
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/store/ajaxStoreOne.do' />",
    	data:{"storeCode" : storeCode},
    	dataType:'json',
    	success:function(res){
    		$('#transportWritefrm #storeName2').val(res.storeName);
    		$('#transportWritefrm #storeCode2').val(res.storeCode);
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
	});
	
	
	$('#pdCode').change(function() {
		changeLimit();
	})
	
	$('#submit').click(function() {
		var bool =true;
		if(bool){
			$('#transportWritefrm input[type=text]').each(function() {
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
				data:$("#transportWritefrm").serialize(),
				dataType:"text",
				success:function(res){
					alert(res);
					$('#btntransportWriteClose').trigger('click');
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
    		  "staCode" : $('#staCode').val()},
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
	});
}
function pdStockView(storecode) {
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/store/ajaxStoreSelectStock.do' />",
    	data:{"storeCode" : storecode},
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$("#pdCode").html('');
    			$.each(res,function(idx, item){
    				var option2 ="<option value='"+item.PD_CODE+"'>";
    				option2 += item.PD_NAME+"- 남은수량 :"+item.STOCK_QTY;
    				option2 += "</option>";
        			$("#pdCode").append(option2);
    			})
    		}else{
    			$("#pdCode").html('');
    		}
    		changeLimit();
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
    <h3 class="smaller lighter blue no-margin modal-title">간단 점간이동 신청</h3>
</div>
 
<div class="modal-body">
   <div id="wrap">
	<form name="transportWritefrm" id="transportWritefrm" method="post">
		<label for="storeName">요청할 매장</label><input type="text" id="storeName" name="storeName" readonly="readonly">
		
		<input type="hidden" id="storeCode" name="storeCode">
		<input type="hidden" id="staCode" name="staCode">
		
		<input type="button" id="storecbtn" value="매장 검색">
		<label for="pdCode">요청 상품</label>
		<select id="pdCode" name="pdCode">
		
		</select>
		<label for="quantity">수량</label><input type="text" id="quantity" name="quantity"><br>
		
		<label for="storeName2">요청 매장</label><input type="text" name="storeName2" id="storeName2">
		<input type="hidden" name="storeCode2" id="storeCode2">
		<input type="hidden" id="limitQty">
		
	</form>
	</div>
	             
	<a data-toggle="modal"  data-target="#modal-searchStore" role="button" data-backdrop="static">
	 <span class="btn btn-xs btn-success">검색</span>
	</a>                     
</div>
 
<div class="modal-footer">
    <span class="btn btn-sm btn-success" id="submit">
        저장<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btntransportWriteClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>


