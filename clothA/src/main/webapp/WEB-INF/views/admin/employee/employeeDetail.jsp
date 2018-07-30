<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> 
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet"	href="<c:url value='/css/view.css'/>">
<script type="text/javascript">
	$(document).ready(function () {
		/* deptNo db값과 동일하게 선택된 상태 */
		$('#deptNo option').each(function() {
			if($(this).val()=='${map.DEPT_NO}'){
				$(this).attr('selected','selected');
			}
		})
		/* gradecode db값과 동일하게 선택된 상태 */
		$('#gradeCode option').each(function() {
			if($(this).val()=='${map.GRADE_CODE}'){
				$(this).attr('selected','selected');
			}
		})
		
		/* 맨처음 입력 포커싱 */
		$('#deptNo').focus();
		
		/* 휴대폰번호 자동 하이픈  */
		$("#empTel").keyup(function() {
			var x = $(this).val();
			$(this).val(autoHypenPhone(x));
		});
		
		
		/* 빈칸 입력 막는 검사  */
		$('form[name=employeeEdit]').submit(function(){
			
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
				return bool;
				
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
		 /* 인사정보 삭제처리 outdate 입력  */
		 $('.employeeDel').click(function () {
			 var result = confirm('정말 삭제하시겠습니까?');
				
				if(result){
					 location.href="<c:url value='/admin/employee/employeeDel.do?empNo=${map.EMP_NO }'/> ";
				}else{
					return false;
				}
		})
		 
	})//제이쿼리
	
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
  
/* 	function delconfirm(){
		var delconfirm = confirm('삭제하시겠습니까?');
    	
    	if(delconfirm){
    		alert('삭제 되었습니다.');
    	}else{
    		alert('삭제가 취소되었습니다.');
    		return false;
    	}
    } */

</script>
<style type="text/css">

</style>

<div class="viewBody">
	<!-- Main content  -->
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	<form name="employeeEdit" method="post" enctype="multipart/form-data"
		action="<c:url value='/admin/employee/employeeEdit.do'/>">

		<div >
			<div >
				<div>
					<input type="hidden" name="oldFileName" value="${map.EMP_FACE}">
					<c:if test="${!empty map.EMP_FACE }">
					<img alt="직원사진" src="<c:url value='/pd_images/${map.EMP_FACE}'/>" style="width: 150px;">
					</c:if>
					<c:if test="${empty map.EMP_FACE }">
					<span>등록된 사진이 없습니다</span>
					</c:if>
				</div>
				
				<div>
					<label for="empNo">사원코드</label>
					<span>${map.EMP_NO }</span>
					<input type="hidden" name="empNo" value="${map.EMP_NO }">
				</div>
				<div>
					<label for="deptNo" class="label-right">부서코드</label> 
						<select	name="deptNo" id="deptNo" title="부서코드" class="valid">
							<option value="">선택하세요</option>
							<option value="10">정직원</option>
							<option value="20">계약직</option>
							<option value="30">단기알바</option>
						</select>
				</div>
				<div>
						<label for="empName">이름</label> 
						<input type="text" name="empName" id="empName" class="valid" value="${map.EMP_NAME }">
				</div>
				<div>
					<label for="empPwd">비밀번호</label> 
					<input type="password" name="empPwd" id="empPwd" class="valid">
					* 비밀번호는 8자리 이상, 특수문자를 포함하여 입력해주세요
				</div>
				<div>
					<label for="empPwd2">비밀번호 확인</label> 
					<input type="password" name="empPwd2" id="empPwd2" class="valid">
				</div>
				<div>
					<label for="empZipcode">우편번호</label> 
					<input type="text" id="empZipcode" name="empZipcode" value="${map.EMP_ZIPCODE }"><input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
					<label for="empAddress">주소</label>
					
					<c:set var="address" value="${map.EMP_ADDRESS.split('~') }"></c:set>
					<input type="text" id="empAddress" name="empAddress" value="${address[0] }"><br>
					<label for="addressDetail">상세주소</label>
					<input type="text" id="addressDetail" name="addressDetail" value="${address[1] }"><br> 
				</div>
				<div>
					<label for="empJumin">주민등록번호</label>
					<c:set var="jumin" value="${map.EMP_JUMIN.split('-') }"></c:set>  
					<input type="text"	name="empJumin1" id="empJumin1" class="valid" onkeyup="jumin1Keyup(this)" maxlength="6" value="${jumin[0] }">-
					<input type="text" name="empJumin2" id="empJumin2"	onkeyup="jumin2Keyup(this)" maxlength="7" value="${jumin[1] }">
				</div>
				<div>
					<label for="empTel" >핸드폰</label>
					<input type="text" id="empTel" name="empTel"  maxlength="13" class="valid" value="${map.EMP_TEL }"><br>
				</div>
				<div>
					<label for="empEmail">이메일 주소</label> 
					<c:set var="email" value="${map.EMP_EMAIL.split('@') }"></c:set>
					<input type="text"	name="email1" id="email1" title="이메일주소 앞자리" class="valid" value='${email[0]}'>
					@ <input type="text" name="email2" id="email2" title="이메일주소 뒷자리" disabled="disabled" value='${email[1]}'>
					<select name="selectEmail" id="selectEmail" title="직접입력" >
						<option value="">선택하세요</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="self">직접입력</option>
					</select> 
				</div>
				<div>
					<label for="changeFile">사진변경(image)</label><input type="file" name="changeFile">
					<br>
		            <c:if test="${!empty map.EMP_FACE}">
		            	<span style="color:green;font-weight: bold">첨부파일을 새로 지정할 경우 기존 파일은 삭제됩니다.</span>
		            </c:if>
				</div>
				<div>
					<label for="empJob">담당업무</label> 
					<input type="text" name="empJob" id="empJob" class="valid" value="${map.EMP_JOB }">
				</div>
				<div>
					<label for="gradeCode">직급</label> 
					<select name="gradeCode" id="gradeCode" title="직급" class="valid">
						<option value="">선택하세요</option>
						<option value="1">마스터</option>
						<option value="2">본사 관리자</option>
						<option value="3">점장</option>
						<option value="4">사원</option>
					</select>
				</div>
				<input type="submit" value="수정"> 
				<input type="reset"	value="취소">
			</div>
		</div>
	</form>
	<div>
		<input type="button" value="삭제" class="employeeDel">
		<input type="text" name="empNo" value="${map.EMP_NO }">
	 </div>
</div>
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



