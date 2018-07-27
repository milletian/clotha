<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
		$("#tabs li").removeClass("ui-corner-top").addClass("ui-corner-left");
	});
</script>
<style>
.ui-widget-header {
	border: none;
	background: #fff;
}

.ui-widget-content, .ui-widget.ui-widget-content {
	border: none;
}

.ui-tabs-vertical {
	width: 100%;
}

.ui-tabs-vertical .ui-tabs-nav {
	padding: .2em .1em .2em .2em;
	float: left;
	width: 20%;
}

.ui-tabs-vertical .ui-tabs-nav li {
	clear: left;
	width: 100%;
	border-bottom-width: 1px !important;
	border-right-width: 0 !important;
	margin: 0 -1px .2em 0;
}

.ui-tabs-vertical .ui-tabs-nav li a {
	display: block;
}

.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active {
	padding-bottom: 0;
	padding-right: .1em;
	border-right-width: 1px;
}

.ui-tabs-vertical .ui-tabs-panel {
	padding: 1em;
	float: right;
	width: 73%;
}
body{
	background: #596d82;
}
body h1{
	color: white;
}

</style>
<title>쪽지</title>
</head>
<body>
	<h1>쪽지</h1>
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">쪽지쓰기</a></li>
			<li><a href="#tabs-2">받은쪽지</a></li>
			<li><a href="#tabs-3">보낸쪽지</a></li>
		</ul>
		<div id="tabs-1">
			<iframe src="<c:url value='/mail/mailWrite.do' />"style="width: 100%; height: 80%"></iframe>
		</div>
		<div id="tabs-2">
			<iframe src="<c:url value='/mail/getMail.do' />"style="width: 100%; height: 80%"></iframe>
		</div>
		<div id="tabs-3">
			<iframe src="<c:url value='/mail/sendMail.do' />"style="width: 100%; height: 80%"></iframe>
		</div>
	</div>
</body>
</html>