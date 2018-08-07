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
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet">
<script src="<c:url value='/js/FileSaver.js' />"></script>
<script src="<c:url value='/js/xlsx.core.min.js' />"></script>
<script src="<c:url value='/js/tableexport.js' /> "></script>

<script type="text/javascript">
$(function() {
	var Now = new Date();
	var today = Now.getFullYear()+"/"+(Now.getMonth()+1)+"/"+Now.getDate();
	$('#searchDateRange').val(today+"~"+today);
	var accDtCode;
	$("#searchDetailtable").tablesorter(); 
	// exel다운로드를 위한 변수
	var liveTableData = $("#searchDetailtable").tableExport({
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

	 $('#delbtn').click(function() { 
		if(accDtCode!=undefined){
			if(confirm('정말로 삭제하시겠습니까?')){
		    	$.ajax({
		        	type:"POST",
		        	url : "<c:url value='/admin/account/accountDetailDel.do' />",
		        	data:{"accDtCode":accDtCode},
		        	dataType:'json',
		        	success:function(res){
		        		alert(res);
		        	},
					error: function(xhr, status, error){
						alert("sdsds");
					}
		        
		   		}); 
				
			}
		}else{
			alert('먼저 삭제할 행을 선택하십시오')
		}
	})

	// select option 설정
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
	
	
	// select2 ui 이용
	
	$("#selSearchSupplier").select2();
	// 결과검색 리스트를 뽑아오는 ajax
	$('#btnSearch').click(function() { 
    	$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/account/ajaxAccountDetailList.do' />",
        	data:$("#frmAccountDetailList").serialize(),
        	dataType:'json',
        	success:function(res){
        		if (res.length > 0) {
        			$("#searchDetailtable tbody").html('');
     				$.each(res, function(idx, item) {
     					var dsd ="<tr ondblclick=popupOpen('"+item.accDtCode+"')><td>"+item.ACC_DT_CODE+"</td>"
     					+"<td>"+item.ACC_CODE+"</td>"
     					+"<td>"+item.ACC_DT_REGDATE+"</td>"
     					+"<td>"+item.PD_CODE+"</td>"
     					+"<td>"+item.PD_NAME+"</td>"
     					+"<td>"+item.ACC_DT_QTY+"</td>"
     					+"<td>"+item.ACC_DT_INDATE+"</td>"
     					+"<td>"+item.WH_CODE+"</td>"
     					+"<td>"+item.ACC_NAME+"</td></tr>";
     					 $("#searchDetailtable tbody").append(dsd);
     					liveTableData.reset();
     					});
     				}else{
     					$("#searchDetailtable tbody").html('');
     				}
        		 $("#searchDetailtable").trigger("update"); 
                 return false; 
        	 },
			error: function(xhr, status, error){
				alert(status);
			}
        
   		}); 
	})

	
	// daterangepicker 이용
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
		//daterangepicker 포맷
	  $('#searchDateRange').on('apply.daterangepicker', function(ev, picker) {
	      $(this).val(picker.startDate.format('YYYY/MM/DD') + '~' + picker.endDate.format('YYYY/MM/DD'));
	  });
		//daterangepicker 리셋세팅
	  $('#searchDateRange').on('cancel.daterangepicker', function(ev, picker) {
	      $(this).val('');
	  });
		

		
	$(document ).on( "click" , "#searchDetailtable tbody tr", function() {              
		$(this).css('backgroundColor','skyblue');
		accDtCode=$(this).find('td:first').text();        
	
	})
	
	$(document ).on( "click" , "table tbody tr", function() {              
		$('table tbody tr td').removeClass('successsss');
		$(this).find('td').addClass('successsss');
		accCode=$(this).find('td:first').text();        
	
	})
});//제이쿼리
		
// 팝업창 띄우기
function returnValueRead(str) {
	var reval = window.returnValue;
	if(str=='pd'){
		if(reval!=null&& reval!=''){
			$('#accDetailWritefrm #pdCode').val(reval.pdCode);
			$('#accDetailWritefrm #pdName').val(reval.pdName);
			$('#accDetailWritefrm #pdOriginalprice').val(reval.pdOriginalprice);
			$('#accDetailWritefrm #pdSellprice').val(reval.pdSellprice);
			$('#accDetailWritefrm #accName').val(reval.accName);
			$('#accDetailWritefrm #accCode').val(reval.accCode);
			
			window.returnValue=null;
		}
	}else if(str=='wh'){
		if(reval!=null&& reval!=''){
			$('#accDetailWritefrm #staCode').val(reval.staCode);
			$('#accDetailWritefrm #whCode').val(reval.whCode);
			
			window.returnValue=null;
			window.ajaxStockByStaCode();
		}
	}
} 
</script>
<style type="text/css">
table.tablesorter tbody td.successsss{
		background-color: skyblue;
} 
</style>
<div class="viewBody">
	<div class="box1">
		<form name="frmAccountDetailList" id="frmAccountDetailList">
		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
				<label for="searchDateRange" class="col-sm-3 control-label">기간<i class="fa fa-calendar"></i></label>
					<div class="col-sm-6">
						<input type="text" name="searchDateRange" class="form-control" id="searchDateRange">
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="form-group">
				<label for="selSearchSupplier" class="col-sm-5 control-label">매입처</label>
					<div class="col-sm-7">
						<select style="max-height: 30px;width: 100px" name="accCode"  data-placeholder="검색할 매입처를 선택하세요" id="selSearchSupplier"></select>
					</div>
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="form-group">
					<div class="col-sm-5">
						<button type="button"id="btnSearch" class="btn btn-primary"><i class="fa fa-lg fa-search"></i>&nbsp;주문장 조회</button>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<div class="box2">    
		<!-- <a data-toggle="modal"  data-target="#modal-accountDetailWrite" role="button" data-backdrop="static">
		 	<span class="btn btn-xs btn-success">구매 등록</span>
		</a>
		<a href="#" id="delbtn" class="btn btn-xs btn-success"><i class="fas fa-trash-alt"></i>구매 내역 삭제</a> -->
		<div id="content1">
			<table id="searchDetailtable" cellspacing="1" class="tablesorter">             
			    <thead> 
			        <tr> 
			            <th>구매현황코드</th> 
			            <th>구매처</th> 
			            <th>주문일자</th> 
			            <th>상품코드</th> 
			            <th>상품명</th> 
			            <th>주문수량</th> 
			            <th>입고일</th> 
			            <th>입고창고</th> 
			            <th>구매처명</th> 
			        </tr> 
			    </thead> 
			    <tbody> 
			       
			    </tbody> 
			</table>
		</div>
	</div>
</div>

 

<div id="modal-accountDetailWrite" class="modal fade" aria-hidden="true" tabindex="-1" role="dialog" style="display: none; z-index: 1050;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="accountDetailWrite.jsp" %>
        </div>
    </div>
</div>

<div id="modal-searchPd" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none; z-index: 1060;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="../products/productsSearch.jsp" %>
        </div>
    </div>
</div>

<div id="modal-searchWh" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none; z-index: 1060;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="../warehouse/warehouseSearch.jsp" %>
        </div>
    </div>
</div>
