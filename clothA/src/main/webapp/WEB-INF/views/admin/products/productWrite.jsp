<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<div class="modal-header bg-primary">

<script type="text/javascript">
$(function(){
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/account/ajaxAccountList.do' />",
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$("#account2").html('');
    				var option1 = "<option value=''>선택하세요</option>";
					$("#account2").append(option1);
    			$.each(res,function(idx, item){
    				var option = "<option value='"+item.accCode+"'>";
    				option += item.accName;
    				option += "</option>";
        			$("#account2").append(option);
    			})
    		}else{
    			$("#account2").html('');
    		}
    	},
    	error: function(xhr, status, error){
			alert("error!");
		}
	})
	
	
	
	$('#productSubmit').click(function(){
		var bool = true;
		
		$('.valid').each(function(idx,item){
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
			var formData = new FormData($('#productsWrite')[0]);
			$.ajax({
				type:"post",
		    	url : "<c:url value='/admin/products/ajaxproductWrite.do' />",
		    	dataType:'text',
		    	contentType: false,
		    	processData: false,
		    	data : formData,
		    	success:function(res){
		    		alert(res);
		    		$('#productsWriteClose').trigger('click');
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
	<h3 class="smaller lighter blue no-margin modal-title">상품등록</h3>
</div>
<div class="modal-body">
	<!-- Main content  -->
	<form name="productsWrite" id="productsWrite" method="Post" enctype="multipart/form-data">
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label class="col-sm-2 control-label">상품이름</label> 
					<div class="col-sm-3">
					<input type="text" id="pdName" name="pdName" class="valid form-control">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label class="col-sm-2 control-label">상품 원가</label>
					<div class="col-sm-3">
					<input type="text" id="pdOriginalPrice"	name="pdOriginalPrice" class="valid form-control">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label class="col-sm-2 control-label">판매가격</label>
					<div class="col-sm-3">
					<input type="text" id="sellPrice" name="pdSellPrice" class="valid form-control">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">	
				<label class="col-sm-2 control-label">분류</label>
				<div class="col-sm-3">
					 <select name="styleCode" class="valid form-control">
						<option value=''>선택</option>
						<option value="S">셔츠</option>
						<option value="O">원피스</option>
						<option value="T">티셔츠</option>
						<option value="K">스커트</option>
						<option value="P">바지</option>
						<option value="U">아우터</option>
						<option value="E">기타</option>
					</select>
				</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 control-label">색상</label>
					<div class="col-sm-3">
						<select name="colorCode" class="valid form-control">
							<option value=''>선택</option>
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
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 control-label">시즌</label>
					<div class="col-sm-3">
						 <select name="seasonCode" class="valid form-control">
							<option value=''>선택</option>
							<option value="SS">봄/여름</option>
							<option value="FW">가을/겨울</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 control-label">사이즈</label>
					<div class="col-sm-3">
					<select name="sizeCode" class="valid form-control">
						<option value=''>선택</option>
						<option value="XS">85</option>
						<option value="S">90</option>
						<option value="M">95</option>
						<option value="L">100</option>
						<option value="XL">105</option>
					</select>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 control-label">거래처 코드</label>
					<div class="col-sm-3">
						<select style="max-height: 30px;width: 200px" name="accCode" data-placeholder="입력할 거래처를 선택하세요" id=account2 class="ajax2"></select>
						<!-- 거래처 조회 ajax -->
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 control-label">성별</label>
					<div class="col-sm-3">
						<select name="genderCode" class="valid form-control">
							<option value=''>선택</option>
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 control-label">상품 이미지</label>
					<div class="col-sm-3">
					<input type="file" name="uploadImage" class="valid">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 control-label">사용여부</label>
					<div class="col-sm-3">
					<select name="pdDel" class="valid form-control">
						<option value="">선택하세요</option>
						<option value="Y">사용</option>
						<option value="N">미사용</option>
					</select>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 control-label">주의 사항 </label>
					<div class="col-sm-3">
					<textarea name="pdWarning" style="width:220px; height:70px"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 control-label">상세내역 </label>
					<div class="col-sm-3">
					<textarea name="pdExplanation" style="width:220px; height:70px"></textarea>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<div class="modal-footer">
	<span class="btn btn-sm btn-success" id="productSubmit">
 	등록<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="productWriteClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>

