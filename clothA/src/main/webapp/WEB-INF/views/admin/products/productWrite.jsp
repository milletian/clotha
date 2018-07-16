<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value='/css/view.css'/>">

<style type="text/css">
.box1 {
	padding: 5px;
	background: white;
	border-width: 3px 1px 1px;
	border-style: solid;
	border-color: rgb(210, 214, 222);
	border-image: initial;
	border-top: 3px solid rgb(210, 214, 222);
	margin-bottom: 20px;
}

.box2 {
	padding: 5px;
	background: white;
	border: 1px solid black;
	margin-bottom: 20px;
}
</style>

<div class="viewBody">
	<!-- Main content  -->
	<div class="box1">
		<form name="productsWrite" method="Post"
			action="<c:url value='/admin/products/productWrite.do'/>">
			
				<div>
					<label>상품이름</label> <input type="text" id="pdName" name="pdName">
				</div>
				<div>
					<label>상품 원가</label> <input type="text" id="pdOriginalPrice"
						name="pdOriginalPrice">
				</div>
				<div>
					<label>판매가격</label> <input type="text" id="sellPrice"
						name="pdSellPrice">
				</div>
				<div>
					<label>분류</label> <select>
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
					<label>색상</label> <select>
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
					<label>시즌</label> <select>
						<option value="SS">봄/여름</option>
						<option value="FW">가을/겨울</option>
					</select>
				</div>
				<div>
					<label>사이즈</label> <select>
						<option value="XS">85</option>
						<option value="S">90</option>
						<option value="M">95</option>
						<option value="L">100</option>
						<option value="XL">105</option>
					</select>
				</div>
				<div id="account">
					<label>거래처 코드</label> <input type="text" id="accCode"
						name="accCode">
					<button onclick="accountView()">거래처 조회</button>
					<!-- 거래처 조회 ajax -->
				</div>
				<div>
					<label>성별</label> <select>
						<option value="M">남자</option>
						<option value="F">여자</option>
					</select>
				</div>
				<input type="submit" value="등록">
		</form>
	</div>
</div>


