<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
 


<div class="modal-header">
	<script type="text/javascript">
	$(function() {
		
		$("#searchstoretable").tablesorter(); 
		
		
		$('#storeSearchbtn').click(function() { 
	    	$.ajax({
	        	type:"POST",
	        	url : "<c:url value='/admin/store/ajaxStoreList.do' />",
	        	data:$("#frmStoreList").serialize(),
	        	dataType:'json',
	        	success:function(res){
	        		if (res.length > 0) {
	        			$("#searchstoretable tbody").html('');
	     				$.each(res, function(idx, item) {
	     					if(item.storeCode!='${storeCode}'){	     						
		     					var dsd ="<tr ondblclick=popupStoreText('"+item.storeCode+"','"+item.staCode+"','"+item.storeName+"','"+item.empNo+"')><td>"+item.storeCode+"</td>"
		     					+"<td>"+item.staCode+"</td>"
		     					+"<td>"+item.empNo+"</td>"
		     					+"<td>"+item.storeName+"</td>"
		     					+"<td>"+item.storeZipcode+"</td>"
		     					+"<td>"+item.storeAddress+"</td>"
		     					+"<td>"+item.storeNo+"</td>"
		     					+"<td>"+item.storeTel+"</td>"
		     					+"<td>"+item.storeJoin+"</td>";
		     					 $("#searchstoretable tbody").append(dsd);
		     					};
	     					})
	     				}else{
	     					$("#searchstoretable tbody").html('');
	     				}
	        		 $("#searchstoretable").trigger("update"); 
	                 return false; 
	        	 },
				error: function(xhr, status, error){
					alert("sdsds");
				}
	        
	   		}); 
		})
		$('#searchstoretable tbody tr').on('click',function(){
			$(this).css('backgroundColor','skyblue');
			whCode=$(this).find('td:first').text();
		})
	})
	function popupStoreText(storeCode,staCode,storeName,empNo){
		var obj = new Object();
		obj.storeCode=storeCode;
		obj.staCode=staCode;
		obj.storeName=storeName;
		obj.empNo=empNo;
		
		window.returnValue = obj;
		window.returnValueRead('store');
		$('#modal-searchStore #btnClose').trigger('click');
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
		<form name="frmStoreList" id="frmStoreList">
			<input type="hidden" id="storeDel" name="storeDel" value="N">
			검색조건
			<select name="searchCondition"> 
				<option value="store_code">매장코드</option>
				<option value="sta_code">재고위치코드</option>
			</select>
			
			검색<input type="text" name="searchKeyword">
			
			<input type="button" id="storeSearchbtn" value="매장 조회">
		</form>
	</div>
	<div id="maincontent">    
		<div id="content1">
			<table id="searchstoretable" cellspacing="1" class="tablesorter">             
			    <thead> 
			        <tr> 
			            <th>매장코드</th> 
			            <th>재고위치코드</th> 
			            <th>점주코드</th> 
			            <th>매장이름</th> 
			            <th>우편번호</th> 
			            <th>주소</th> 
			            <th>법인번호</th>
			            <th>전화번호</th>
			            <th>등록일</th>
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






