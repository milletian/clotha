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

<script type="text/javascript">
$(function() {
	$("table").tablesorter(); 
	
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/account/accountList.do' />",
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
	
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/products/ajaxProductsList.do' />",
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$("#selSearchProducts").html('');
    			$.each(res,function(idx, item){
    				var option = "<option value='"+item.pdCode+"'>";
    				option += item.pdName;
    				option += "</option>";
        			$("#selSearchProducts").append(option);
    			})
    		}else{
    			$("#selSearchProducts").html('');
    		}
    	},
    	error: function(xhr, status, error){
			alert("sdsds");
		}
	})
	$("#selSearchSupplier").select2();
	})
	
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

	
})
function popupOpen(ACC_DT_CODE){

	var popUrl = "<c:url value='/admin/account/accountDetailWrite.do?accDtCode="+ACC_DT_CODE+" '/>";	//팝업창에 출력될 페이지 URL

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
<div id="wrap">
	<form name="frmProductsList" id="frmProductsList">
		<label>기간</label><i class="fa fa-calendar"></i><input type="text" name="searchDateRange" id="searchDateRange">
		<label for="selSearchSupplier">매입처</label>
		<select style="max-height: 30px;width: 100px" name="accCode" data-placeholder="검색할 매입처를 선택하세요" id="selSearchSupplier"></select>
		<label for="selSearchProducts">상품코드/명</label>
		<select style="max-height: 30px;width: 100px" name="pdCode" data-placeholder="검색할 상품명/코드를 선택하세요" id="selSearchProducts"></select>			
		<button type="button"id="btnSearch"><i class="fa fa-lg fa-search"></i>&nbsp;상품조회(F2)</button>
	</form>
</div>
<div id="maincontent">    
	<a href="#" onclick=popupOpen()><i class="fas fa-edit"></i></a>
	<a href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a>
	<a href="#"><i class="fas fa-trash-alt"></i></a>
	<div id="content1">
		<table cellspacing="1" class="tablesorter">             
		    <thead> 
		        <tr> 
		            <th>거래처명</th> 
		            <th>상품코드</th> 
		            <th>상품명</th> 
		            <th>분류</th> 
		            <th>입고가</th> 
		            <th>판매가</th> 
		            <th>사용여부</th> 
		            <th>주문수량</th> 
		            <th>상품 등록일</th> 
		        </tr> 
		    </thead> 
		    <tbody> 
		       
		    </tbody> 
		</table>
	</div>
</div>
