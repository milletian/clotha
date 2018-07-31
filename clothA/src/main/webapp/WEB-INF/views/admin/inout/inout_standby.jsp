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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<link rel="stylesheet" href="<c:url value='/css/view.css'/>">
<script type="text/javascript">
$(function() { 
	$("table").tablesorter(); 
	
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/account/ajaxAccountList.do' />",
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$("#selSearchSupplier").html('');
    			var option = "<option value=''>전체</option>";
    			$("#selSearchSupplier").append(option);
    			
    			$.each(res,function(idx, item){
    				var option2 = "<option value='"+item.accCode+"'>";
    				option2 += item.accName;
    				option2 += "</option>";
        			$("#selSearchSupplier").append(option2);
    			})
    		}else{
    			$("#selSearchSupplier").html('');
    		}
    	},
    	error: function(xhr, status, error){
			alert("sdsds");
		}
	});//ajax
	
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
    	error: function(xhr, status, error){
			alert("sdsds");
		} 
	});//ajex
	
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
			alert("sdsds");
		} 
	});//ajex 매장
	
	$('#btnSearch').click(function() { 
	$.ajax({
    	type:"POST",
    	url : "<c:url value='/admin/inout/ajaxinout_standby.do' />",
    	data:$("#frmwarehousingList").serialize(),
    	dataType:'json',
    	success:function(res){
    		alert(res.length);
    		if (res.length > 0) {
    			$("table tbody").html('');
 				$.each(res, function(idx, item) {
 					var inoutList ="<tr class='center'><td>"+item.IS_IN+"</td>"
 					+"<td>"+item.INOUT_STARTDATE+"</td>"
 					+"<td>"+item.INOUT_ENDDATE+"</td>"
 					+"<td>"+item.WH_NAME+"</td>"
 					+"<td>"+item.STORE_NAME+"</td>"
 					+"<td>"+item.ACC_NAME+"</td>"
 					+"<td>"+item.PD_CODE+"</td>" 
 					+"<td>"+item.PD_NAME+"</td>"
 					+"<td>"+item.COLOR_CODE+"</td>"
 					+"<td>"+item.COLOR_NAME+"</td>"
 					+"<td>"+item.INOUT_DETAIL_QTY+"</td>"
 					+"</tr>";
 					 $("table tbody").append(inoutList);
 					});
 				}else{
 					$("table tbody").html('해당 입고내역이 없습니다.');
 				}
    		 $("table").trigger("update"); 
             return false; 
    	 },
		error: function(xhr, status, error){
			alert("sdsds");
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
});// document
function popupOpen(ACC_DT_CODE){

	var popUrl = "<c:url value='/admin/products/productWrite.do '/>";	//팝업창에 출력될 페이지 URL

	var popOption = "width=800, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"정보입력",popOption);

	}
	
/* function searchWh(){
	var search = "<c:url value='/admin/warehouse/warehouseSearch.do'/>";	//팝업창에 출력될 페이지 URL

	var searchOption = "width=800, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(search,"정보입력",searchOption);
}
		
 */
</script>
<style type="text/css">

</style>
<div class="viewBody">
		<div id="wrap" class="box1">
			<form name="frmwarehousingList" id="frmwarehousingList">
				<label>기간</label><i class="fa fa-calendar"></i>
				<input type="text" name="searchDateRange" id="searchDateRange">
				<label for="selSearchSupplier">매입처</label>
				<select style="max-height: 30px; width: 100px" name="accCode"
				data-placeholder="검색할 매입처를 선택하세요" id="selSearchSupplier"
					class="ajax">
				</select>
				<label for="selSearchStoreName">매장</label>
				<select style="max-height: 30px; width: 100px" name="storeCode"
				data-placeholder="검색할 매장을 선택하세요" id="selSearchStoreName"
					class="ajax">
				</select>
				<label for="selSearchWareHouse">창고</label>
				<input type="text" data-placeholder="검색할 창고를 선택하세요" id="selSearchWareHouse" readonly="readonly" name="whCode" value="wh3">
<!-- 				<input type="text" data-placeholder="검색할 창고를 선택하세요" id="selSearchWareHouse" readonly="readonly" onclick="searchWh()"> -->
				</select>
				<label for="selSearchProducts">상품코드/명</label>
				<select style="max-height: 30px; width: 100px" name="pdCode"
					data-placeholder="검색할 상품명/코드를 선택하세요" id="selSearchProducts"
					class="ajax">
				</select>
				<label for="selSearchColors">색상</label>
				<select name="colorCode">
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
				<button type="button" id="btnSearch">
					<i class="fa fa-lg fa-search"></i>&nbsp;상품조회(F2)
				</button>
			</form>
		</div>
		<div id="maincontent" class="box2">
			<a href="#" onclick=popupOpen()><i class="fas fa-edit"></i></a> <a
				href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a> <a href="#"><i
				class="fas fa-trash-alt"></i></a>
				<div id="content1">
					<table cellspacing="1" class="tablesorter">
						<thead>
							<tr  id="center">
								<th>작업구분</th>
								<th>출고일자</th>
								<th>도착예정일</th>
								<th>출발지</th>
								<th>매장명</th>
								<th>매입처</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>칼라코드</th>
								<th>칼라명</th>
								<th>수량</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</form>
		</div>
</div>
