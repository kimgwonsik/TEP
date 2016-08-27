<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>로그인</title>
<script>
function openConfirmId(){
	var url="findIdPassword.action";
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=430");
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
			<form action="login.action" method="post" onsubmit="return back();">
				<input type="text" name="m_email" maxlength="20" placeholder="아이디" /><br/>
				<input type="password" name="m_password" maxlength="20" placeholder="비밀번호"/>
		</td>
	</tr>
	
	<tr align="center" border="0" cellspacing="0" cellpadding="0">
		<td>
				<input type="submit" name="confirm_id" value="로그인" onclick="history.go(-1);" class="login1"/>
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
			<input type="button" class="login2" onclick="window:location='MembersForm.action'" value="회원가입"/>
		</td>
	</tr>
	
	
	
</table>

<br>
<br>
<br>
<br>

</body>
</html>