<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
 


<div class="modal-header bg-primary">
	<script type="text/javascript">
	$(function() {
		
		$("#searchwhtable").tablesorter(); 
		
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
	     					var dsd ="<tr ondblclick=popupWhText('"+item.whCode+"','"+item.staCode+"','"+item.whName+"')><td>"+item.whCode+"</td>"
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
	     					dsd +="</td>";
	     					 $("#searchwhtable tbody").append(dsd);
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
	function popupWhText(whCode,staCode,whName){
		var obj = new Object();
		obj.whCode=whCode;
		obj.staCode=staCode;
		obj.whName=whName;
		
		window.returnValue = obj;
		window.returnValueRead('wh');
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
    <h3 class="smaller lighter blue no-margin modal-title">창고검색</h3>
</div>
 
<div class="modal-body">
	<div id="wrap">
		<form name="frmWarehouseList" id="frmWarehouseList">
			<div class="row">
				<div class="col-sm-1">
					<b>사용 여부</b>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<div class="col-sm-12">
							<input type="radio" id="isall" checked="checked" name="whDel" value="전체"><label for="isall">전체 </label>
							<input type="radio" id="noneuse" name="whDel" value="N"><label for="noneuse">사용중 </label>
							<input type="radio" id="use" name="whDel" value="Y"><label for="use">미사용 </label>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
					<label for="searchCondition"  class="col-sm-5 control-label">검색조건</label>
						<div class="col-sm-7">
							<select id="searchCondition" class="form-control" name="searchCondition"> 
								<option value="wh_code">창고코드</option>
								<option value="sta_code">재고위치코드</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="form-group">
					<label for="searchKeyword" class="col-sm-3 control-label">검색</label>
						<div class="col-sm-5">
							<input type="text" id="searchKeyword" class="form-control" name="searchKeyword">
						</div>
						<div class="col-sm-3">
							<input type="button" id="btn"  class="btn btn-primary" value="창고 조회">
						</div>
					</div>
				</div>
			</div>
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






