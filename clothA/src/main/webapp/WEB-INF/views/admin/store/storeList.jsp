<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css2/style.css' /> " type="text/css" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script><!-- 부트스트랩 -->
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> <!-- 테이블 플러그인 -->
<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet"><!-- 테이블 플러그인 -->
<script src="<c:url value='/js/FileSaver.js' />"></script><!-- 엑셀 플러그인 -->
<script src="<c:url value='/js/xlsx.core.min.js' />"></script><!-- 엑셀 플러그인 -->
<script src="<c:url value='/js/tableexport.js' /> "></script><!-- 엑셀 플러그인 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyATFwoVtGMig3PcR40NStCbeE4-BcHgNjc&sensor=true"></script>


<script type="text/javascript">
$(function() {
	var storeCode;
	var liveTableData = $("table").tableExport({
	    headings: true,                    // (Boolean), display table headings (th/td elements) in the <thead>
	    footers: true,                     // (Boolean), display table footers (th/td elements) in the <tfoot>
	    formats: ["xlsx"],    // (String[]), filetypes for the export
	    fileName: "id",                    // (id, String), filename for the downloaded file
	    bootstrap: true,                   // (Boolean), style buttons using bootstrap
	    position: "bottom",                 // (top, bottom), position of the caption element relative to table
	    ignoreRows: null,                  // (Number, Number[]), row indices to exclude from the exported file
	    ignoreCols: null,                   // (Number, Number[]), column indices to exclude from the exported file
	    ignoreCSS: ".tableexport-ignore"   // (selector, selector[]), selector(s) to exclude from the exported file
	});
	$("table").tablesorter(); 
	
	$('#delbtn').click(function() { 
		if(confirm(storeCode+'지점을 정말로 영업정지 시키시겠습니까?')){
	    	$.ajax({
	        	type:"POST",
	        	url : "<c:url value='/admin/store/ajaxStoreDel.do' />",
	        	data:{"storeCode":storeCode},
	        	dataType:'json',
	        	success:function(res){
	        		alert(res);
	        	},
				error: function(xhr, status, error){
					alert(JSON.stringify(error));
				}
	        
	   		}); 
			
		}
	})
	
	
	$('#btn').click(function() { 
    	$.ajax({
        	type:"POST",
        	url : "<c:url value='/admin/store/ajaxStoreList.do' />",
        	data:$("#frmStoreList").serialize(),
        	dataType:'json',
        	success:function(res){
        		if (res.length > 0) {
        			$("table tbody").html('');
     				$.each(res, function(idx, item) {
     					var dsd ="<tr ondblclick=popupOpen('"+item.storeCode+"')><td>"+item.storeCode+"</td>"
     					+"<td>"+item.staCode+"</td>"
     					+"<td>"+item.empNo+"</td>"
     					+"<td>"+item.storeName+"</td>"
     					+"<td>"+item.storeZipcode+"</td>"
     					+"<td><a onclick=mapview('"+item.storeAddress+"','"+item.accAddress.replace(/ /gi,"")+"')>"+item.storeAddress+"</a></td>"
     					+"<td>"+item.storeNo+"</td>"
     					+"<td>"+item.storeTel+"</td>"
     					+"<td>"+item.storeJoin+"</td>"
     					+"<td>"
     					if(item.storeDel!=null&&item.storeDel!=''){
     						dsd+="영업정지";
     					}else{
     						dsd+="정상영업";
     					}
     					+"</td>";
     					 $("table tbody").append(dsd);
     					liveTableData.reset();
     					});
     				}else{
     					$("table tbody").html('');
     				}
        		 $("table").trigger("update"); 
                 return false; 
        	 },
			error: function(xhr, status, error){
				alert("sdsds");
			}
        
   		}); 
	})
	$('table tbody tr').on('click',function(){
		$(this).css('backgroundColor','skyblue');
		storeCode=$(this).find('td:first').text();
	})
	
	//
	
})
function popupOpen(storeCode) {
	$.ajax({
		url:"<c:url value='/admin/store/ajaxStoreOne.do' />",
		data:{"storeCode":storeCode},
		dataType:"json",
		success:function(res){
			$('#modal-storeWrite #storeCode').val(res.storeCode);
			$('#modal-storeWrite #empNo').val(res.empNo);
			$('#modal-storeWrite #storeName').val(res.storeName);
			$('#modal-storeWrite #oldfile').val(res.storeImage);
			$('#modal-storeWrite #storeZipcode').val(res.storeZipcode);
			$('#modal-storeWrite #storeTel').val(res.storeTel);
			$('#modal-storeWrite #storeNo').val(res.storeNo);
			$('#openmodal').trigger('click');
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
function mapview(address1,name,tel){
	$('#map').html("");
	var addressarr = address1.split('~');
	var mapOptions = {
	          zoom: 18, // 지도를 띄웠을 때의 줌 크기
	          mapTypeId: google.maps.MapTypeId.ROADMAP
	    };
	
	
	var map = new google.maps.Map(document.getElementById("map"), // div의 id과 값이 같아야 함. "map-canvas"
	                    mapOptions);
	
	var size_x = 40; // 마커로 사용할 이미지의 가로 크기
	var size_y = 40; // 마커로 사용할 이미지의 세로 크기
	
	// 마커로 사용할 이미지 주소
	var image = new google.maps.MarkerImage( '주소 여기에 기입!',
	                                    new google.maps.Size(size_x, size_y),
	                                    '',
	                                    '',
	                                    new google.maps.Size(size_x, size_y));
	
	// Geocoding *****************************************************
	var address = addressarr[0]; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
	var marker = null;
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode( { 'address': address}, function(results, status) {
	if (status == google.maps.GeocoderStatus.OK) {
	map.setCenter(results[0].geometry.location);
	marker = new google.maps.Marker({
	                map: map,
	                icon: image, // 마커로 사용할 이미지(변수)
	                title: '구매처', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
	                position: results[0].geometry.location
	            });
	
	var content = name+"<br/><br/>Tel: "+tel; // 말풍선 안에 들어갈 내용
	
	// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
	var infowindow = new google.maps.InfoWindow({ content: content});
	google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
	} else {
	alert("Geocode was not successful for the following reason: " + status);
	}
});
    $("#modal-map").modal();
}
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
#map { display:none; }
</style>
<div id="wrap">
	<form name="frmStoreList" id="frmStoreList">
		<b>사용 여부</b> <input type="radio" id="isall" checked="checked" name="storeDel" value="전체"><label for="isall">전체 </label>
		<input type="radio" id="noneuse" name="storeDel" value="N"><label for="noneuse">정상영업 </label>
		<input type="radio" id="use" name="storeDel" value="Y"><label for="use">영업정지 </label>
		
		검색조건
		<select name="searchCondition"> 
			<option value="store_code">점포코드</option>
			<option value="sta_code">재고위치코드</option>
		</select>
		
		검색<input type="text" name="searchKeyword">
		
		<input type="button" id="btn" value="점포 조회">
	</form>
</div>
<div id="map" style="width: 500px;height: 400px;"></div>
<div id="maincontent">    
	<a data-toggle="modal" data-target="#modal-storeWrite" id="openmodal" role="button" data-backdrop="static"><i class="fas fa-edit"></i></a>
	<a href="#"><i class="fas fa-file-excel">엑셀 파일 다운로드</i></a>
	<a href="#" id="delbtn"><i class="fas fa-trash-alt"></i></a>
	<div id="content1">
		<table cellspacing="1" class="tablesorter">             
		    <thead> 
		        <tr> 
		            <th>점포코드</th> 
		            <th>재고위치코드</th> 
		            <th>점주코드</th> 
		            <th>점포이름</th> 
		            <th>우편번호</th> 
		            <th>주소</th> 
		            <th>법인번호</th>
		            <th>대표전화</th>
		            <th>등록날짜</th>
		            <th>폐쇄 여부</th> 
		        </tr> 
		    </thead> 
		    <tbody> 
		       
		    </tbody> 
		</table>
	</div>
</div>

 
 
<div id="modal-storeWrite" class="modal fade" tabindex="-1" role="dialog" style="display: none; z-index: 1050;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="storeWrite.jsp" %>
        </div>
    </div>
</div>

<div id="modal-map" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<div id="map" style="width:100%;height:100%;"></div>
        </div>
    </div>
</div>



