<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/css/view.css'/>">
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> 
<script type="text/javascript">
$(function(){
	$.ajax({
		type:"POST",
    	url : "<c:url value='/admin/account/accountList.do' />",
    	dataType:'json',
    	success:function(res){
    		if (res.length > 0){
    			$("#account").html('');
    			$.each(res,function(idx, item){
    				var option = "<option value='"+item.accCode+"'>";
    				option += item.accName;
    				option += "</option>";
        			$("#account").append(option);
    			})
    		}else{
    			$("#account").html('');
    		}
    	},
    	error: function(xhr, status, error){
			alert("error!");
		}
	})
	
	$('form[name=productsWrite]').submit(function(){
		var bool = true;
		
		$('.valid').each(function(idx,item){
			if($(this).val().length<1){
				alert($(this).prev().text()+"을 입력하세요.");
				$(this).focus();
				bool = false;
				return false;
			}
		});
		return bool;
	});
	
})
</script>
<style type="text/css">

</style>

<div class="viewBody">
	<!-- Main content  -->
	<div class="box1">
		<form name="productsWrite" method="Post"
			action="<c:url value='/admin/products/productWrite.do'/>" enctype="multipart/form-data">
			
				<div>
					<label>상품이름</label> <input type="text" id="pdName" name="pdName" class="valid">
				</div>
				<div>
					<label>상품 원가</label> <input type="text" id="pdOriginalPrice"
						name="pdOriginalPrice" class="valid">
				</div>
				<div>
					<label>판매가격</label> <input type="text" id="sellPrice"
						name="pdSellPrice" class="valid">
				</div>
				<div>
					<label>분류</label> 
					<select name="styleCode" class="valid">
						<option value="S">셔츠</option>
						<option value="O">원피스</option>
						<option value="T">티셔츠</option>
						<option value="K">스커트</option>
						<option value="P">바지</option>
						<option value="U">아우터</option>
						<option value="E">기타</option>
					</select>
				</div>
				<div>
					<label>색상</label>
					 <select name="colorCode" class="valid">
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
				<div>
					<label>시즌</label>
					<select name="seasonCode" class="valid">
						<option value="SS">봄/여름</option>
						<option value="FW">가을/겨울</option>
					</select>
				</div>
				<div>
					<label>사이즈</label>
					 <select name="sizeCode" class="valid">
						<option value="XS">85</option>
						<option value="S">90</option>
						<option value="M">95</option>
						<option value="L">100</option>
						<option value="XL">105</option>
					</select>
				</div>
				<div >
					<label>거래처 코드</label> 
					<select name="accCode" id="account" class="valid">
					<!-- 거래처 조회 ajax -->
					</select>
				</div>
				<div>
					<label>성별</label>
					<select name="genderCode" class="valid">
						<option value="M">남자</option>
						<option value="F">여자</option>
					</select>
				</div>
				<div>
				<label>상품 이미지</label>
				<input type="file" name="uploadImage" class="valid">
				</div>
				<div>
				<label>주의 사항 </label>
				<textarea name="pdWarning">
				</textarea>
				</div>
				<div>
				<label>상세내역 </label>
				<textarea name="pdExplanation">
				</textarea>
				</div>
				<br>
				<input type="submit" value="등록">
		</form>
	</div>
</div>


