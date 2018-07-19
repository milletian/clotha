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
<script type = "text/javascript"  src = "<c:url value='/js/jquery-latest.js' />" > </script>  
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> 
<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet">
<script src="<c:url value='/js/FileSaver.js' />"></script>
<script src="<c:url value='/js/xlsx.core.min.js' />"></script>
<script src="<c:url value='/js/tableexport.js' /> "></script>

<script type="text/javascript">
$(function() {
	var storeCode;
	var liveTableData = $("table").tableExport({
	    headings: true,                    // (Boolean), display table headings (th/td elements) in the <thead>
	    footers: true,                     // (Boolean), display table footers (th/td elements) in the <tfoot>
	    formats: ["xlsx", "xls", "csv", "txt"],    // (String[]), filetypes for the export
	    fileName: "id",                    // (id, String), filename for the downloaded file
	    bootstrap: true,                   // (Boolean), style buttons using bootstrap
	    position: "bottom",                 // (top, bottom), position of the caption element relative to table
	    ignoreRows: null,                  // (Number, Number[]), row indices to exclude from the exported file
	    ignoreCols: null,                   // (Number, Number[]), column indices to exclude from the exported file
	    ignoreCSS: ".tableexport-ignore"   // (selector, selector[]), selector(s) to exclude from the exported file
	});
	$("table").tablesorter(); 
	
	$('#delbtn').click(function() { 
    	$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/account/accountDel.do' />",
        	data:accCode,
        	dataType:'json',
        	success:function(res){
        		alert(res);
        	},
			error: function(xhr, status, error){
				alert("sdsds");
			}
        
   		}); 
	})
	
	$('#btn').click(function() { 
    	$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/store/ajaxStoreList.do' />",
        	data:$("#frmStoreList").serialize(),
        	dataType:'json',
        	success:function(res){
        		if (res.length > 0) {
        			$("table tbody").html('');
     				$.each(res, function(idx, item) {
     					var dsd ="<tr ondblclick=popupOpen('"+item.storeCode+"')><td>"+item.storeCode+"</td>"
     					+"<td>"+item.staCode+"</td>"
     					+"<td>"+item.empNo+"</td>"
     					+"<td>"+item.storeZipcode+"</td>"
     					+"<td>"+item.storeAddress+"</td>"
     					+"<td>"+item.storeJoin+"</td>"
     					+"<td>"+item.storeNo+"</td>"
     					+"<td>"+item.storeTel+"</td>"
     					+"<td>"
     					if(item.storeDel!=null&&!item.storeDel!=''){
     						dsd+="영업정지";
     					}else{
     						dsd+="정상영업";
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
	$("#btn").trigger("click");
	$("table").tableExport();
	$('table tbody tr').live('click',function(){
		$(this).css('backgroundColor','skyblue');
		storeCode=$(this).find('td:first').text();
	})
})
function popupOpen(storeCode){

	var popUrl = "<c:url value='/admin/store/storeWrite.do?storeCode="+storeCode+" '/>";	//팝업창에 출력될 페이지 URL

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
	<form name="frmStoreList" id="frmStoreList">
		<b>사용 여부</b> <input type="radio" id="isall" checked="checked" name="storeDel" value="전체"><label for="isall">전체 </label>
		<input type="radio" id="noneuse" name="storeDel" value="N"><label for="noneuse">정상영업 </label>
		<input type="radio" id="use" name="storeDel" value="Y"><label for="use">영업정지 </label>
		
		검색조건
		<select name="searchCondition"> 
			<option value="store_code">점포코드</option>
			<option value="sta_code">재고위치코드</option>
		</select>
		
		검색<input type="text" name="searchKeyword">
		
		<input type="button" id="btn" value="점포 조회">
	</form>
</div>
<div id="maincontent">    
	<a href="#" onclick=popupOpen()><i class="fas fa-edit"></i></a>
	<a href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a>
	<a href="#" id="delbtn"><i class="fas fa-trash-alt"></i></a>
	<div id="content1">
		<table cellspacing="1" class="tablesorter">             
		    <thead> 
		        <tr> 
		            <th>점포코드</th> 
		            <th>재고위치코드</th> 
		            <th>점주이름</th> 
		            <th>우편번호</th> 
		            <th>주소</th> 
		            <th>법인번호</th>
		            <th>대표전화</th>
		            <th>등록날짜</th>
		            <th>폐쇄 여부</th> 
		        </tr> 
		    </thead> 
		    <tbody> 
		       
		    </tbody> 
		</table>
	</div>
</div>





