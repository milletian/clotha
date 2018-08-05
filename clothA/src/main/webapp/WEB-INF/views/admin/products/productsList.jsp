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
	
<script src="<c:url value='/js/jquery.form.min.js' /> "></script>
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
	
	$('#btnSearch').click(function() { 
	$.ajax({
    	type:"POST",
    	url : "<c:url value='/admin/products/ajaxProductsList.do' />",
    	data:$("#frmProductsList").serialize(),
    	dataType:'json',
    	success:function(res){
    		alert(res.length);
    		if (res.length > 0) {
    			$("table tbody").html('');
 				$.each(res, function(idx, item) {
 					var pdList ="<tr class='center'  ondblclick=detail('"+item.PD_CODE+"')><td>"+"<input type='checkbox' name='chk'  value='"+item.PD_CODE+"'></td>"
 					+"<td>"+item.ACC_NAME+"</td>"
 					+"<td>"+item.PD_CODE+"</td>" 
 					+"<td>"+item.PD_NAME+"</td>"
 					+"<td>"
 					if(item.PD_DEL=='Y'){
 						pdList+="<img class='center' alt='"+item.PD_DEL+"' src='<c:url value='/images/inUsed.jpg'/>'>";	
 					}else{
 						pdList+="<img class='center' alt='"+item.PD_DEL+"' src='<c:url value='/images/unUsed.jpg'/>'>";
 					}
 					pdList+="<td>"+item.STYLE_CODE+"</td>";
 					pdList+="<td>"+item.PD_ORIGINALPRICE+"</td>";
 					pdList+="<td>"+item.PD_SELLPRICE+"</td>";
 					pdList+="<td>"+item.PD_REGDATE+"</td></tr>";
 					 $("table tbody").append(pdList);
 					});
 				}else{
 					$("table tbody").html('해당 내역이 없습니다.');
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
	
	  $('form[name=frmDel]').submit(function(){
		 var count=0;
		 var deletemsg = confirm("삭제 하시겠습니까?");
		 if(deletemsg){
		 	$('input[name=chk]').each(function(idx,item){
				if($(this).is(':checked')){
					count++;
				} 
		 	});
		 }else{
		 if(count==0){
			 alert('삭제할 상품을 선택하세요.');
			  return false;
		 	}
		 } 
	  });
});// document
function popupOpen(ACC_DT_CODE){

	var popUrl = "<c:url value='/admin/products/productWrite.do '/>";	//팝업창에 출력될 페이지 URL

	var popOption = "width=800, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"정보입력",popOption);

	}
	
function detail(PD_CODE){
	window.location.href= "/ca/admin/products/productsDetail.do?pdCode="+PD_CODE;
}
	
function checkFileType(filePath){
	var fileFormat = filePath.split(".");
	if(fileFormat.indexOf("xls") > -1){
		return true;
	}else if(fileFormat.indexOf("xlsx") > -1){
		return true;
	}else{
		return false;
	}
}

function check(){
	var file = $("#excel").val();
	if(file == "" || file == null){
		alert("파일을 선택");
		return false;
	}else if(!checkFileType(file)){
		alert("엑셀 파일만 업로드");
		return false;
	}
	var fileFormat = file.split(".");
	var fileType = fileFormat[1];
	if(confirm("업로드 하시겠습니까?")){
		$("#excelUpForm").attr("action","<c:url value='/admin/products/ajaxProductsExcelUpload.do' />");
		var options = {
			success:function(data){
				alert("업로드 완료");
			},
			type: "POST",
			data : {"excelType" : fileType}
		};
		$("#excelUpForm").ajaxSubmit(options);
	}
}
</script>
<style type="text/css">

</style>
<div class="viewBody">
		<div id="wrap" class="box1">
			<form name="frmProductsList" id="frmProductsList">
				<label>기간</label><i class="fa fa-calendar"></i>
				<input type="text" name="searchDateRange" id="searchDateRange">
				<label for="selSearchSupplier">매입처</label>
				<select style="max-height: 30px; width: 100px" name="accCode"
				data-placeholder="검색할 매입처를 선택하세요" id="selSearchSupplier"
					class="ajax">
				</select>
				<label for="selSearchProducts">상품코드/명</label>
				<select style="max-height: 30px; width: 100px" name="pdCode"
					data-placeholder="검색할 상품명/코드를 선택하세요" id="selSearchProducts"
					class="ajax">
				</select>
				<label>사용여부</label>
				<select name="pdDel">
				<option value="전체">전체</option>
				<option value="Y">사용</option>
				<option value="N">미사용</option>
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
				<label for="selSearchStyle">스타일</label>
				<select name="styleCode">
					<option value="">선택</option>
					<option value="S">셔츠</option>
					<option value="O">원피스</option>
					<option value="T">티셔츠</option>
					<option value="K">치마/스커트</option>
					<option value="P">바지</option>
					<option value="U">아우터</option>
					<option value="E">기타</option>
				</select>
				<label for="selSearchSize">사이즈</label>
				<select name="sizeCode">
					<option value="">선택</option>
					<option value="XS">85</option>
					<option value="S">90</option>
					<option value="M">95</option>
					<option value="L">100</option>
					<option value="XL">105</option>
				</select>
				<button type="button" id="btnSearch">
					<i class="fa fa-lg fa-search"></i>&nbsp;상품조회(F2)
				</button>
			</form>
		</div>
		<div id="maincontent" class="box2">
			<form id="excelUpForm" method="post" action="" role="form" enctype="multipart/form-data">
				<input id="excel" name="excel" class="file" type="file" multiple data-show-upload="false" data-show-caption="true">
				<button type="button" id="excelUp" onclick="check()">등록</button>
			</form>
			<a href="#" onclick=popupOpen()><i class="fas fa-edit"></i></a> <a
				href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a> <a href="#"><i
				class="fas fa-trash-alt"></i></a>
			<form name="frmDel"
				action="<c:url value='/admin/products/productsDelete.do'/>"
				method="post">
				<div id="content1">
					<table cellspacing="1" class="tablesorter">
						<thead>
							<tr>
								<th id="center"></th>
								<th>거래처명</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>사용여부</th>
								<th>분류</th>
								<th>입고가</th>
								<th>판매가</th>
								<th>상품등록일</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<input type="submit" value="상품 삭제">
			</form>
		</div>
</div>
