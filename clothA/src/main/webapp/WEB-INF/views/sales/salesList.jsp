<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>" ></script>
<link rel="stylesheet"	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<script type="text/javascript"	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" href="<c:url value='/css2/style.css' /> " type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<link rel="stylesheet"	href="<c:url value='/css/view.css'/>">
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> 
<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet">
<script src="<c:url value='/js/FileSaver.js' />"></script>
<script src="<c:url value='/js/xlsx.core.min.js' />"></script>
<script src="<c:url value='/js/tableexport.js' /> "></script>
<script type="text/javascript" >
	$(document).ready(function(){
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
		
		$.ajax({
			type:"POST",
	    	url : "<c:url value='/admin/store/ajaxStoreList.do' />",
	    	dataType:'json',
	    	success:function(res){
	    		if (res.length > 0){
	    			$("#selSearchStoreName").html('');
	    			var option1 = "<option value=''>전체</option>";
	    			$("#selSearchStoreName").append(option1);
	    			$.each(res,function(idx, item){
	    				var option2 ="<option value='"+item.storeCode+"'>";
	    				option2 += item.storeName;
	    				option2 += "</option>";
	        			$("#selSearchStoreName").append(option2);
	    			})
	    		}else{
	    			$("#selSearchStoreName").html('');
	    		}
	    	},
	    	error: function(xhr, status, error){
				alert("페이지 오류 :: 다시시도해 주세요");
			} 
		});//ajex 매장
		
		$("#btnSearch").click(function(){
			$.ajax({
				type:"POST",
				url : "<c:url value='/sales/ajaxSalesList.do'/>",
				dataType:'json',
				success:function(res){
					if(res.length > 0){
						$.each(res, function(idx, item) {
		 					var salesList ="<tr><td>"+item.salesDate+"</td>"
		 					+"<td>"+item.salesDate+"</td>"
		 					+"<td>"+item.storeName+"</td>"
		 					+"<td>"+item.salesTotal+"</td>"
		 					+"</tr>";
		 					$("table tbody").append(salesList);
		 					liveTableData.reset();
	 					});
						
					}else{
	 					$("table tbody").append("<tr><td colspan='4'>해당 내역이 없습니다.</td></tr>")
	 				}
					$("#frmwarehousingtable").trigger("update"); 
	             	return false;
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
		     				alert('Unknow Error.n'+x.responseText);
		     			} 
		     	}
			
			});
			
		});
		
		
		$(".ajax").select2();
		
		$('#searchDateRange').daterangepicker({
		    autoUpdateInput: false,
		    locale: {
		        cancelLabel: 'Clear'
		    },ranges: {
		        '오늘': [moment(), moment()],
		        '어제': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
		        '1주일': [moment().subtract(6, 'days'), moment()],
		        '30일': [moment().subtract(29, 'days'), moment()],
		        '이번달': [moment().startOf('month'), moment().endOf('month')],
		        '지난달': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		      }
		});
		
		$('#searchDateRange').on('apply.daterangepicker', function(ev, picker) {
		    $(this).val(picker.startDate.format('YYYY/MM/DD') + ' ~ ' + picker.endDate.format('YYYY/MM/DD'));
		});
		
		$('#searchDateRange').on('cancel.daterangepicker', function(ev, picker) {
		    $(this).val('');
		});
		
	});
</script>
<style type="text/css">
	.box1{
	
	padding: 5px;
	background: white;
		
    border-width: 3px 1px 1px;
    border-style: solid;
    border-color: rgb(210, 214, 222);
    border-image: initial;
    border-top: 3px solid rgb(210, 214, 222);
    margin-bottom: 20px;
    height: 60px;
	}
	table tr td{
		text-align: center;
	}

</style>

<div class="viewBody">
	<!-- Main content  -->
	<div class="box1">
		<form name="SearchSales">
			<div class="col-sm-3">
				<div class="form-group">
				<label for="searchDateRange" class="col-sm-3 control-label">기간<i class="fa fa-calendar"></i></label>
					<div class="col-sm-9">
						<input type="text" name="searchDateRange" class="form-control" id="searchDateRange">
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="form-group">
				<label for="selSearchStoreName" class="col-sm-5 control-label">매장</label>
					<div class="col-sm-7">
						<select style="max-height: 30px; width: 100px" name="areaEnd"
								data-placeholder="검색할 매장을 선택하세요" id="selSearchStoreName"
								class="ajax">
						</select>		
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group">
					<div class="col-sm-5">
						<button type="button" id="btnSearch" class="btn btn-primary">
							<i class="fa fa-lg fa-search"></i>&nbsp;조회(F2)
						</button>							
					</div>
				</div>
			</div>
		</form>
	</div>
	<div>
		<table class="tablesorter">
			<thead>
				<tr>
					<th>날짜</th>
					<th>시간</th>
					<th>매장</th>
					<th>판매금액</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</div>


