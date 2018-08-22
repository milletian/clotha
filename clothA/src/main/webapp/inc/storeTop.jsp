<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>매점주 페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>


<link rel='stylesheet prefetch'
	href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>

<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
@import
	url('http://fonts.googleapis.com/css?family=Open+Sans:300,400,700');

@import
	url('//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css')
	;

body {
	color: #5D5F63;
	background: #ecf0f5;
	font-family: 'Open Sans', sans-serif;
	padding: 0;
	margin: 0;
	text-rendering: optimizeLegibility;
	-webkit-font-smoothing: antialiased;
	position: relative;
}

.sidebar-toggle {
	margin-left: -240px;
}

.sidebar {
	width: 240px;
	min-height: 100%;
	position: absolute;
	background: #293949;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
	z-index: 100;
	padding-top: 0;
}

.sidebar #leftside-navigation ul, .sidebar #leftside-navigation ul ul {
	margin: -2px 0 0;
	padding: 0;
}

.sidebar #leftside-navigation ul li {
	list-style-type: none;
	border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}

.sidebar #leftside-navigation ul li.active>a {
	color: #1abc9c;
}

.sidebar #leftside-navigation ul li.active ul {
	display: block;
}

.sidebar #leftside-navigation ul li a {
	color: #aeb2b7;
	text-decoration: none;
	display: block;
	padding: 18px 0 18px 25px;
	font-size: 12px;
	outline: 0;
	-webkit-transition: all 200ms ease-in;
	-moz-transition: all 200ms ease-in;
	-o-transition: all 200ms ease-in;
	-ms-transition: all 200ms ease-in;
	transition: all 200ms ease-in;
	
}

.sidebar #leftside-navigation ul li a:hover {
	color: #1abc9c;
}

.sidebar #leftside-navigation ul li a span {
	display: inline-block;
}

.sidebar #leftside-navigation ul li a i {
	width: 20px;
}

.sidebar #leftside-navigation ul li a i .fa-angle-left, .sidebar #leftside-navigation ul li a i .fa-angle-right
	{
	padding-top: 3px;
}

.sidebar #leftside-navigation ul ul {
	display: none;
}

.sidebar #leftside-navigation ul ul li {
	background: #23313f;
	margin-bottom: 0;
	margin-left: 0;
	margin-right: 0;
	border-bottom: none;
}

.sidebar #leftside-navigation ul ul li a {
	font-size: 12px;
	padding-top: 13px;
	padding-bottom: 13px;
	color: #aeb2b7;
}

footer{
	padding-left: 240px;
	text-align: center;
	width: 100%;
	height : 57px;
	background: #596d82;
	position: absolute;
	bottom: 0 ;
	color: white;
}

 .logo{
	width:240px; 
	height: 57px;
	background-color: #596d82;
	text-decoration: none;
	display: block;
	padding: 0;
	font-size: 12px;
 }
 .viewBody{
 	padding: 57px 0 57px 240px;
 	position: absolute; 
 	min-height: 100%;
 	width: 100%;
 	height: 100%;
 }


</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#logout").click(function(){
			location.href="<c:url value='/logout.do'/>";
		});
		
		$("#mail").click(function(){
			window.open("<c:url value='/mail/mail.do'/>","쪽지","status=no,width=700,height=700,location=yes,resizable=yes,left=800,top=30");
		});
		
	});
</script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body>
	<header style="text-align: right; position: absolute; width: 100%; background-color: #596d82; z-index: 9 " >
		<div class="fim-dropdown">
			<label><i class="fa fa-envelope-o fa-lg" id="mail" ></i></label>
		</div>
		<div class="fim-dropdown">
			<label><i class="fa fa-bell-o"></i></label>
		</div>
		<div class="fim-dropdown">
			<label><i class="fas fa-user"></i></label>
		</div>
		<div class="fim-dropdown" >
			<label><i class="fa fa-share-square-o" id="logout"></i></label>
		</div>
	</header>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);
		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>

	<aside class="sidebar" >
		<div class="logo" >
			<a href="<c:url value='/store.do'/>" style="text-align: left;"><img alt="" src="<c:url value='/images/logo5.png'/>" style="width: 240px; height: 57px; "></a>
		</div>
		<div id="leftside-navigation" class="nano">
			<ul class="nano-content">
				<li class="sub-menu">
					<a href="javascript:void(0);">
						<i class="fas fa-cubes"></i>
						<span>재고관리</span>
					<i class="arrow fa fa-angle-right pull-right"></i>
					</a>
					<ul>
						<li>
							<a href="<c:url value='/shop/stock/stockList.do' />" target="if">재고 조회</a>
						</li>
						<li>
							<a href="<c:url value='/shop/stock/stockChart.do' />" target="if">재고 조회(차트)</a>
						</li>
						<li>
							<a href="<c:url value='/shop/stock/anotherStockList.do' />" target="if">타매장 재고 조회</a>
						</li>
						<li>
							<a href="<c:url value='/shop/transport/transportList.do' />" target="if">점간이동현황</a>
						</li>
					</ul></li>
				
				<li class="sub-menu"><a href="javascript:void(0);"><i
						class="far fa-id-badge"></i><span>인사관리</span><i
						class="arrow fa fa-angle-right pull-right"></i></a>
					<ul>
						<c:if test="${sessionScope.gradeCode eq '3' }">
							<li>
							<a href="<c:url value='/shop/employee/employeeList.do' />" target="if">인사등록 신청 / 조회</a>
							</li>
						</c:if>
					</ul></li>
				
				<li class="sub-menu"><a href="javascript:void(0);"><i
						class="fas fa-truck"></i><span>입고/출고관리</span><i
						class="arrow fa fa-angle-right pull-right"></i></a>
					<ul>
						<li><a href="<c:url value='/shop/inout/inout_standby.do' />" target="if">매장입고 현황</a></li>
						<li><a href="<c:url value='/shop/inout/inout_outList.do' />" target="if">매장반품 현황</a></li>
					</ul></li>
				<li class="sub-menu"><a href="javascript:void(0);"><i
						class="fas fa-comments"></i><span>공지사항</span><i
						class="arrow fa fa-angle-right pull-right"></i></a>
					<ul>
						<li><a href="<c:url value='/notice/notice.do'/>" target="if" >조회</a></li>
					</ul></li>
			</ul>
		</div>
	</aside>
	<article class="viewBody">

