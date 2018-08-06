<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<div class="modal-header bg-primary">

<script type="text/javascript">
	 $(document).ready(function () {
		if($('#photo').text()!=null || $('#photo').text()!=""){
			/*$('#photo').css('display',''); */
			$('#photo').show();
		}else{
			/* $('#photo').css('display','none'); */
			$('#photo').hide();
		}
		 
		 /* 매장코드로 매장이름 불러오기 */ 
		$.ajax({
			type:"POST",
	    	url : "<c:url value='/admin/store/ajaxStoreList.do' />",
	    	dataType:'json',
	    	success:function(res){
	    		if (res.length > 0){
	    			$("#searchStore2").html('');
	    				var option1 = "<option value=''>선택하세요</option>";
	    				$("#searchStore2").append(option1);
	    			$.each(res,function(idx, item){
	    				var option2 =
	   					"<option value='"+item.storeCode+"'>";
	    				option2 += item.storeName;
	    				option2 += "</option>";
	        			$("#searchStore2").append(option2);
	    			})
	    		}else{
	    			$("#searchStore2").html('');
	    		}
	    	},
	    	error: function(xhr, status, error){
				alert("등록된 매장을 선택해주세요");
			}
		});//ajax
		
		$(".ajax2").select2();
		
		/* 맨처음 입력 포커싱 */
		$('#storeCode').focus();
		
		/* 휴대폰번호 자동 하이픈  */
		$("#empTel").keyup(function() {
			var x = $(this).val();
			$(this).val(autoHypenPhone(x));
		});
		
		
		/* 빈칸 입력 막는 검사  */
		$('#employeeSubmit').click(function(){
			
			var bool = true;
			
			$('.valid').each(function(idx,item){
				if($(this).val().length<1){
					alert($(this).prev().text()+"을 입력하세요.");
					$(this).focus();
					bool = false;
					return false;
				}
			});
			/*입력한 비밀번호 1과 확인 비밀번호 2의 일치여부 검사 */
			if(bool){
				if($('#empPwd').val()!=$('#empPwd2').val()){
					alert('비밀번호가 일치하지 않습니다.');
					$('#empPwd2').focus();
					bool= false;
					return false;
			/*비밀번호 8자 이상 입력*/
				 } else if($('#empPwd').val().length<8 || $('#empPwd').val().length > 16){
					alert('비밀번호는 8자 이상, 16자리 이하로 입력해 주세요');
					bool= false;
					return false; 
			/*비밀번호 특수문자  */					
				} else if($('#empPwd').val().match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~]) && ([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)){
					alert("비밀번호는 영문,숫자,특수문자의 조합으로 입력해주세요. 영문은 대소문자를 구분합니다.");
					bool=false;
					return false;
					
			/* 주민번호 자릿수 맞게 입력했는지 확인 */
				} else if($('#empJumin1').val().length<6){
					alert('올바른 주민등록 번호를 입력헤 주세요');
					$('#empJumin1').focus();
					bool= false;
					return false;
					
				}else if($('#empJumin2').val().length<7){
					alert('올바른 주민등록 번호를 입력헤 주세요');
					$('#empJumin2').focus();
					bool= false;
					return false;
				
				}
			}
		
			if(bool){
				var formData = new FormData($('#employeeWrite')[0]);
				$.ajax({
					type:"post",
			    	url : "<c:url value='/admin/employee/ajaxemployeeWrite.do' />",
			    	dataType:'text',
			    	contentType: false,
			    	processData: false,
			    	data : formData,
			    	success:function(res){
			    		alert(res);
			    		$('#employeeWriteClose').trigger('click');
			    		
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
				
		});
		
		 /* 이메일 직접입력 */
		$('#selectEmail').change(function(){
				if($(this).val() == 'self'){
					$('#email2').val('');
					$('#email2').attr("disabled", false);

				} else if ($(this).val == 'select'){
					$('#email2').val('');
					$('#email2').attr("disabled", false);

				} else {
					$('#email2').val($(this).val());
					$('#email2').attr("disabled", true);

				}
		});
		
		

	});//jQuery

	/*주민등록번호 유효성체크 */
	
	/* 숫자만입력하도록  */
	function jumin1Keyup(empJumin1) {
		if(empJumin1.value.match('[^0-9]')){
			  alert("주민등록번호는 숫자만 입력하셔야 합니다.");
		        return false;
	/*앞자리 6자리 숫자 입력하면 자동으로 뒷자리 입력칸으로 이동  */
		}else if(empJumin1.value.length >= 6){
				$('#empJumin2').focus();
		}
	}
	/* 숫자만 입력하도록 */
	function jumin2Keyup(empJumin2) {
		if(empJumin2.value.match('[^0-9]')){
			  alert("주민등록번호는 숫자만 입력하셔야 합니다.");
		        return false;
		}else if($('#empJumin2').val().substring(0,1)<"1" || $('#empJumin2').val().substring(0,1)>"4"){
			alert("주민등록번호 뒷자리를 다시 입력하세요")
			return false;
		}
	}

    
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

 

</script>

<style type="text/css">
.row{
		margin: 15px;
	}
</style>
	<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
	<h3 class="smaller lighter blue no-margin modal-title">인사등록</h3>
</div>
<div class="modal-body">
	<!-- Main content  -->
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	<form name="employeeWrite" id="employeeWrite" method="post" enctype="multipart/form-data"	action="<c:url value='/admin/employee/employeeWrite.do'/>">
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
						<label for="storeCode" class="col-sm-2 control-label">매장이름</label>
					<div class="col-sm-3">
						<select style="max-height: 30px;width: 100px" name="storeCode" data-placeholder="입력할 매장을 선택하세요" id="searchStore2" class="ajax2"></select>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
						<label for="deptNo" class="col-sm-2 control-label">부서코드</label>
					<div class="col-sm-3">
						<select	name="deptNo" id="deptNo" title="부서코드" class="valid form-control">
							<option value="">선택하세요</option>
							<option value="10">정직원</option>
							<option value="20">계약직</option>
							<option value="30">단기알바</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
						<label for="empName" class="col-sm-2 control-label">이름</label>
					 <div class="col-sm-3">
						<input type="text" name="empName" id="empName" class="valid form-control" >
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
						<label for="empPwd" class="col-sm-2 control-label">비밀번호</label> 
					<div class="col-sm-3">
						<input type="password" name="empPwd" id="empPwd" class="valid form-control">
					</div>
				<span>* 비밀번호는 8자리 이상, 특수문자를 포함하여 입력해주세요</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
						<label for="empPwd2" class="col-sm-2 control-label">비밀번호 확인</label> 
					<div class="col-sm-3">
						<input type="password" name="empPwd2" id="empPwd2" class="valid form-control">
					</div>
				</div>	
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label for="empZipcode" class="col-sm-2 control-label">우편번호</label> 
					<div class="col-sm-3">
						<input type="text" id="empZipcode" name="empZipcode" class="form-control">
					</div>
					<div class="col-sm-3">
						<input type="button" onclick="sample2_execDaumPostcode()" class="btn btn-primary" value="우편번호 찾기"><br>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label for="empAddress" class="col-sm-2 control-label">주소</label>
					<div class="col-sm-3">
						<input type="text" id="empAddress" name="empAddress" class="form-control"><br>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10">
				<div class="form-group">
					<label for="addressDetail" class="col-sm-2 control-label">상세주소</label>
					<div class="col-sm-3">
						<input type="text" id="addressDetail" name="addressDetail" class="form-control"><br> 
					</div>
				</div>
			</div>
		</div>		
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label for="empJumin" class="col-sm-2 control-label">주민등록번호</label> 
					<div class="col-sm-3">
						<input type="text"	name="empJumin1" id="empJumin1" class="valid form-control" onkeyup="jumin1Keyup(this)" maxlength="6">
					</div>
					<div style="float: left;">
					-
					</div>
					<div class="col-sm-3">
						<input type="text" name="empJumin2" id="empJumin2"	class="form-control" onkeyup="jumin2Keyup(this)" maxlength="7">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label for="empTel" class="col-sm-2 control-label" >핸드폰</label>
					<div class="col-sm-3">
					<input type="text" id="empTel" name="empTel"  maxlength="13" class="valid form-control"><br>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label for="empEmail" class="col-sm-2 control-label">이메일 주소</label> 
					<div class="col-sm-3">
						<input type="text"	name="email1" id="email1" title="이메일주소 앞자리" class="valid form-control">
					</div>
					<div style="float: left;">@</div>
					<div class="col-sm-3">
						<input type="text" name="email2" id="email2" title="이메일주소 뒷자리" disabled="disabled" class="form-control">
					</div>
					<div class="col-sm-2">
						<select name="selectEmail" id="selectEmail" title="직접입력" class="form-control">
							<option value="">선택하세요</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="self">직접입력</option>
						</select>
					</div> 
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label for="uploadFace" class="col-sm-2 control-label">증명사진첨부(image)</label>
					<div class="col-sm-3">
					 <input type="file"	name="uploadFace" id="uploadFace">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label for="empJob" class="col-sm-2 control-label">담당업무</label> 
					<div class="col-sm-3">
					<input type="text" name="empJob" id="empJob" class="valid form-control">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-sm-10">
					<label for="gradeCode" class="col-sm-2 control-label">직급</label>
					<div class="col-sm-3">
						<select name="gradeCode" id="gradeCode" title="직급" class="valid form-control">
							<option value="">선택하세요</option>
							<option value="1">마스터</option>
							<option value="2">본사 관리자</option>
							<option value="3">점장</option>
							<option value="4">사원</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<div class="modal-footer">
	<span class="btn btn-sm btn-success" id="employeeSubmit">
 	등록<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
    </span>
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="employeeWriteClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button></div>
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
                document.getElementById('empZipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('empAddress').value = fullAddr;
                $('#empZipcode').attr('readonly','readonly');
                $('#empAddress').attr('readonly','readonly');

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



