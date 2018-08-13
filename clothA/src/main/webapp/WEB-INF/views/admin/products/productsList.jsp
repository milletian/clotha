<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<link rel="stylesheet" href="<c:url value='/css/view.css' /> " type="text/css" /> <!-- 만든 view css  -->
<script src="<c:url value='/js/FileSaver.js' />"></script><!-- 엑셀 플러그인 -->
<script src="<c:url value='/js/xlsx.core.min.js' />"></script><!-- 엑셀 플러그인 -->
<script src="<c:url value='/js/tableexport.js' /> "></script><!-- 엑셀 플러그인 -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script><!-- 부트스트랩 -->
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> <!-- 테이블 플러그인 -->
<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet"><!-- 테이블 플러그인 -->

<script type="text/javascript">
$(function() { 
	
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
	
	//정렬
	$("table").tablesorter(); 
	
	$(".ajax").select2();
	$(".ajax2").select2();
	$(".ajax3").select2();
	
	
	
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
	
	//검색버튼
	$('#btnSearch').click(function() { 
	$.ajax({
    	type:"POST",
    	url : "<c:url value='/admin/products/ajaxProductsList.do' />",
    	data:$("#frmProductsList").serialize(),
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0) {
    			$("table tbody").html('');
 				$.each(res, function(idx, item) {
 					var pdList ="<tr ondblclick=popupOpen('"+item.PD_CODE+"')><td>"+"<input type='checkbox' name='chk'  value='"+item.PD_CODE+"'></td>"
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
 					 //undefined 항목 빈칸으로 출력
	 					$('#empTable td').each(function (idx,item) {
	 					 var a = $(this).text();
		 					if(a=='undefined'){
		 						$(this).text('');
							}
		 				})
		 					liveTableData.reset();
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
	
	  //삭제 버튼
	  $('#delbtn').click(function(){
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
 
	  $(document).on( "click" , "table tbody tr", function() {              
		$('table tbody tr td').removeClass('successsss');
		$(this).find('td').addClass('successsss');
		accCode=$(this).find('td:first').text();        
    });
	  
});// document

	//상세정보
function popupOpen(pdCode){
	/* window.location.href= "/ca/admin/products/productsDetail.do?pdCode="+PD_CODE; */
	$.ajax({
		url:"<c:url value='/admin/products/productsDetil.do' />",
		data:{"pdCode":pdCode},
		dataType:"json",
		success:function(res){
			var year = res.pdRegdate.substring(0,4)+"년";
			
			$('#productsEdit #pdImage img').remove();
			$('#productsEdit #pdImage').text("");
			if(res.pdImage!=null && res.pdImage!=""){
				$('#productsEdit #pdImage').append("<img src='<c:url value='/pd_images/"+res.pdImage+"'/>' width=150px;>"); 
				$('#productsEdit #oldFileName').val(res.pdImage); 
			}else{
				$('#productsEdit #pdImage').text("사진을 등록해주세요");
			}
			$('#productsEdit #pdCode2').val(res.pdCode);
			$('#productsEdit #pdName2').val(res.pdName);
			$('#productsEdit #pdOriginalPrice2').val(res.pdOriginalPrice);
			$('#productsEdit #pdSellPrice2').val(res.pdSellPrice);
			$('#productsEdit #styleName').val(res.styleName);
			$('#productsEdit #pdRegdate2').val(year); 
			$('#productsEdit #pdDel2').val(res.pdDel);
			$('#productsEdit #pdWarning2').val(res.pdWarning);
			$('#productsEdit #pdExplanation2').val(res.pdExplanation);
			
			$('#openmodal2').trigger('click');
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
	})
	
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
table.tablesorter tbody td.successsss{
		background-color: skyblue;
}  
/*리스트 행 클릭 된 행 색변화*/
</style>
<div class="viewBody">
	<div class="box1">
		<form name="frmProductsList" id="frmProductsList">
			<div class="row">
				<div class="col-sm-11">
					<div class="form-group">
						<label class="col-sm-1 control-label">기간<i class="fa fa-calendar"></i></label>
						
						<div class="col-sm-2">
							<input type="text" name="searchDateRange" id="searchDateRange" class="form-control">
						</div>
						<label for="selSearchSupplier" class="col-sm-1 control-label">매입처</label>
						<div class="col-sm-1">
							<select style="max-height: 30px; width: 100px" name="accCode"
									data-placeholder="검색할 매입처를 선택하세요" id="selSearchSupplier"
									class="ajax">
							</select>
						</div>
						<label for="selSearchProducts" class="col-sm-1 control-label">상품코드/명</label>
						<div class="col-sm-1">
							<select style="max-height: 30px; width: 100px" name="pdCode"
								data-placeholder="검색할 상품명/코드를 선택하세요" id="selSearchProducts" class="ajax">
							</select>
						</div>
						<label class="col-sm-1 control-label">사용여부</label>
						<div class="col-sm-1">
							<select name="pdDel" class="form-control">
								<option value="전체">전체</option>
								<option value="Y">사용</option>
								<option value="N">미사용</option>
							</select>
						</div>
				</div>
			</div>
		</div>
		<div class="row">
				<div class="col-sm-11">
					<div class="form-group">		
						<label for="selSearchColors" class="col-sm-1 control-label">색상</label>
						<div class="col-sm-1">
							<select name="colorCode" class="form-control">
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
						<label for="selSearchStyle" class="col-sm-1 control-label">스타일</label>
						<div class="col-sm-1">
							<select name="styleCode" class="form-control">
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
						<label for="selSearchSize" class="col-sm-1 control-label">사이즈</label>
						<div class="col-sm-1">
							<select name="sizeCode" class="form-control">
								<option value="">선택</option>
								<option value="XS">85</option>
								<option value="S">90</option>
								<option value="M">95</option>
								<option value="L">100</option>
								<option value="XL">105</option>
							</select>
						</div>
						<div class="col-sm-1">
							<button type="button" id="btnSearch" class="btn btn-primary"><i class="fa fa-lg fa-search"></i>상품조회(F2)
							</button>
						</div>	
				</div>
			</div>
		</div>
			</form>
		</div>
		<div id="maincontent" class="box2">
			<form id="excelUpForm" method="post" action="" role="form" enctype="multipart/form-data">
				<input id="excel" name="excel" class="file" type="file" multiple data-show-upload="false" data-show-caption="true">
				<button type="button" id="excelUp" onclick="check()">등록</button>
			</form>
		<a data-toggle="modal" data-target="#modal-testNew" role="button" data-backdrop="static">
			<span class="btn btn-xs btn-success" id="openmodal"><i class="fas fa-edit"></i>상품 등록</span>
		</a>
		<a href="#" id="delbtn" class="btn btn-xs btn-success"><i class="fas fa-trash-alt"></i>상품 삭제</a>
		<div style="display: none;">
			<a class="btn btn-xs btn-success" data-toggle="modal" data-target="#modal-pdEdit"  role="button"
			 data-backdrop="static"><i id="openmodal2" class="fas fa-edit"></i>상품 수정</a>
		</div>
			
		<form name="frmDel"	action="<c:url value='/admin/products/productsDelete.do'/>"	method="post">
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
				<!-- <input type="submit" value="상품 삭제"> -->
			</form>
		</div>
</div>

<div id="modal-pdWrite" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="상품정보 등록" aria-describedby="상품등록 모달">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
       		 <%@include file="productWrite.jsp" %>
        </div>
    </div>
</div>

<div id="modal-pdEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="상품정보 수정" aria-describedby="상품정보 모달">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
       		 <%@include file="productsEdit.jsp" %>
        </div>
    </div>
</div> 