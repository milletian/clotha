<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css2/style.css' /> " type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<link rel="stylesheet" href="<c:url value='/css/view.css' /> " type="text/css" /> <!-- 만든 view css  -->
<script src="<c:url value='/js/FileSaver.js' />"></script><!-- 엑셀 플러그인 -->
<script src="<c:url value='/js/xlsx.core.min.js' />"></script><!-- 엑셀 플러그인 -->
<script src="<c:url value='/js/tableexport.js' /> "></script><!-- 엑셀 플러그인 -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script><!-- 부트스트랩 -->
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> <!-- 테이블 플러그인 -->
<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet"><!-- 테이블 플러그인 -->

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
		if(storeCode!=undefined){
			if(confirm(storeCode+'지점을 정말로 영업정지 시키시겠습니까?')){
		    	$.ajax({
		        	type:"POST",
		        	url : "<c:url value='/admin/store/ajaxStoreDel.do' />",
		        	data:{"storeCode":storeCode},
		        	dataType:'text',
		        	success:function(res){
		        		alert(res);
		        	},
					error: function(xhr, status, error){
						alert(JSON.stringify(error));
					}
		        
		   		}); 
				
			}
		}else{
			alert('먼저 삭제할 행을 선택하십시오');
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
        			$("#storeTable tbody").html('');
     				$.each(res, function(idx, item) {
     					var dsd ="<tr ondblclick=popupOpen('"+item.storeCode+"')><td>"+item.storeCode+"</td>"
     					+"<td>"+item.staCode+"</td>"
     					+"<td>"+item.empNo+"</td>"
     					+"<td>"+item.storeName+"</td>"
     					+"<td>"+item.storeZipcode+"</td>"
     					+"<td><a onclick=mapview('"+item.storeAddress.replace(/ /gi,"")+"','"+item.storeName+"','"+item.storeTel+"')>"+item.storeAddress+"</a></td>" 
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
     					 $("#storeTable tbody").append(dsd);
     					liveTableData.reset();
     					});
     				}else{
     					$("#storeTable tbody").html('');
     				}
        		 $("table").trigger("update"); 
                 return false; 
        	 },
			error: function(xhr, status, error){
				alert("sdsds");
			}
        
   		}); 
	})
	
	$(document ).on( "click" , "table tbody tr", function() {              
		$(this).css('backgroundColor','skyblue');
		storeCode=$(this).find('td:first').text();        
	
	})
	$(document ).on( "hidden.bs.modal" , "#modal-storeWrite", function() {              
		$(this).find('form')[0].reset();       
	})

	$(document ).on( "click" , "table tbody tr", function() {              
		$('table tbody tr td').removeClass('successsss');
		$(this).find('td').addClass('successsss');
		accCode=$(this).find('td:first').text();        
		
		
    });
})//제이쿼리
function popupOpen(storeCode) {
	$.ajax({
		url:"<c:url value='/admin/store/ajaxStoreOne.do' />",
		data:{"storeCode":storeCode},
		dataType:"json",
		success:function(res){
			var storeAdd = res.storeAddress.split('~');
			
			$('#modal-storeWrite #storeCode').val(res.storeCode);
			$('#modal-storeWrite #empNo').val(res.empNo);
			$('#modal-storeWrite #storeName').val(res.storeName);
			$('#modal-storeWrite #oldfile').val(res.storeImage);
			$('#modal-storeWrite #storeZipcode').val(res.storeZipcode);
			$('#modal-storeWrite #address').val(storeAdd[0]);
			$('#modal-storeWrite #addressDetail').val(storeAdd[1]);
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
	var image = new google.maps.MarkerImage(
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
	                title: '매장', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
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
table.tablesorter tbody td.successsss{
		background-color: skyblue;
} 
/*리스트 행 클릭 된 행 색변화*/
</style>
<div class="viewBody">
	<div class="box1">
		<form name="frmStoreList" id="frmStoreList">
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group">
						<label class="col-sm-1 control-label">사용 여부</label>
						<div class="col-sm-3">
						 	<input type="radio" id="isall" checked="checked" name="storeDel" value="전체"><label for="isall">전체 </label>
							<input type="radio" id="noneuse" name="storeDel" value="N"><label for="noneuse">정상영업 </label>
							<input type="radio" id="use" name="storeDel" value="Y"><label for="use">영업정지 </label>
						</div>
					
						<label class="col-sm-1 control-label">검색조건</label>
						<div class="col-sm-2">
							<select name="searchCondition" class="form-control"> 
								<option value="store_code">점포코드</option>
								<option value="sta_code">재고위치코드</option>
							</select>
						</div>
					
						<label class="col-sm-1 control-label">검색</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" name="searchKeyword">
						</div>
						<div class="col-sm-2">
							<input type="button" id="btn" class="btn btn-primary" value="점포 조회">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
<!-- <div id="map" style="width: 500px;height: 400px;"></div> -->  <!--이거 왜만든건지 모르겠음 일단 주석  -->
	<div class="box2">    
		<a class="btn btn-xs btn-success" data-toggle="modal" data-target="#modal-storeWrite" id="openmodal" role="button" data-backdrop="static"><i class="fas fa-edit"></i>매장 등록</a>
		<a class="btn btn-xs btn-success" href="#" id="delbtn"><i class="fas fa-trash-alt"></i>매장 영업 정지</a>
		<div id="content1">
			<table cellspacing="1" class="tablesorter" id=storeTable>             
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
</div>

 
 


<div id="modal-storeWrite" class="modal fade" tabindex="-1" role="dialog" style="display: none; z-index: 1050;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="storeWrite.jsp"%>
        </div>
    </div>
</div>

<div id="modal-empSearch" class="modal fade" tabindex="-1" role="dialog" style="display: none; z-index: 1060;">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        	<%@include file="../employee/employeeSearch.jsp" %>
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



