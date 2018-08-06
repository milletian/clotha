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
					<label for="colorCode" class="col-sm-3 control-label">색상</label>
					<div class="col-sm-7">
						<select id="colorCode" class="form-control" name="colorCode">
							<option value="">선택</option>
							<option value="69">navy</option>
							<option value="89">black</option>
							<option value="00">white</option>
							<option value="04">pink</option>
							<option value="32">beige</option>
							<option value="67">blue</option>
							<option value="05">red</option>
							<option value="88">gray</option>
							<option value="25">yellow</option>
							<option value="99">gold</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="col-sm-2">
				<div class="form-group">
					<label for="styleCode" class="col-sm-3 control-label">스타일</label>
					<div class="col-sm-7">
						<select id="styleCode" class="form-control"  name="styleCode">
							<option value="">선택</option>
							<option value="S">셔츠</option>
							<option value="O">원피스</option>
							<option value="T">티셔츠</option>
							<option value="K">치마/스커트</option>
							<option value="P">바지</option>
							<option value="U">아우터</option>
							<option value="E">기타</option>
						</select>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="form-group">
					<label for="sizeCode" class="col-sm-3 control-label">사이즈</label>
					<div class="col-sm-7">
						<select id="sizeCode" class="form-control"  name="sizeCode">
							<option value="">선택</option>
							<option value="XS">85</option>
							<option value="S">90</option>
							<option value="M">95</option>
							<option value="L">100</option>
							<option value="XL">105</option>
						</select>
					</div>
				</div>
			</div>
			
		</div>
		
	</form>
</div>

<canvas id="myChart" width="400" height="400"></canvas>
<script>
var ctx = document.getElementById("myChart").getContext('2d');
$(function() {
	var storeCode = '${storeCode}';
	$('select').change(function() {
		$.ajax({
			type:"POST",
	    	url : "<c:url value='/admin/store/ajaxStoreOne.do' />",
	    	data:{"storeCode" : storeCode},
	    	dataType:'json',
	    	success:function(res){
	    		chart(res.staCode);
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
	
})
function chart(stacode) {
	$.ajax({
		url:"<c:url value='/admin/stock/ajaxSearchStockList.do' />",
		dataType:'json',
		data:{"staCode":stacode,
			"colorCode":$('#colorCode').val(),
			"styleCode":$('#styleCode').val(),
			"sizeCode":$('#sizeCode').val()},
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


 
 



