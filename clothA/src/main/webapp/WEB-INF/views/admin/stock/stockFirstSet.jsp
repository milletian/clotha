<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css2/style.css' /> " type="text/css" />
<link rel="stylesheet" href="<c:url value='/css/view.css' /> " type="text/css" /> <!-- 만든 view css  -->

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> 

<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet">

<script src="<c:url value='/js/FileSaver.js' />"></script>
<script src="<c:url value='/js/xlsx.core.min.js' />"></script>
<script src="<c:url value='/js/tableexport.js' /> "></script>
<script src="<c:url value='/js/jquery.form.min.js' /> "></script>


<script type="text/javascript">
	var storeOrwh;
$(function() {
	var whorst = 'store';
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
	    			$("#selSearchSupplier").html('');
	    			$.each(res,function(idx, item){
	    				var option = "<option value='"+item.staCode+"'>";
	    				if(whorst=="store"){
	    					option += item.storeName;
	    				}else{
	    					option += item.whName;
	    				}
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
	}
	$('input[name=whorst]').change(function() {
		whorst = $(this).val();
		$.changeOption(whorst);
		storeOrwh = $("#selSearchSupplier").val();
	})
	
	
	$("#stockFirstSetTable").tablesorter(); 
	
	
	$('#selSearchSupplier').change(function() { 
		storeOrwh = $(this).val();
    	$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/stock/ajaxStockList.do' />",
        	data:$("#frmStockFirstSet").serialize(),
        	dataType:'json',
        	success:function(res){
        		if (res.length > 0) {
        			$("#stockFirstSetTable tbody").html('');
        			var dsd ="";
     				$.each(res, function(idx, item) {
     					dsd += "<tr><td><input type='text' name='staCode' readonly='readonly' value='"+item.STA_CODE+"'></td>";
     					dsd+= "<td><input type='text' name='pdCode' readonly='readonly' value='"+item.PD_CODE+"' ></td>";
     					dsd+= "<td><input type='text' readonly='readonly' value='"+item.PD_NAME+"' ></td>";
     					dsd+= "<td><input type='text' name='stockQty' value='"+item.STOCK_QTY+"' ></td>";
     					dsd+= "<input type='hidden' name='stockPk' value='"+item.STOCK_PK+"' ></tr>";
 
     					
     				})	 
     				$("#stockFirstSetTable tbody").append(dsd);
 					renameForModelAttribute();
     			}else{
     				$("#stockFirstSetTable tbody").html('');
     			}
        		 $("#stockFirstSetTable").trigger("update"); 
                 return false; 
        	 },
			error: function(xhr, status, error){
				alert("sdsds");
			}
        
   		}); 
	})
	
	$("#newRecord").one('click',function() {
		//storeOrwh = $('#selSearchSupplier').val();
		newRecord();
		$('#selSearchSupplier').attr('disabled','disabled');
		$('input[name=whorst]').attr('disabled','disabled');
	})
	
	$('#addbtn').click(function() {
		renameForModelAttribute();
		
		$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/stock/ajaxStockWrite.do' />",
        	data:$("#frmStockFirstSetting").serialize(),
        	dataType:"text",
        	success:function(res){
        		 alert(res);
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
	})
	$.changeOption(whorst);
	/* $('#pdCodeSearch')on('click',function(){
		
	}) */
	
	storeOrwh = $('#selSearchSupplier').val();
})

function renameForModelAttribute() {
    $("#frmStockFirstSetting table tbody tr").each( function (index) {
        $(this).find("input[name=staCode]").attr("name", "stockList[" + index + "].staCode");
        $(this).find("input[name=pdCode]").attr("name", "stockList[" + index + "].pdCode");
        $(this).find("input[name=stockQty]").attr("name", "stockList[" + index + "].stockQty");
        $(this).find("input[name=stockPk]").attr("name", "stockList[" + index + "].stockPk");
    })
}

function newRecord() {
	$('#pdCodeSearch').remove();
	var dsd = "<tr><td><input type='text' name='staCode' readonly='readonly' value='"+storeOrwh+"'></td>";
	dsd+= "<td><input type='text' readonly='readonly' name='pdCode' ><input type='button' id='pdCodeSearch' data-toggle='modal' data-target='#modal-searchPd' role='button' data-backdrop='static' value='..' /></td>";
	dsd+= "<td><input type='text' readonly='readonly' value=' ' ></td>";
	dsd+= "<td><input type='text' name='stockQty' value='0' ></td>";
	dsd+= "<input type='hidden' name='stockPk' value='0' ></tr>";
	$("#stockFirstSetTable tbody").append(dsd);
	renameForModelAttribute();
}


function checkFileType(filePath){
	var fileFormat = filePath.split(".");
	if(fileFormat.indexOf("xls") > -1){
		return true;
	}else if(fileFormat.indexOf("xlsx") > -1){
		return true;
	}else{
		return false;
	}
}

function check(){
	var file = $("#excel").val();
	if(file == "" || file == null){
		alert("파일을 선택");
		return false;
	}else if(!checkFileType(file)){
		alert("엑셀 파일만 업로드");
		return false;
	}
	var fileFormat = file.split(".");
	var fileType = fileFormat[1];
	if(confirm("업로드 하시겠습니까?")){
		$("#excelUpForm").attr("action","<c:url value='/admin/stock/ajaxStockExcelUpload.do' />");
		var options = {
			success:function(data){
				alert("업로드 완료");
			},
			type: "POST",
			data : {"excelType" : fileType}
		};
		$("#excelUpForm").ajaxSubmit(options);
	}
}
function returnValueRead(str) {
	var reval = window.returnValue;
	if(str=='pd'){
		if(reval!=null&& reval!=''){
			var bool=true;
			$('#stockFirstSetTable tr').each(function() {
				if($(this).find('td:eq(1) input[type=text]').val()==reval.pdCode){
					alert('동일한 상품을 중복등록할수 없습니다.');
					bool=false;
					return false;
				}
			})
			if(bool){
				$('#stockFirstSetTable tr:last td:eq(1) input[type=text]').val(reval.pdCode);
				$('#stockFirstSetTable tr:last td:eq(2) input[type=text]').val(reval.pdName);
				newRecord();
			}
				window.returnValue=null;
		}
	}
}
/* function returnValueRead(str) {
	var reval = window.returnValue;
	if(str=='pd'){
		if(reval!=null&& reval!=''){
			var bool
			$('#stockFirstSetTable tr').each
			window.returnValue=null;
		}
	}
} */
</script>
<style type="text/css">
</style>
<div class="viewBody">
	<div class="box1">
	<form name="frmStockFirstSet" id="frmStockFirstSet">
		<div class="row">
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
				<div class="form-group" id='selectwhorst'>
					<label for="selSearchSupplier" class="col-sm-3 control-label">선택</label>
					<div class="col-sm-7">
						<select name="staCode" id="selSearchSupplier" class="form-control">
						</select>
					</div>
				</div>
			</div>
		</div>
		
	</form>
<form id="excelUpForm" method="post" action="" role="form" enctype="multipart/form-data">
	<input id="excel" name="excel" class="file" type="file" multiple data-show-upload="false" data-show-caption="true">
	<button type="button" id="excelUp" onclick="check()">등록</button>
</form>
	<a class="btn btn-xs btn-success" href="#" id="newRecord"><i class="fas fa-edit"></i>새 재고 등록</a>
	<a class="btn btn-xs btn-success" href="#" id="addbtn"><i class="fas fa-edit"></i>최종 등록</a>
	</div><!--box1 -->
	<div class="box2">
		<form name="frmStockFirstSetting" id="frmStockFirstSetting">
			<table id="stockFirstSetTable" cellspacing="1" class="tablesorter">             
			    <thead> 
			        <tr> 
			            <th>재고위치ID</th> 
			            <th>상품코드</th> 
			            <th>상품명</th> 
			            <th>수량</th> 
			        </tr> 
			    </thead> 
			    <tbody> 
			    </tbody> 
			</table>
		</form>
	</div>
</div><!--biewBody-->
 
<div id="modal-searchPd" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="../products/productsSearch.jsp" %>
        </div>
    </div>
</div>
