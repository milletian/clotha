<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js" ></script>
<script type="text/javascript">
	$(function() {
		$('#getMail').select2();
		
		$.ajax({
			type:"POST",
	    	url : "<c:url value='/mail/ajaxmailWrite.do' />",
	    	dataType:'json',
	    	success:function(res){
	    		if (res.length > 0){
	    			$("#getMail").html('');
	    			var option = "<option value=''>전체</option>";
	    			$("#getMail").append(option);
	    			
	    			$.each(res,function(idx, item){
	    				var store = item.storeCode
	    				if(${sessionScope.empNo}!=item.empNo){
		    				if(store!=null && store!=''){
								var option2 = "<optgroup label='"+item.storeName+"'>";
								option2 += "<option value='"+item.empNo+"'>";
								option2 += item.empName;
								option2 += "</option>";
								option2 += "</optgroup>";
								$("#getMail").append(option2); 
		    				}else{
			    				var option3 = "<option value='"+item.empNo+"'>";
			    				option3 += item.empName;
			    				option3 += "</option>";
			        			$("#getMail").append(option3);
		    				}
	    				}
	    			})
	    		}else{
	    			$("#getMail").html('');
	    		}
	    	},
	    	error: function(xhr, status, error){
				alert("요류가 발생하였습니다. 다시 시도해 주세요.");
			}
		});//ajax
		
		$('input[type=submit]').click(function(){
			if($('input[name=mailName]').val()==""){
				alert("제목을 입력해야합니다.");
				return false;
			}else if($('input[name=mailName]').val().length>15){
				alert("15자리 까지만 입력 가능합니다.");
				return false;
			}else if($('#getMail').val()==null){
				alert("받는사람을 정해주세요.");
				return false;
			}else if(CKEDITOR.instances.editor1.getData()==null || CKEDITOR.instances.editor1.getData()=='' ){
				alert("내용을 입력해 주세요.");
				return false;
			}
			
		});
		
	})
</script>
	<div>
		<form action="<c:url value='/mail/mailWrite.do'/>" method="post" name="mailfrm" enctype="multipart/form-data" >
			제목 : <input type="text" name="mailName" style="margin-bottom: 20px; width: 89%;" placeholder="제목을 입력하세요" ><br>
			받는사람 : <select multiple="multiple" style="width: 400px;"data-placeholder="받을사람을 선택하세요" id="getMail"
					name="empNo"  class="ajax" >
					</select><br><br>
			<textarea rows="50" cols="50" name="mailContent" id="editor1" >
				
			</textarea><br><br>
			<script>
				CKEDITOR.replace('editor1');
			</script>
			첨부 파일 : <input type="file" multiple="multiple" name="file" ><br><br>
			<input type="submit" value="보내기" >
		</form>
	</div>         