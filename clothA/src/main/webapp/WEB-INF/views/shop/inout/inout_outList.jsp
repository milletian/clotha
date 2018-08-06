<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css2/style.css' /> "
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript"
	src="<c:url value='/js/jquery.tablesorter.js' />"> </script>
	
<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet">
<script src="<c:url value='/js/FileSaver.js' />"></script>
<script src="<c:url value='/js/xlsx.core.min.js' />"></script>
<script src="<c:url value='/js/tableexport.js' /> "></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<link rel="stylesheet" href="<c:url value='/css/view.css'/>">
<script type="text/javascript">
$(function() { 
	var inoutCode;
	var liveTableData = $("#frmwarehousingtableOut").tableExport({
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
	
	$("#frmwarehousingtableOut").tablesorter(); 
	
	
	
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/products/ajaxProductsName.do' />",
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$("#selSearchProducts").html('');
    			var option1 = "<option value=''>전체</option>";
    			$("#selSearchProducts").append(option1);
    			$.each(res,function(idx, item){
    				var option2 ="<option value='"+item.pdCode+"'>";
    				option2 += item.pdName;
    				option2 += "</option>";
        			$("#selSearchProducts").append(option2);
    			})
    		}else{
    			$("#selSearchProducts").html('');
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
	});//ajex
	
	
	
	$('#btnSearch').click(function() { 
	$.ajax({
    	type:"POST",
    	url : "<c:url value='/admin/inout/ajaxinout_standby.do' />",
    	data:$("#frmwarehousingList").serialize(),
    	dataType:'json',
    	success:function(res){
    		alert(res.length);
    		if (res.length > 0) {
    			$("#frmwarehousingtableOut tbody").html('');
 				$.each(res, function(idx, item) {
 					var inoutList ="<tr class='center'><td>"+item.INOUT_CODE+"</td>"
 					+"<td>"+item.IS_IN+"</td>"
 					+"<td>"+item.INOUT_STARTDATE+"</td>"
 					+"<td>"+item.INOUT_ENDDATE+"</td>"
 					+"<td>"+item.WH_NAME+"</td>"
 					+"<td>"+item.STORE_NAME+"</td>"
 					+"<td>"+item.ACC_NAME+"</td>"
 					+"<td>"+item.PD_CODE+"</td>" 
 					+"<td>"+item.PD_NAME+"</td>"
 					+"<td>"+item.INOUT_DETAIL_QTY+"</td>"
 					+"<td>"+item.OUT_DETAIL+"</td>"
 					+"</tr>";
 					 $("#frmwarehousingtableOut tbody").append(inoutList);
 					});
 				}else{
 					$("#frmwarehousingtableOut tbody").html('해당 반품내역이 없습니다.');
 				}
    		 $("#frmwarehousingtableOut").trigger("update"); 
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
                alert('Unknow Error.n'+x.responseText); } 
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
	  
	  $(document ).on( "click" , "#frmwarehousingtableOut tbody tr", function() {              
			$('#frmwarehousingtableOut tbody tr td').removeClass('bg-primary');
			$(this).find('td').addClass('bg-primary');
			inoutCode=$(this).find('td:first').text();        
			
			
	    });
});// document
function returnValueRead(str) {
	var reval = window.returnValue;
	if(str=='wh'){
		if(reval!=null&& reval!=''){
			$('#inoutWritefrm #whName').val(reval.whName);
			$('#inoutWritefrm #areaEnd').val(reval.staCode);
			window.returnValue=null;
		}
	}
}
</script>
<style type="text/css">
table.tablesorter tbody td.bg-primary{
		background-color: skyblue;
	}
</style>
<div class="viewBody">
		<div id="wrap" class="box1">
			<form name="frmwarehousingList" id="frmwarehousingList">
				<label>기간</label><i class="fa fa-calendar"></i>
				<input type="text" name="searchDateRange" id="searchDateRange">
				<input type="hidden" name="isIn" id="isIn" value="반품">
				
 				
 				<label for="selSearchProducts">상품코드/명</label>
				<select style="max-height: 30px; width: 100px" name="pdCode"
					data-placeholder="검색할 상품명/코드를 선택하세요" id="selSearchProducts"
					class="ajax">
				</select>
				
				<button type="button" id="btnSearch">
					<i class="fa fa-lg fa-search"></i>&nbsp;조회(F2)
				</button>
			</form>
		</div>
		<div id="maincontent" class="box2"> 
		<a data-toggle="modal" data-target="#modal-outWrite" role="button" data-backdrop="static">
		 <span class="btn btn-xs btn-success">반품 신청 등록</span>
		</a>
		<a href="#" class="btn btn-xs btn-success"><i class="fas fa-trash-alt"></i>삭제</a>
				<div id="content1">
					<table id="frmwarehousingtableOut" cellspacing="1" class="tablesorter">
						<thead>
							<tr  id="center">
								<th>번호</th>
								<th>작업구분</th>
								<th>반품일자</th>
								<th>도착예정일</th>
								<th>출발지</th>
								<th>매장명</th>
								<th>매입처</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>수량</th>
								<th>반품사유</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</form>
		</div>
</div>


 
 
<div id="modal-outWrite" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none; z-index: 1050;" >
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="inoutWrite.jsp" %>
        </div>
    </div>
</div>

<div id="modal-searchPd" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none; z-index: 1060;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="../../admin/products/productsSearch.jsp" %>
        </div>
    </div>
</div>


<div id="modal-searchWh" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none; z-index: 1060;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="../../admin/warehouse/warehouseSearch.jsp" %>
        </div>
    </div>
</div>
