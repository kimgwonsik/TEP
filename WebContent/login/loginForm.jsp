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
    else if(join.m_password.value==""){
    	alert("비밀번호를 입력해주세요");
    	join.m_password.focus();
    	return false;
    }
    /* alertify.log("Notification", type, wait);
    alertify.success("Success notification");
    alertify.error("Error notification"); */

    
    
    var f=document.userinput;
	f.submit();
}
function openConfirmId(){
	var url="findIdPassword.action";
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=430");
}
</script>
</head>
<body>

<br>

<br>

<table align="center" width="200" border="0" cellspacing="0" cellpadding="0">
	

	<tr align="center" height="1" bgcolor="#888888">
		<td width="166"></td>
	</tr>
	
	<tr align="center" height="20">
		<td width="166"></td>
	</tr>
	
	<tr align="center" border="0" cellspacing="0" cellpadding="0">
		<td>
			<form action="login.action" method="post" name="userinput">
				<input type="text" name="m_email" maxlength="20" placeholder="아이디" /><br/>
				<input type="password" name="m_password" maxlength="20" placeholder="비밀번호"/>
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
	
	<tr align="center" height="1" bgcolor="#888888">
		<td width="166"></td>
	</tr>
	

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