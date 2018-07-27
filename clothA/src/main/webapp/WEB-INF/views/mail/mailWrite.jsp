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
    		if (res.length > 0){0
    			$("#getMail").html('');
    			var option = "<option value=''>전체</option>";
    			$("#getMail").append(option);
    			
    			$.each(res,function(idx, item){
    				var store = item.storeCode
    				if(${sessionScope.empNo}!=item.empNo){
	    				if(store!=null && store!=''){
							var option2 = "<optgroup label='"+store+"'>";
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
			alert("aaaaa");
		}
	});//ajax
	
})
</script>
	<div>
		<form action="<c:url value='/mail/mailWrite.do'/>" method="post" name="mailfrm" enctype="multipart/form-data" >
			제목 : <input type="text" name="mailName" style="margin-bottom: 20px; width: 89%;" ><br>
			받는사람 : <select multiple="multiple" style="width: 400px;"data-placeholder="받을사람을 선택하세요" id="getMail"
					name="empNo"  class="ajax" >
					</select><br><br>
			<textarea rows="50" cols="50" name="mailContent" id="editor1" >
				
			</textarea><br><br>
			<script>
				CKEDITOR.replace('editor1');
			</script>
			첨부 파일 : <input type="file" multiple="multiple" name="uploadFile[]" ><br><br>
			<input type="submit" value="보내기" >
		</form>
	</div>         