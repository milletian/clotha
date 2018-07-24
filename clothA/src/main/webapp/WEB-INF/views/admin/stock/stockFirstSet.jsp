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
<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet">
<script src="<c:url value='/js/FileSaver.js' />"></script>
<script src="<c:url value='/js/xlsx.core.min.js' />"></script>
<script src="<c:url value='/js/tableexport.js' /> "></script>

<script type="text/javascript">
$(function() {
	var whorst = 'store';
	var storeOrwh;
	
	$('input[name=whorst]').change(function() {
		whorst = $(this).val();
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
	    					option += item.storeCode;
	    				}else{
	    					option += item.whCode;
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
	})
	
	var liveTableData = $("table").tableExport({
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
	
	$("table").tablesorter(); 
	
	
	
	$('#selSearchSupplier').change(function() { 
		storeOrwh = $(this).val();
    	$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/stock/ajaxStockList.do' />",
        	data:$("#frmStockFirstSet").serialize(),
        	dataType:'json',
        	success:function(res){
        		if (res.length > 0) {
        			$("table tbody").html('');
     				$.each(res, function(idx, item) {
     					var dsd = "<tr><td><input type='text' name='staCode' readonly='readonly' value='"+item.STA_CODE+"'></td>";
     					dsd+= "<td><input type='text' name='pdCode' readonly='readonly' value='"+item.PD_CODE+"' ></td>";
     					dsd+= "<td><input type='text' readonly='readonly' value='"+item.PD_NAME+"' ></td>";
     					dsd+= "<td><input type='text' name='stockQty' value='"+item.STOCK_QTY+"' ></td>";
     					dsd+= "<input type='hidden' name='stockPk' value='"+item.STOCK_PK+"' ></tr>";
 
     					$("table tbody").append(dsd);
     					liveTableData.reset();
     				})	 
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
	
	$("#newRecord").click(function() {
		var dsd = "<tr><td><input type='text' name='staCode' readonly='readonly' value='"+storeOrwh+"'></td>";
			dsd+= "<td><input type='text' readonly='readonly' name='pdCode' ></td>";
			dsd+= "<td><input type='text' readonly='readonly' ></td>";
			dsd+= "<td><input type='number' name='stockQty' ></td>";
			dsd+= "<input type='hidden' name='stockPk' ></tr>";
		$("table tbody").append(dsd);
		$('#selSearchSupplier').attr('disabled','disabled');
		$('input[name=whorst]').attr('disabled','disabled');
	})
	
	$('#addbtn').click(function() {
		renameForModelAttribute();
		console.log($("#frmStockFirstSetting").serialize());
		var sta = $('input[name=stockList[0].staCode]').val();
		var stockQty1 = $('input[name=stockList[0].stockQty]').val();
		alert($("#frmStockFirstSetting").serialize());
		$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/stock/ajaxStockWrite.do' />",
        	data:$("#frmStockFirstSetting").serialize(),
        	/* data:{"stockList[0].staCode" :sta,
        		"stockList[0].stockQty" : stockQty1}, */
        	//dataType:'json',
        	success:function(res){
        		 alert(res);
        	 },
			error: function(xhr, status, error){
				alert(status+","+error);
				
			}
        
   		}); 
	})
	
	
	
})
function renameForModelAttribute() {
    $("#frmStockFirstSetting").each( function (index) {
        $(this).find("input[name=staCode]").attr("name", "stockList[" + index + "].staCode");
        //alert($(this).find("input[name=staCode]").attr("name"));
        $(this).find("input[name=pdCode]").attr("name", "stockList[" + index + "].pdCode");
        $(this).find("input[name=stockQty]").attr("name", "stockList[" + index + "].stockQty");
        $(this).find("input[name=stockPk]").attr("name", "stockList[" + index + "].stockPk");
    })
}

function popupOpen(acc_Code){

	var popUrl = "<c:url value='/admin/account/accountWrite.do?accCode="+acc_Code+" '/>";	//팝업창에 출력될 페이지 URL

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
<form name="frmStockFirstSet" id="frmStockFirstSet">
	<div id="wrap">
			<div>
				<b>구분</b><input type="radio" name="whorst" value="store" checked="checked" id='store'><label for="store">매장</label>
				<input type="radio" name="whorst" value="wh" id='wh'><label for="wh">창고</label>
			</div>
			<div id='selectwhorst'>
				<b>선택</b>
				<select name="staCode" id="selSearchSupplier">
				
				</select>
			</div>
		
	</div>
</form>
	<div id="maincontent">    

		<a href="#" id="newRecord"><i class="fas fa-edit"></i></a>
		<a href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a>
		<a href="#" id="addbtn"><i class="fas fa-trash-alt"></i></a>
		<div id="content1">
			<form name="frmStockFirstSetting" id="frmStockFirstSetting">
			
				<table cellspacing="1" class="tablesorter">             
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
	</div>






