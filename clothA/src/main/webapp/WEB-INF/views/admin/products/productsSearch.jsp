<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<div class="modal-header">
	<script type="text/javascript">
	$(function() { 
			
			$("#searchpdtable").tablesorter(); 
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
				});//ajex
			
			$('#btnpdSearch').click(function() { 
				$.ajax({
			    	type:"POST",
			    	url : "<c:url value='/admin/products/ajaxProductsList.do' />",
			    	data:{"pdCode":$('#selSearchProducts').val(),
			    		"pdDel":$('#pdDel').val()},
			    	dataType:'json',
			    	success:function(res){
			    		if (res.length > 0) {
			    			$("#searchpdtable tbody").html('');
			 				$.each(res, function(idx, item) {
			 					var pdList ="<tr ondblclick=popupPdText('"+item.PD_CODE+"','"+item.PD_NAME+"','"+item.PD_ORIGINALPRICE+"','"+item.PD_SELLPRICE+"','"+item.ACC_CODE+"','"+item.ACC_NAME+"') class='center'><td>"+item.ACC_NAME+"</td>"
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
			 					$("#searchpdtable tbody").append(pdList);
			 					});
			 				}else{
			 					$("#searchpdtable tbody").html('해당 상품이 없습니다.');
			 				}
			    		 $("#searchpdtable").trigger("update"); 
			             return false; 
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
		    
				}); 
			}); 
			
			
			
		
	
	});// document
	
	/* function popupText(pdCode,pdName,pdOriginalprice,pdSellprice,accCode,accName){
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
			$(opener.document).find('#pdName').val(pdName);
			$(opener.document).find('#accCode').val(accCode);
			$(opener.document).find('#accName').val(accName);
			$(opener.document).find('#pdOriginalprice').val(pdOriginalprice);
			$(opener.document).find('#pdSellprice').val(pdSellprice);
			self.close();
		}
			
		
	} */
	function popupPdText(pdCode,pdName,pdOriginalprice,pdSellprice,accCode,accName){
		var obj = new Object();
		obj.pdCode=pdCode;
		obj.pdName=pdName;
		obj.pdOriginalprice=pdOriginalprice;
		obj.pdSellprice=pdSellprice;
		obj.accCode=accCode;
		obj.accName=accName;
		
		window.returnValue = obj;
		window.returnValueRead('pd');
		$('#btnsearchPdClose').trigger('click');
	}
	
	</script>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title">검수정보 등록</h3>
</div>
 
<div class="modal-body">
	<div class="viewBody">
			<div id="wrap" class="box1">
				<form name="frmProductsList" id="frmProductsList">
					<div class="row">
						<div class="col-sm-5">
							<div class="form-group">
							<label for="selSearchProducts" class="col-sm-4 control-label">상품코드/명</label>
								<div class="col-sm-5">
									<select style="max-height: 30px; width: 100px" name="pdCode"
										data-placeholder="검색할 상품명/코드를 선택하세요" id="selSearchProducts"
										class="ajax">
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-5">
							<div class="form-group">
								
								<div class="col-sm-3">
									<button type="button" id="btnpdSearch" class="btn btn-primary">
										<i class="fa fa-lg fa-search" ></i>&nbsp;상품조회(F2)
									</button>
								</div>
							</div>
						</div>
					</div>
					
					
					<input type="hidden" id="pdDel" value="Y" name="pdDel">
					
				</form>
			</div>
			<div id="maincontent" class="box2">
					<div id="content1">
						<table id="searchpdtable" cellspacing="1" class="tablesorter">
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
			</div>
	</div>                   
</div>
 
<div class="modal-footer">
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnsearchPdClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>

