<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="modal-header bg-primary">
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
	$(function() {
		$.ajax({
	    	url : "<c:url value='/admin/area/ajaxAreaList.do' />",
	    	dataType:'json',
	    	success:function(res){
	    		if (res.length > 0){
	    			$("#areaCode").html('');
	    			$.each(res,function(idx, item){
	    				var option = "<option value='"+item.areaCode+"'>";
	    				option += item.areaName;
	    				option += "</option>";
	        			$("#areaCode").append(option);
	    			})
	    		}else{
	    			$("#areaCode").html('');
	    		}
	    	},
	    	error: function(xhr, status, error){
				alert("sdsds");
			}
		})
		
		
		$("#frmStoreWrite #storeTel").keyup(function() {
			var x = $(this).val();
			$(this).val(autoHypenPhone(x));
		});
		
		$('#storeSubmit').click(function() {
			var bool = true;
			var CpNumber = $('#frmStoreWrite #storeNo').val();
			
			$('#frmStoreWrite input[type=text]').each(function() {
				if($(this).val().length<1){
					bool = false;
					$(this).prev().focus();
					alert($(this).prev().text()+"는 필수 입력 항목입니다.");
					return false;
				}
			})
			if(bool){
				if(!CorporationNumber(CpNumber)){
					bool=false;
					$('#frmStoreWrite #accNo').prev().focus();
				}
			}
			 // ajax 해야됨 /ajaxStoreWrite.do !!!!!
			if(bool){
				var formData = new FormData($('#frmStoreWrite')[0]);
				$.ajax({
					type:"post",
			    	url : "<c:url value='/admin/store/ajaxStoreWrite.do' />",
			    	dataType:'text',
			    	contentType: false,
			    	processData: false,
			    	data : formData,
			    	success:function(res){
			    		alert(res);
			    		$('#storeWriteClose').click();
			    		
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
			/* if(bool){
				alert($('#accTel').val().length);
				if($('#accTel').val().length<12){
					bool=false;
					alert("올바른 형식이 아닙니다.");
					$('#accTel').prev().focus();
				}
			} */
		});
		
		
		
	})
	
	//핸드폰번호 자동 하이픈
	function autoHypenPhone(str){
	  str = str.replace(/[^0-9]/g, '');
	  var tmp = '';
	  if( str.length < 4){
	    return str;
	  }else if(str.length < 7){
	    tmp += str.substr(0, 3);
	    tmp += '-';
	    tmp += str.substr(3);
	    return tmp;
	  }else if(str.length < 11){
	    tmp += str.substr(0, 3);
	    tmp += '-';
	    tmp += str.substr(3, 3);
	    tmp += '-';
	    tmp += str.substr(6);
	    return tmp;
	  }else{        
	    tmp += str.substr(0, 3);
	    tmp += '-';
	    tmp += str.substr(3, 4);
	    tmp += '-';
	    tmp += str.substr(7);
	    return tmp;
	  }
	  return str;
	}
	//법인번호 유효성 검사
	function CorporationNumber(str) {
	    // 법인번호 오류검증 공식
	    // 법인번호에서 마지막 자리를 제외한
	    // 앞에 모든 자리수를 1과 2를 순차적으로 곱한다.
	    // 예) 1234567890123
	    //     ************
	    //     121212121212
	    //     각각 곱한 수를 모든 더하고 10으로 나눈 나머지 수를 구한다.
	    //     (각각더한수 % 10)
	    //     나눈 나머지 수와 법인번호 마지막 번호가 일치하면 검증일치 
	    var totalNumber = 0;
	    var num = 0;
	    for (i = 0; i < str.length-1; i++) {
	        if (((i + 1) % 2) == 0) {
	            num = parseInt(str.charAt(i)) * 2;
	        } else {
	            num = parseInt(str.charAt(i)) * 1;
	        }
	        if (num > 0) {
	            totalNumber = totalNumber + num;
	        }
	    }
	    totalNumber = (totalNumber%10 < 10) ? totalNumber%10 : 0;
	    if (str == "") {
	        alert("법인번호를 입력하세요.");
	        return false;
	    } else if (str.length != 13) {
	        alert("유효하지 않은 법인 번호입니다.");
	        return false;
	    }/*  else if (!this.numberChecked(str)) {
	        alert("유효하지 않은 법인 번호입니다.");
	        return false;
	    } else if (totalNumber != str.charAt(str.length-1)) {
	        alert("유효하지 않은 법인 번호입니다.");
	        return false;
	    } */ else {
	        return true;
	    }
	}
	 
	</script>
	<style type="text/css">
	.row{
		margin: 15px;
	}
	</style>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
    <h3 class="smaller lighter blue no-margin modal-title">검수정보 등록</h3>
</div>
 
<div class="modal-body">
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	<form id="frmStoreWrite" name="frmStoreWrite" enctype="multipart/form-data">
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label for="empNo" class="col-sm-3 control-label">점장 </label>
					<div class="col-sm-4">
						<input type="text" id="empNo" name="empNo" class="form-control">
					</div>
					<div class="col-sm-5">
						<input type="button" class="btn btn-primary" id="searchEmpNo" value="사원조회">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<div class="form-group">
					<label for="storeName" class="col-sm-4 control-label">점포이름 </label>
					<div class="col-sm-8">
						<input type="text" id="storeName" name="storeName" class="form-control">
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="form-group">
					<label for="areaCode" class="col-sm-3 control-label">지역 </label>
					<div class="col-sm-4">
						<select id="areaCode" class="form-control" name="areaCode">
			
						</select>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-4">
				<div class="form-group">
					<label for="storeImage" class="col-sm-4 control-label">이미지</label>
					<div class="col-sm-8">
						<input type="file" name="file" class="form-control">
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label for="storeZipcode" class="col-sm-3 control-label">우편번호</label>
					<div class="col-sm-5">
						<input type="text" id="storeZipcode" name="storeZipcode" class="form-control">
					</div>
					<div class="col-sm-4">
						<input type="button" onclick="sample2_execDaumPostcode()" class="btn btn-primary" value="우편번호 찾기">
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label for="address" class="col-sm-3 control-label">주소</label>
					<div class="col-sm-5">
						<input type="text" id="address" name="address" class="form-control">
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label for="addressDetail" class="col-sm-3 control-label">상세주소</label>
					<div class="col-sm-5">
						<input type="text" id="addressDetail" name="addressDetail" class="form-control">
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-7">
				<div class="form-group">
					<label for="storeTel" class="col-sm-2 control-label">대표전화 </label>
					<div class="col-sm-4">
						<input type="text" id="storeTel" name="storeTel" maxlength="13" class="form-control">
					</div>
					<label for="storeNo" class="col-sm-2 control-label">법인번호 </label>
					<div class="col-sm-4">
						<input type="text" id="storeNo" name="storeNo"  maxlength="13" class="form-control">
					</div>
				</div>
			</div>
		</div>
		
		<input type="hidden" name="storeCode" >  
		
		<input type="hidden" name="oldfile">
		
	</form>
		<script type="text/javascript">
		// 우편번호 찾기 화면을 넣을 element
	    var element_layer = document.getElementById('layer');
	
	    function closeDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_layer.style.display = 'none';
	    }
	
	    function sample2_execDaumPostcode() {
	    	 
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = data.address; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수
	
	                // 기본 주소가 도로명 타입일때 조합한다.
	                if(data.addressType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('storeZipcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('address').value = fullAddr;
	                $('#storeZipcode').attr('readonly','readonly');
	                $('#address').attr('readonly','readonly');
	
	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_layer.style.display = 'none';
	            },
	            width : '100%',
	            height : '100%',
	            maxSuggestItems : 5
	        }).embed(element_layer);
	
	        // iframe을 넣은 element를 보이게 한다.
	        element_layer.style.display = 'block';
	
	        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	        initLayerPosition();
	    }
	
	    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	    function initLayerPosition(){
	        var width = 300; //우편번호서비스가 들어갈 element의 width
	        var height = 400; //우편번호서비스가 들어갈 element의 height
	        var borderWidth = 5; //샘플에서 사용하는 border의 두께
	
	        // 위에서 선언한 값들을 실제 element에 넣는다.
	        element_layer.style.width = width + 'px';
	        element_layer.style.height = height + 'px';
	        element_layer.style.border = borderWidth + 'px solid';
	        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
	        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	    }
		</script>                
</div>
 
<div class="modal-footer">
    <span class="btn btn-sm btn-success" id="storeSubmit">
        저장<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="storeWriteClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>

