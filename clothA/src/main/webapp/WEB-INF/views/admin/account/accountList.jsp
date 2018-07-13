<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../../../../inc/adminTop.jsp"  %>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> 
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#btn').click(function() {
		$.ajax({type:"POST",
			url :"<c:url value='/admin/account/accountList.do' />",
			data:$("#frmAccountList").serialize(),
			dataType:'json',
			success: function(res){
			if (res.length > 0) {
				$('#content1').html('');
				$.each(res, function(idx, item) {
					var dsd = "<table class='table' id='table1'>"
					+"<tr><th>매입처코드</th>"
					+"<th>회사명</th>"
					+"<th>주소</th>"
					+"<th>전화번호</th>"
					+"<th>대표자 성명</th>"
					+"<th>사업자 등록번호 </th>"
					+"<th>사용 여부</th>"
					+"<th>특이사항</th></tr><tr>"
					+"<td>"+item.accCode+"</td>"
					+"<td>"+item.accName+"</td>"
					+"<td>"+item.accAddress+"</td>"
					+"<td>"+item.accTel+"</td>"
					+"<td>"+item.accCeo+"</td>"
					+"<td>"+item.accNo+"</td>"
					+"<td>"+item.accIsdeal+"</td>"
					+"<td>"+item.accUnique+"</td>"+"</tr></table>"
					$('#content1').append(dsd);
					});
				}else{
					$('#content1').html('');
					$('#content1').append("<h1>데이터가 존재하지 않습니다</h1>");
				}
			},
			error: function(xhr, status, error){
				alert("sdsds");
			}
		})
	})
})
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
	<form name="frmAccountList" id="frmAccountList">
		<b>사용 여부</b> <input type="radio" id="isall" checked="checked" name="accIsdeal" value="전체"><label for="isall">전체 </label>
		<input type="radio" id="use" name="accIsdeal" value="사용"><label for="use">사용 </label>
		<input type="radio" id="noneuse" name="accIsdeal" value="미사용"><label for="noneuse">미사용 </label>
		
		검색조건
		<select name="searchCondition"> 
			<option value="acc_Code">구매처코드</option>
			<option value="acc_No">사업자등록번호</option>
			<option value="acc_Name">회사명</option>
		</select>
		
		검색<input type="text" name="searchKeyword">
		
		<input type="button" id="btn" value="거래처 조회">
	</form>
</div>

<div id="maincontent">    
	<a href="#"><i class="fas fa-edit"></i></a>
	<a href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a>
	<a href="#"><i class="fas fa-trash-alt"></i></a>
	<div id="content1"></div>
</div>






<%@include file="../../../../inc/bottom.jsp"  %>