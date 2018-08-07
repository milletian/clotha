<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css2/style.css' /> " type="text/css" />
<link rel="stylesheet" href="<c:url value='/css/view.css' /> " type="text/css" /> <!-- 만든 view css  -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type = "text/javascript"  src = "<c:url value='/js/jquery.tablesorter.js' />"> </script> 
<link href="<c:url value='/css/tableexport.css' /> " rel="stylesheet">
<script src="<c:url value='/js/FileSaver.js' />"></script>
<script src="<c:url value='/js/xlsx.core.min.js' />"></script>
<script src="<c:url value='/js/tableexport.js' /> "></script>



<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyATFwoVtGMig3PcR40NStCbeE4-BcHgNjc&sensor=true"></script>
  
<script type="text/javascript">
$(function() {
	var accCode;
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
		if(accCode!=undefined){
			if(confirm("정말로 거래처를 삭제 하시겠습니까?")){
		    	$.ajax({
		        	type:"POST",
		        	url : "<c:url value='/admin/account/accountDel.do' />",
		        	data:{"accCode":accCode},
		        	dataType:'text',
		        	success:function(res){
		        		alert(res);
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
		        
		   		}); 
				
			}
		}else{
			alert('먼저 삭제할 거래처를 선택하세요');
		}
	})
	
	$('#btn').click(function() { 
    	$.ajax({
        	url : "<c:url value='/admin/account/ajaxAccountList.do' />",
        	data:$("#frmAccountList").serialize(),
        	dataType:'json',
        	success:function(res){
        		if (res.length > 0) {
        			$("table tbody").html('');
     				$.each(res, function(idx, item) {
     					var dsd ="<tr ondblclick=popupOpen('"+item.accCode+"')><td>"+item.accCode+"</td>"
     					+"<td>"+item.accName+"</td>"
     					+"<td><a onclick=mapview('"+item.accAddress.replace(/ /gi,"")+"','"+item.accName+"','"+item.accTel+"')>"+item.accAddress+"</a></td>"
     					+"<td>"+item.accTel+"</td>"
     					+"<td>"+item.accCeo+"</td>"
     					+"<td>"+item.accNo+"</td>"
     					+"<td>"
     					if(item.accIsdeal=='Y'){
     						dsd+="사용";
     					}else{
     						dsd+="미사용";
     					}
     					+"</td>";
     					dsd+="<td>"+item.accUnique+"</td></tr>";
     					 $("table tbody").append(dsd);
     					liveTableData.reset();
     					});
     				}else{
     					$("table tbody").html('');
     				}
        		 $("table").trigger("update"); 
                 return false; 
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
        
   		}); 
	})
	
	$(document ).on( "click" , "table tbody tr", function() {              
		$('table tbody tr td').removeClass('successsss');
		$(this).find('td').addClass('successsss');
		accCode=$(this).find('td:first').text();        
		
		
    });
	
	$('#modal-testNew').on('hidden.bs.modal', function (e) {
	  $(this).find('form')[0].reset();
	});
	
	$(document ).on( "click" , "table tbody tr", function() {              
		$('table tbody tr td').removeClass('successsss');
		$(this).find('td').addClass('successsss');
		accCode=$(this).find('td:first').text();  
	
})//제이 쿼리
function popupOpen(accCode) {
	$.ajax({
		url:"<c:url value='/admin/account/ajaxAccountOne.do' />",
		data:{"accCode":accCode},
		dataType:"json",
		success:function(res){
			$('#modal-testNew #accCode').val(res.accCode);
			$('#modal-testNew #accName').val(res.accName);
			$('#modal-testNew #accCeo').val(res.accCeo);
			$('#modal-testNew #accTel').val(res.accTel);
			$('#modal-testNew #accNo').val(res.accNo);
			$('#modal-testNew #accZipcode').val(res.accZipcode);
			$('#modal-testNew #accUnique').val(res.accUnique);
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
table.tablesorter tbody td.successsss{
		background-color: skyblue;
} 
</style>
<div class="viewBody">
	<div class="box1">
		<form name="frmAccountList" id="frmAccountList">
		<div class="row">
			<div class="col-sm-1">
				<b>사용 여부</b>
			</div>
			<div class="col-sm-2">
				<div class="form-group">
					<div class="col-sm-12">
						<input type="radio" id="isall" class="checkbox-inline" checked="checked" name="accIsdeal" value="전체"><label for="isall">전체 </label>
						<input type="radio" id="use" name="accIsdeal" class="checkbox-inline" value="Y"><label for="use">사용 </label>
						<input type="radio" id="noneuse" name="accIsdeal" class="checkbox-inline" value="N"><label for="noneuse">미사용 </label>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="form-group">
				<label for="searchCondition"  class="col-sm-5 control-label">검색조건</label>
					<div class="col-sm-7">
						<select id="searchCondition" class="form-control" name="searchCondition"> 
							<option value="acc_Code">구매처코드</option>
							<option value="acc_No">법인등록번호</option>
							<option value="acc_Name">회사명</option>
						</select>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="form-group">
				<label for="searchKeyword" class="col-sm-2 control-label">검색</label>
					<div class="col-sm-5">
						<input type="text" id="searchKeyword" class="form-control" name="searchKeyword">
					</div>
					<div class="col-sm-5">
						<input type="button" id="btn"  class="btn btn-primary" value="거래처 조회">
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<div class="box2">    
		<a  data-toggle="modal" data-target="#modal-testNew" role="button" data-backdrop="static">
		 	<span class="btn btn-xs btn-success" id="openmodal"><i class="fas fa-edit"></i>구매처 등록</span>
		</a>
		<a href="#" id="delbtn" class="btn btn-xs btn-success"><i class="fas fa-trash-alt"></i>구매처 삭제</a>
		<div id="content1">
			<table cellspacing="1" class="tablesorter">             
			    <thead> 
			        <tr> 
			            <th>매입처코드</th> 
			            <th>회사명</th> 
			            <th>주소</th> 
			            <th>전화번호</th> 
			            <th>대표자 성명</th> 
			            <th>법인 등록번호</th> 
			            <th>사용 여부</th> 
			            <th>특이사항</th> 
			        </tr> 
			    </thead> 
			    <tbody> 
			       
			    </tbody> 
			</table>
		</div>
	</div>
</div>



 
 
<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
       		 <%@include file="accountWrite.jsp" %>
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


