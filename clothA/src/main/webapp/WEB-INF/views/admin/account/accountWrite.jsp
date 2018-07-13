<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> 
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<script type="text/javascript">
$(function() {
	$('#closeWrite').click(function() {
		self.close();
	})
})
</script>
<form>
	<input type="hidden" name="accCode">
	회사명 <input type="text" name="accName"><br>
	사용여부 <input type="checkbox" name="accIsdeal"><br>
	대표자명 <input type="text" name="accCeo"><br>
	대표전화 <input type="text" name="accTel"><br>
	주소 <input type="text" name="accZipcode"><button id="searchZipcode"></button>
	<input type="text" name="address"><br>
	<input type="text" name="addressDetail"><br>
	<input type="text" name="accUnique"><br>
	<hr>
	<input type="button" id="closeWrite" value="닫기">
	<input type="submit" value="저장">
</form>