<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<!-- <link href="/TEP/static/css/root.css" rel="stylesheet" /> -->
<link rel="stylesheet" href="/TEP/static/css/boardwrite.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/boardview.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css">
<script src="/TEP/static/js/alertify.min.js"></script>
<script src="/TEP/static/js/jquery-3.1.0.js"></script>
<title>로그인</title>
<script>
function insert(){
    var join=document.userinput
    
    if(join.m_email.value==""){
    	alertify.error("이메일 아이디를 입력해주세요");
    	join.m_email.focus();
    	return false;
    }
     if(join.m_password.value==""){
    	 alertify.error("비밀번호를 입력해주세요");
    	join.m_password.focus();
    	return false;
    }

    var f=document.userinput;
	f.submit();
}
function enterkey(){
	if(event.keyCode == 13){
		insert();
	}
}
function idFocus(){
	document.getElementById('id').focus();
}
function openConfirmId(){
	var url="findIdPassword.action";
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=430");
}
</script>
</head>
<body onload="idFocus();">
<!-- <table align="center" border="1" cellspacing="0" cellpadding="0" width="300"> -->

<table align="center" width="200" border="0" cellspacing="0" cellpadding="0">
<tr align="left">
<td><h3><font size="3">로그인</h3></td>
</tr>

<!-- 	<tr align="center" height="1" bgcolor="#888888">
		<td width="166"></td>
	</tr> -->
	
	<tr align="center" height="10">
		<td width="166"></td>
	</tr>
	
	<tr align="center" border="0" cellspacing="0" cellpadding="0">
		<td>
			<form action="login.action" method="post" name="userinput">
				<input id="id" type="text" name="m_email" maxlength="20" style="height:30px;" size="30%" placeholder=" 이메일 아이디를 입력해주세요" onkeypress="enterkey();"/><br><br/>
				<input type="password" name="m_password" maxlength="20" style="height:30px;" size="30%" placeholder=" 비밀번호를 입력해주세요" onkeypress="enterkey();"/>
		</td>
	</tr>
	<tr align="center" border="0" cellspacing="0" cellpadding="0">
		<td>
		<br>
				<input type="button" value="로그인" onclick="insert()" style="width: 240px">
			</form>
		</td>
	</tr>
	
	<tr align="center" height="10">
		<td width="166"></td>
	</tr>
	
	<!-- <tr align="center" height="1" bgcolor="#888888">
		<td width="166"></td>
	</tr>
	 -->

	<tr align="center" border="0" cellspacing="0" cellpadding="0">
		<td border="0" cellspacing="0" cellpadding="0">
			<input type="button" style="width: 113px" class="login2" onclick="openConfirmId();" value="ID/PW 찾기"/>&nbsp;&nbsp;
			<input type="button" style="width: 113px" class="login2" onclick="window:location='AgreementForm.action'" value="회원가입"/>
		</td>
	</tr>
	
</table>
<!-- </table> -->
<br>
<br>
<br>
<br>

</body>
</html>