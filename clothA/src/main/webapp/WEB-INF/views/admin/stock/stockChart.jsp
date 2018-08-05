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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

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
	
	
	$.changeOption(whorst);
})

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
		
		
	</form>
</div>

<canvas id="myChart" width="400px" height="400px"></canvas>
<script>
var ctx = document.getElementById("myChart").getContext('2d');
$(function() {
	$('#selectwhorst').change(function() {
		var stacode=$(this).val();
		chart(stacode);
	})
})
function chart(stacode) {
	$.ajax({
		url:"<c:url value='/admin/stock/ajaxSearchStockList.do' />",
		dataType:'json',
		data:{"staCode":stacode},
		success:function(res){
			var labelArr = new Array;
			var dataArr = new Array;
			var bgCArr = new Array;
			var bdCArr = new Array;
			$.each(res,function(idx, item){
				labelArr.push(item.PD_NAME);
				dataArr.push(item.STOCK_QTY);
			})
			for (var i = 0; i < labelArr.length; i++) {
				var r = Math.floor(Math.random() * 255) + 1;
				var g = Math.floor(Math.random() * 255) + 1;
				var b = Math.floor(Math.random() * 255) + 1;
				bgCArr.push('rgba('+r+','+g+','+b+', 0.2)');
				bdCArr.push('rgba('+b+','+r+','+g+', 0.2)');
			}
			var myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels:labelArr,
			        datasets: [{
			            label: '수량',
			            data: dataArr,
			            backgroundColor:
			            	bgCArr
			           	,
			            borderColor: 
			            	bdCArr
			            ,
			            borderWidth: 2
			        }]
			    },
			    options: {
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        }
			    }
			});
		},
		error: function(xhr, status, error){
			alert("sdsds");
		}
	})
}

</script>


 
 



