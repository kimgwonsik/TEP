<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/boardview.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css">
<script src="/TEP/static/js/alertify.min.js"></script>
<script src="/TEP/static/js/jquery-3.1.0.js"></script>
<script type="text/javascript">
function validation(){
	if(document.findId.m_name.value==""){
		alert("이름을 입력해주세요.");
		document.findId.m_name.focus();
		return false;
	}
	if(document.findId.m_phone.value==""){
		alert("핸드폰번호를 입력해주세요");
		document.findId.m_phone.focus();
		return false;
	}
}
function validation2(){
	if(document.findPassword.m_email.value==""){
		alert("아이디를 입력해주세요.");
		document.findPassword.m_email.focus();
		return false;
	}
	if(document.findPassword.m_name.value==""){
		alert("이름을 입력해주세요.");
		document.findPassword.m_name.focus();
		return false;
	}
	if(document.findPassword.m_phone.value==""){
		alert("핸드폰번호를 입력해주세요");
		document.findPassword.m_phone.focus();
		return false;
	}
}
</script>
<title>ID/PW찾기</title>
</head>
<body>
<form action="findId.action" name="findId" method="post" onsubmit="return validation();">

<table align="center" width="350" border="0" cellspacing="0" cellpadding="0">
	
	<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;ID 찾기</strong></td>
	</tr>
	
</table>

<br>

<table align="center" width="350" border="0" cellspacing="0" cellpadding="0">

	<tr bgcolor="#9aafc9">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>이름</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="m_name" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#9aafc9">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>핸드폰 번호</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="m_phone" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#9aafc9">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="15">
		<td></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><input type="submit" value="ID 찾기" class="login1"/></td>
	</tr>
</table>

</form>

<br>

<form action="findPassword.action" name="findPassword" method="post" onsubmit="return validation2();">

<table align="center" width="350" border="0" cellspacing="0" cellpadding="0">
	
	<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;비밀번호 리셋</strong></td>
	</tr>
	
</table>

<br>

<table align="center" width="350" border="0" cellspacing="0" cellpadding="0">

	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="200"><font size="2"><strong>ID</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="m_email" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>이름</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="m_name" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#9aafc9">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>핸드폰 번호</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="m_phone" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="10">
		<td></td>
	</tr>
	
	<tr>
		<td align="left" colspan="2"><font size="2" color="#FF0000">*</font><font size="2"> 입력된 정보가 유효할 경우, 비밀번호가 "1111" 로 리셋 됩니다.</font></td>
	</tr>
	
	<tr height="15">
		<td></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><input type="submit" value="비밀번호 리셋" class="login1"/></td>
	</tr>
</table>
</form>
</body>
</html>