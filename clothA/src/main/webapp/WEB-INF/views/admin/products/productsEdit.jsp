<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<div class="modal-header bg-primary">
<script type="text/javascript">
$(function () {
	$('#frmPdEdit').click(function(){
		var bool = true;
		
		$('.valid2').each(function(idx,item){
			if($(this).val().length<1){
				alert($(this).parent().prev().text()+"을 입력하세요.");
				$(this).focus();
				bool = false;
				return false;
			}
		});
		var originalPrice=$('#pdOriginalPrice').val();
		var sellPrice = $('#pdSellPrice').val();
		
		if(parseInt()>$('#pdSellPrice').val()){
			alert("적절한 판매가격이 아닙니다.");
			bool=false;
			return false;
		}
		
		if(bool){
			var formData = new FormData($('#productsEdit')[0]);
			$.ajax({
				type:"post",
		    	url : "<c:url value='/admin/products/productsEdit.do' />",
		    	dataType:'text',
		    	contentType: false,
		    	processData: false,
		    	data : formData,
		    	success:function(res){
		    		alert(res);
		    		$('#productsEditClose').trigger('click');
		    		location.reload();
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
	});

	
	
}); //제이쿼리
</script>
<style type="text/css">
.row{
		margin: 15px;
	}
</style>
	<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
	<h3 class="smaller lighter blue no-margin modal-title">상품정보 상세 / 수정 </h3>
</div>
<div class="modal-body">
	<form name="productsEdit"  id="productsEdit" method="post"  enctype="multipart/form-data" >
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<div id="pdImage">
					</div>
				</div>
			</div>
		</div>
		<div>
		<input type="hidden" name="pdCode"  id="pdCode2">
		<input type="hidden" name="oldFileName" id="oldFileName">
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label for="pdCode" class="col-sm-2 control-label">상품코드</label>
					<div class="col-sm-3">
						<input type="text" name="pdCode" id="pdCode2" readonly="readonly" class="form-control">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label for="pdName" class="col-sm-2 control-label">상품이름</label>
					<div class="col-sm-3">
						<input type="text" name="pdName" id="pdName2" class="valid2 form-control">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label for="changFile" class="col-sm-2 control-label">상품이미지</label>
					<div class="col-sm-3">
						<input type="file" name="changeFile" id="changeFile2" >
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label  class="col-sm-2 control-label"></label>
					<div class="col-sm-6">
					 <span style="color:green;font-weight: bold">
					첨부파일을 새로 지정할 경우 기존 파일은 삭제됩니다.</span>
					</div>
		 		</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label for="pdRegdate" class="col-sm-2 control-label">생산년도</label>
					<div class="col-sm-3">
						<input type="text" name="pdRegdate" id="pdRegdate2" readonly="readonly" class="form-control">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label for="styleCode" class="col-sm-2 control-label">스타일</label>
					<div class="col-sm-3">
						<input type="text" name="styleCode" id="styleName" readonly="readonly" class="form-control">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label for=pdOriginalPrice class="col-sm-2 control-label">입고가</label>
					<div class="col-sm-3">
						<input type="text" name="pdOriginalPrice" id="pdOriginalPrice2" class="valid2 form-control">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label for=pdSellPrice class="col-sm-2 control-label">판매가</label>
					<div class="col-sm-3">
						<input type="text" name="pdSellPrice" id="pdSellPrice2" class="valid2 form-control">
					</div>	
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label for=pdDel class="col-sm-2 control-label">사용여부</label>
					<div class="col-sm-3">
						<select name="pdDel" id="pdDel2" class="valid2 form-control">
							<option value="">선택하세요</option>
							<option value="Y">사용</option>
							<option value="N">미사용</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label for=pdEdit2 class="col-sm-2 control-label">상품주의 사항</label>
					<div class="col-sm-3">
						<textarea name="pdWarning"  id="pdWarning2" class="form-control"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">	
					<label for=pdExplanation class="col-sm-2 control-label">상품설명</label>
					<div class="col-sm-3">
						<textarea name="pdExplanation" id="pdExplanation2" class="form-control"></textarea>
					</div>
				</div>
			</div>
		</div>
</form>
</div>
<div class="modal-footer">
	<span class="btn btn-sm btn-success" id="frmPdEdit">
 	수정<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="productsEditClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>
