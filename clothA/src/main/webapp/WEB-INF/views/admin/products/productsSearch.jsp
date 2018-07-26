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
    	url : "<c:url value='/admin/products/ajaxProductsName.do' />",
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$("#selSearchProducts").html('');
    			var option1 = "<option value=''>전체</option>";
    			$("#selSearchProducts").append(option1);
    			$.each(res,function(idx, item){
    				
    				var option2 ="<option value='"+item.pdCode+"'>";
    				option2 += item.pdCode;
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
    		if (res.length > 0) {
    			$("table tbody").html('');
 				$.each(res, function(idx, item) {
 					var pdList ="<tr ondblclick=popupText('"+item.PD_CODE+"','"+item.PD_NAME+"','"+item.PD_ORIGINALPRICE+"','"+item.PD_SELLPRICE+"','"+item.ACC_CODE+"') class='center'><td>"+item.ACC_NAME+"</td>"
 					+"<td id='pdCode'>"+item.PD_CODE+"</td>" 
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
 					$("table tbody").html('해당 상품이 없습니다.');
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
	

});// document

function popupText(pdCode,pdName,pdOriginalprice,pdSellprice,accCode){
	var bool = true;
	var openUrl =window.opener.document.URL;
	openUrl=openUrl.substring(openUrl.lastIndexOf('/')+1,openUrl.length);
	if(openUrl.indexOf("stockFirstSet.do")!=-1){
		$(opener.document).find('table tr td:eq(1) input[type=text]').each(function() {
			if($(this).val()==pdCode){
				alert('이미 선택된 상품입니다.');
				bool=false;
				return false;
			}			
		})
		if(bool){
			$(opener.document).find('table tr:last td:eq(1) input[type=text]').val(pdCode);
			$(opener.document).find('table tr:last td:eq(2) input[type=text]').val(pdName);
			$(opener.document).find('#pdCodeSearch').remove();
			$(opener.location).attr("href", "javascript:newRecord();");
			self.close();
		}
	}else if (openUrl.indexOf("stockList.do")!=-1){
		$(opener.document).find('#pdCode').val(pdCode);
		self.close();
	}else if (openUrl.indexOf("accountDetailWrite.do")!=-1){
		$(opener.document).find('#pdCode').val(pdCode);
		$(opener.document).find('#pdCode').attr('readonly','readonly');
		$(opener.document).find('#pdName').val(pdName);
		$(opener.document).find('#pdName').attr('readonly','readonly');
		$(opener.document).find('#accCode').val(accCode);
		$(opener.document).find('#accCode').attr('readonly','readonly');
		$(opener.document).find('#pdOriginalprice').val(pdOriginalprice);
		$(opener.document).find('#pdOriginalprice').attr('readonly','readonly');
		$(opener.document).find('#pdSellprice').val(pdSellprice);
		$(opener.document).find('#pdSellprice').attr('readonly','readonly');
		self.close();
	}
		
	
}
</script>
<style type="text/css">

</style>
<div class="viewBody">
		<div id="wrap" class="box1">
			<form name="frmProductsList" id="frmProductsList">
				<label for="selSearchProducts">상품코드/명</label>
				<select style="max-height: 30px; width: 100px" name="pdCode"
					data-placeholder="검색할 상품명/코드를 선택하세요" id="selSearchProducts"
					class="ajax">
				</select>
				<input type="hidden" value="Y" name="pdDel">
				<button type="button" id="btnSearch">
					<i class="fa fa-lg fa-search"></i>&nbsp;상품조회(F2)
				</button>
			</form>
		</div>
		<div id="maincontent" class="box2">
				<div id="content1">
					<table cellspacing="1" class="tablesorter">
						<thead>
							<tr class="center">
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
				<input type="button" value="닫기" onclick="window.close()">
			</form>
		</div>
</div>
