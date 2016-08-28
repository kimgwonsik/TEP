<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript">

	window.onload = function(){
		var chk = ${deleteCheck}
		if(chk == 1){
			alert('정상적으로 탈퇴처리가 되었습니다.');
			window.location.href = 'main.action';
		}
		if(chk == 0){
			alert('비밀번호가 틀렸습니다');
			history.back();
		}
	}
</script>
</head>
<body>
</body>
</html>