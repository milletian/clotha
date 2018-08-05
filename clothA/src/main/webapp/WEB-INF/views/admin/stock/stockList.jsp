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
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> 
<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet">
<script src="<c:url value='/js/FileSaver.js' />"></script>
<script src="<c:url value='/js/xlsx.core.min.js' />"></script>
<script src="<c:url value='/js/tableexport.js' /> "></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<script type="text/javascript">
$(function() {
	$("#selSearchSupplier").select2();
	$.changeOption = function(whorst) {
		var url;
		if(whorst=='store'){
			url = "<c:url value='/admin/store/ajaxStoreList.do' />";
		}else{
			url = "<c:url value='/admin/warehouse/ajaxWarehouseList.do' />";
		}
		
		$.ajax({
	    	url : url,
	    	dataType:'json',
	    	success:function(res){
	    		if (res.length > 0){
	    			$("#selectwhorst").html('');
	    			$.each(res,function(idx, item){
	    				var option = "<option value='"+item.staCode+"'>";
	    				if(whorst=="store"){
	    					option += item.storeName;
	    				}else{
	    					option += item.whName;
	    				}
	    				option += "</option>";
	        			$("#selectwhorst").append(option);
	        			$("#selectwhorst").select2();
	    			})
	    		}else{
	    			$("#selectwhorst").html('');
	    		}
	    	},
	    	error: function(xhr, status, error){
				alert("sdsds");
			}
		})
	}
	
	var whorst = 'store';
	var storeOrwh;
	var accCode;
	
	$('input[name=whorst]').change(function() {
		whorst = $(this).val();
		$.changeOption(whorst);
		
	})
	
	var liveTableData = $("#stockListTable").tableExport({
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
	$("#stockListTable").tablesorter(); 
	
	
	
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/account/ajaxAccountList.do' />",
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$("#selSearchSupplier").html('');
    			var option1 = "<option value=''>전체</option>";
    			$("#selSearchSupplier").append(option1);
    			$.each(res,function(idx, item){
    				var option = "<option value='"+item.accCode+"'>";
    				option += item.accName;
    				option += "</option>";
        			$("#selSearchSupplier").append(option);
    			})
    		}else{
    			$("#selSearchSupplier").html('');
    		}
    	},
    	error: function(xhr, status, error){
			alert("sdsds");
		}
	})
	
	
	
	$('#btn').click(function() { 
    	$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/stock/ajaxSearchStockList.do' />",
        	data:$("#frmStockList").serialize(),
        	dataType:'json',
        	success:function(res){
        		if (res.length > 0) {
        			$("#stockListTable tbody").html('');
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
     					 $("#stockListTable tbody").append(dsd);
     					liveTableData.reset();
     					});
     				}else{
     					$("#stockListTable tbody").html('');
     				}
        		 $("table").trigger("update"); 
                 return false; 
        	 },
			error: function(xhr, status, error){
				alert("sdsds");
			}
        
   		}); 
	})
	$.changeOption(whorst);
})
function returnValueRead(str) {
	var reval = window.returnValue;
	if(str=='pd'){
		if(reval!=null&& reval!=''){
			$('#pdCode').val(reval.pdCode);
			window.returnValue=null;
		}
		
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
.row{
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
<div id="wrap">
	<form name="frmStockList" id="frmStockList">
		<div class="row">
			<div class="col-sm-2">
				<div class="form-group">
				<label for="selSearchSupplier" class="col-sm-4 control-label">매입처</label>
					<div class="col-sm-5">
						<select style="max-height: 30px;width: 100px" name="accCode" data-placeholder="검색할 매입처를 선택하세요" id="selSearchSupplier"></select>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="form-group">
					<label class="col-sm-3 control-label">구분</label>
					<div class="col-sm-7">
						<input type="radio" name="whorst" value="store" checked="checked" id='store'><label for="store">매장</label>
						<input type="radio" name="whorst" value="wh" id='wh'><label for="wh">창고</label>
					</div>
				</div>
			</div>
			
			<div class="col-sm-2">
				<div class="form-group">
					<label for="selectwhorst" class="col-sm-3 control-label">선택</label>
					<div class="col-sm-7">
						<select name="staCode" id="selectwhorst">
						</select>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
				<label for="pdCode" class="col-sm-3 control-label">상품 코드</label>
					<div class="col-sm-6">
						<input class="form-control" type="text" name="pdCode" id="pdCode">
					</div>
					<div class="col-sm-3">
						<a data-toggle="modal" data-target="#modal-searchPd" id="searchPdopen" role="button" data-backdrop="static">
						 <span class="btn btn-primary">상품 조회</span>
						</a>
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="form-group">
				<label class="col-sm-3 control-label">상품 사용 여부</label>
					<div class="col-sm-4">
						<input type="radio" id="pdDel" checked="checked" name="pdDel" value="전체"><label for="pdDel">전체 </label>
						<input type="radio" id="use" name="pdDel" value="Y"><label for="use">사용 </label>
						<input type="radio" id="noneuse" name="pdDel" value="N"><label for="noneuse">미사용 </label>
					</div>
					<div class="col-sm-3">
						<input type="button" class="btn btn-primary" id="btn" value="재고현황 조회">
					</div>
				</div>
			</div>
		</div>
		
		
		
	
		
		
		
		
	</form>
</div>
<div id="maincontent">    
	<div id="content1">
		<table id="stockListTable" cellspacing="1" class="tablesorter">             
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



 
 
<div id="modal-searchPd" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="../products/productsSearch.jsp" %>
        </div>
    </div>
</div>



