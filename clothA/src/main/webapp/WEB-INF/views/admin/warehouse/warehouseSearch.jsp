<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
 


<div class="modal-header">
	<script type="text/javascript">
	$(function() {
		var whCode="";
		var liveTableData = $("#searchwhtable").tableExport({
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
		$("#searchwhtable").tablesorter(); 
		
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
	        			$("#searchwhtable tbody").html('');
	     				$.each(res, function(idx, item) {
	     					var dsd ="<tr ondblclick=popupText('"+item.whCode+"','"+item.staCode+"','"+item.whName+"')><td>"+item.whCode+"</td>"
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
	     					 $("#searchwhtable tbody").append(dsd);
	     					liveTableData.reset();
	     					});
	     				}else{
	     					$("#searchwhtable tbody").html('');
	     				}
	        		 $("#searchwhtable").trigger("update"); 
	                 return false; 
	        	 },
				error: function(xhr, status, error){
					alert("sdsds");
				}
	        
	   		}); 
		})
		$('#searchwhtable tbody tr').on('click',function(){
			$(this).css('backgroundColor','skyblue');
			whCode=$(this).find('td:first').text();
		})
	})
	function popupText(whCode,staCode,whName){
		var obj = new Object();
		obj.whCode=whCode;
		obj.staCode=staCode;
		obj.whName=whName;
		
		window.returnValue = obj;
		$('#modal-searchWh #btnClose').trigger('click');
	}
	/* function popupText(whCode,staCode,whName) {
		var bool = true;
		var openUrl =window.opener.document.URL;
		openUrl=openUrl.substring(openUrl.lastIndexOf('/')+1,openUrl.length);
		if(openUrl.indexOf("accountDetailWrite.do")!=-1){
			$(opener.document).find('#whCode').val(whCode);
			$(opener.document).find('#staCode').val(staCode);
			$(opener.location).attr("href", "javascript:ajaxStockByStaCode();");
			self.close();
		} 
	}*/
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
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title">검수정보 등록</h3>
</div>
 
<div class="modal-body">
	<div id="wrap">
		<form name="frmWarehouseList" id="frmWarehouseList">
			<b>사용 여부</b> <input type="radio" id="isall" checked="checked" name="whDel" value="전체"><label for="isall">전체 </label>
			<input type="radio" id="noneuse" name="whDel" value="N"><label for="noneuse">사용중 </label>
			<input type="radio" id="use" name="whDel" value="Y"><label for="use">미사용 </label>
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
		<div id="content1">
			<table id="searchwhtable" cellspacing="1" class="tablesorter">             
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
</div>
 
<div class="modal-footer">
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>






