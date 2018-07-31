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
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> 
<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet">
<script src="<c:url value='/js/FileSaver.js' />"></script>
<script src="<c:url value='/js/xlsx.core.min.js' />"></script>
<script src="<c:url value='/js/tableexport.js' /> "></script>
 
<script type="text/javascript">
$(function() {
	var whCode="";
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
	
	$('#delbtn').click(function() { 
		if(whCode==""){
			alert('창고를 선택하셔야 합니다.');
			return false;
		}
		if(confirm(whCode+'창고을 정말로 사용 중지 시키시겠습니까?')){
	    	$.ajax({
	        	type:"POST",
	        	url : "<c:url value='/admin/warehouse/ajaxWarehouseDel.do' />",
	        	data:{"whCode":whCode},
	        	dataType:'json',
	        	success:function(res){
	        		alert(res);
	        	},
				error: function(xhr, status, error){
					alert(JSON.stringify(error));
				}
	        
	   		}); 
			
		}
	})
	
	$('#btn').click(function() { 
    	$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/warehouse/ajaxWarehouseList.do' />",
        	data:$("#frmWarehouseList").serialize(),
        	dataType:'json',
        	success:function(res){
        		if (res.length > 0) {
        			$("table tbody").html('');
     				$.each(res, function(idx, item) {
     					var dsd ="<tr ondblclick=popupOpen('"+item.whCode+"')><td>"+item.whCode+"</td>"
     					+"<td>"+item.staCode+"</td>"
     					+"<td>"+item.whName+"</td>"
     					+"<td>"+item.whZipcode+"</td>"
     					+"<td>"+item.whAddress+"</td>"
     					+"<td>"+item.whRegdate+"</td>"
     					+"<td>"
     					if(item.whDel!=null&&item.whDel!=''){
     						dsd+="미사용";
     					}else{
     						dsd+="사용중";
     					}
     					+"</td>";
     					 $("table tbody").append(dsd);
     					liveTableData.reset();
     					});
     				}else{
     					$("table tbody").html('');
     				}
        		 $("table").trigger("update"); 
                 return false; 
        	 },
			error: function(xhr, status, error){
				alert("sdsds");
			}
        
   		}); 
	})
	$('table tbody tr').on('click',function(){
		$(this).css('backgroundColor','skyblue');
		whCode=$(this).find('td:first').text();
	})
})
function popupOpen(whCode) {
	$.ajax({
		url:"<c:url value='/admin/warehouse/ajaxWarehouseOne.do' />",
		data:{"whCode":whCode},
		dataType:"json",
		success:function(res){
			$('#modal-warehouseWrite #oldfile').val(res.whImage);
			$('#modal-warehouseWrite #whZipcode').val(res.whZipcode);
			$('#modal-warehouseWrite #whName').val(res.whName);
			$('#openWhWritemodal').trigger('click');
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
	<form name="frmWarehouseList" id="frmWarehouseList">
		<b>사용 여부</b> <input type="radio" id="isall" checked="checked" name="whDel" value="전체"><label for="isall">전체 </label>
		<input type="radio" id="noneuse" name="whDel" value="N"><label for="noneuse">정상영업 </label>
		<input type="radio" id="use" name="whDel" value="Y"><label for="use">영업정지 </label>
		검색조건
		<select name="searchCondition"> 
			<option value="wh_code">창고코드</option>
			<option value="sta_code">재고위치코드</option>
		</select>
		
		검색<input type="text" name="searchKeyword">
		
		<input type="button" id="btn" value="창고 조회">
	</form>
</div>
<div id="maincontent">    
	<a href="#"><i class="fas fa-edit"></i></a>
	<a href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a>
	<a href="#" id="delbtn"><i class="fas fa-trash-alt"></i></a>
	<div id="content1">
		<table cellspacing="1" class="tablesorter">             
		    <thead> 
		        <tr> 
		            <th>창고코드</th> 
		            <th>재고위치코드</th> 
		            <th>창고이름</th> 
		            <th>우편번호</th> 
		            <th>주소</th> 
		            <th>등록날짜</th>
		            <th>사용여부</th>
		        </tr> 
		    </thead> 
		    <tbody> 
		       
		    </tbody> 
		</table>
	</div>
</div>


<a data-toggle="modal" data-target="#modal-warehouseWrite" id="openWhWritemodal" role="button" data-backdrop="static">
 <span class="btn btn-xs btn-success">테스트 등록</span>
</a>
 
 
<div id="modal-warehouseWrite" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="warehouseWrite.jsp" %>
        </div>
    </div>
</div>



