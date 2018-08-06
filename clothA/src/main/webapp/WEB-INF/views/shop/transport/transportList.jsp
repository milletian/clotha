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
<link rel="stylesheet"	href="<c:url value='/css/view.css'/>">

<script type="text/javascript">
$(function() {
	var Now = new Date();
	var today = Now.getFullYear()+"/"+(Now.getMonth()+1)+"/"+Now.getDate();
	$('#searchDateRange').val(today+"~"+today);
	var tpCode;
	$("#transportListTable").tablesorter(); 
	// exel다운로드를 위한 변수
	var liveTableData = $("#transportListTable").tableExport({
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
		if(tpCode!=undefined){
			if(confirm('정말로 삭제하시겠습니까?')){
		    	$.ajax({
		        	type:"POST",
		        	url : "<c:url value='/admin/account/accountDetailDel.do' />",
		        	data:{"tpCode":tpCode},
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

	// 결과검색 리스트를 뽑아오는 ajax
	$('#btnSearch').click(function() { 
    	$.ajax({
        	type:"POST",
        	url : "<c:url value='/shop/transport/ajaxTransportSearchList.do' />",
        	data:$("#frmTransportSearchList").serialize(),
        	dataType:'json',
        	success:function(res){
        		if (res.length > 0) {
        			$("#transportListTable tbody").html('');
     				$.each(res, function(idx, item) {
     					var dsd ="<tr ondblclick=popupOpen('"+item.TP_CODE+"')><td>"+item.TP_CODE+"</td>"
     					+"<td>"+item.TP_REGDATE+"</td>"
     					+"<td>"+item.STORE_CODE2+"</td>"
     					+"<td>"+item.END_STORE_NAME+"</td>"
     					+"<td>"+item.STORE_CODE+"</td>"
     					+"<td>"+item.START_STORE_NAME+"</td>"
     					+"<td>"+item.PD_CODE+"</td>"
     					+"<td>"+item.PD_NAME+"</td>"
     					+"<td>"+item.QUANTITY+"</td>"
     					+"<td>"+item.TP_ISAGREE+"</td></tr>";
     					 $("#transportListTable tbody").append(dsd);
     					liveTableData.reset();
     					});
     				}else{
     					$("#transportListTable tbody").html('');
     				}
        		 $("#transportListTable").trigger("update"); 
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
		
	$(document ).on( "click" , "#transportListTable tbody tr", function() {              
		$(this).css('backgroundColor','skyblue');
		tpCode=$(this).find('td:first').text();        
	
	})
})
function selectStore(id) {
	$.ajax({
    	url : "<c:url value='/admin/store/ajaxStoreList.do' />",
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$(id).html('');
    			$.each(res,function(idx, item){
    				var option = "<option value='"+item.storeCode+"'>";
    				option += item.storeName;
    				option += "</option>";
        			$(id).append(option);
        			$(id).select2();
    			})
    		}else{
    			$(id).html('');
    		}
    	},
    	error: function(xhr, status, error){
			alert("sdsds");
		}
	})
}
// 팝업창 띄우기
function returnValueRead(str) {
	var reval = window.returnValue;
	if(str=='store'){
		if(reval!=null&& reval!=''){
			$('#transportWritefrm #storeCode').val(reval.storeCode);
			$('#transportWritefrm #storeName').val(reval.storeName);
			pdStockView(reval.storeCode);
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
</style>
<div class="viewBody">
	<div class="box1">
		<form name="frmTransportSearchList" id="frmTransportSearchList">
		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
				<label for="searchDateRange" class="col-sm-3 control-label">기간<i class="fa fa-calendar"></i></label>
					<div class="col-sm-6">
						<input type="text" name="searchDateRange" class="form-control" id="searchDateRange">
					</div>
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="form-group">
					<div class="col-sm-5">
						<button type="button"id="btnSearch" class="btn btn-primary"><i class="fa fa-lg fa-search"></i>&nbsp;점간 이동 현황 조회</button>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" name="userStoreCode" id="userStoreCode" value="${storeCode}">
		</form>
	</div>
	<div class="box2">    
		<a data-toggle="modal"  data-target="#modal-transportWrite" role="button" data-backdrop="static">
		 	<span class="btn btn-xs btn-success">점간 이동 신청</span>
		</a>
		<a href="#" id="delbtn" class="btn btn-xs btn-success"><i class="fas fa-trash-alt"></i>삭제</a>
		<div id="content1">
			<table id="transportListTable" cellspacing="1" class="tablesorter">             
			    <thead> 
			        <tr> 
			            <th>점간 이동 코드</th> 
			            <th>요청 날짜</th> 
			            <th>요청 매장 코드</th> 
			            <th>요청 매장 이름</th> 
			            <th>요청받은 매장 코드</th> 
			            <th>요청받은 매장 이름</th> 
			            <th>상품 코드</th> 
			            <th>상품 이름</th> 
			            <th>수량</th> 
			            <th>승낙여부</th> 
			        </tr> 
			    </thead> 
			    <tbody> 
			       
			    </tbody> 
			</table>
		</div>
	</div>
</div>

 

<div id="modal-transportWrite" class="modal fade" aria-hidden="true" tabindex="-1" role="dialog" style="display: none; z-index: 1050;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="transportWrite.jsp" %>
        </div>
    </div>
</div>

<div id="modal-searchStore" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none; z-index: 1060;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="../../admin/store/storeSearch.jsp" %>
        </div>
    </div>
</div>

