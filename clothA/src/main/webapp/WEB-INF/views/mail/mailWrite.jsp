<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지쓰기</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
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
</head>
<body>
	<div>
		<form action="<c:url value='/mail/mailWrite.do'/>" method="post" name="mailfrm" >
			제목 : <input type="text" name="mailName" ><br>
			받는사람 : <select multiple="multiple" style="width: 400px;"data-placeholder="받을사람을 선택하세요" id="getMail"
					name="empNo"  class="ajax" >
						
					</select>
		</form>
	</div>
</body>
</html>               