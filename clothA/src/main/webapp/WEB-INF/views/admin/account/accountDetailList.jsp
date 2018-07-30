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
    	$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/account/accountDetailDel.do' />",
        	data:{'accDtCode':accDtCode},
        	dataType:'json',
        	success:function(res){
        		alert(res);
        	},
			error: function(xhr, status, error){
				alert("sdsds");
			}
        
   		}); 
	})
	// select option 설정
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/account/ajaxAccountList.do' />",
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$("#selSearchSupplier").html('');
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
		$('#searchDetailtable tbody tr').on('click',function(){
			$(this).css('backgroundColor','skyblue');
			accDtCode=$(this).find('td:first').text();
	})

	$('#modal-searchPd #btnClose ').click(function() {
		alert(window.returnValue.pdCode);
	})
	
	$('#modal-searchWh #btnClose ').click(function() {
		alert(window.returnValue.staCode);
	})
	
		
	
})
// 팝업창 띄우기
function popupOpen(ACC_DT_CODE){

	var popUrl = "<c:url value='/admin/account/accountDetailWrite.do?accDtCode="+ACC_DT_CODE+" '/>";	//팝업창에 출력될 페이지 URL

	var popOption = "width=800, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"구매신청작성",popOption);

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
		<form name="frmAccountDetailList" id="frmAccountDetailList">
		<label>기간</label><i class="fa fa-calendar"></i><input type="text" name="searchDateRange" id="searchDateRange">
			<label for="selSearchSupplier">매입처</label>
			<select style="max-height: 30px;width: 100px" name="accCode" data-placeholder="검색할 매입처를 선택하세요" id="selSearchSupplier"></select>
			<button type="button"id="btnSearch"><i class="fa fa-lg fa-search"></i>&nbsp;주문장 조회</button>
		</form>
	</div>
	<div class="box2">    
		<a href="#" onclick=popupOpen()><i class="fas fa-edit"></i></a>
		<a href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a>
		<a href="#" id="delbtn"><i class="fas fa-trash-alt"></i></a>
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
<a data-toggle="modal"  data-target="#modal-accountDetailWrite" role="button" data-backdrop="static">
 <span class="btn btn-xs btn-success">테스트 등록</span>
</a>
 

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
