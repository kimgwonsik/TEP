<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link href="/TEP/static/css/root.css" rel="stylesheet" />
<title>로그인</title>
<script>
function insert(){
    var join=document.userinput
    
    if(join.m_email.value==""){
    	alert("아이디를 입력해주세요");
    	join.m_email.focus();
    	return false;
    }
     if(join.m_password.value==""){
    	alert("비밀번호를 입력해주세요");
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
<center>
<h3>로그인</h3>
</center>

<table align="center" width="200" border="0" cellspacing="0" cellpadding="0">
	

	<!-- <tr align="center" height="1" bgcolor="#888888">
		<td width="166"></td>
	</tr> -->
	
	<tr align="center" height="20">
		<td width="166"></td>
	</tr>
	
	<tr align="center" border="0" cellspacing="0" cellpadding="0">
		<td>
			<form action="login.action" method="post" name="userinput">
				<input id="id" type="text" name="m_email" maxlength="20" size="20" placeholder="아이디" onkeypress="enterkey();"/><br/>
				<input type="password" name="m_password" maxlength="20" size="21" placeholder="비밀번호" onkeypress="enterkey();"/>
		</td>
	</tr>
	
	<tr align="center" border="0" cellspacing="0" cellpadding="0">
		<td>
				<input type="button" value="로그인" onclick="insert()" >
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
			<input type="button" class="login2" onclick="openConfirmId();" value="ID/PW 찾기"/>&nbsp;&nbsp;
			<input type="button" class="login2" onclick="window:location='AgreementForm.action'" value="회원가입"/>
		</td>
	</tr>
	
	
	
</table>

<br>
<br>
<br>
<br>

</body>
</html>