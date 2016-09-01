<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>이용약관</title>
<SCRIPT type="text/javascript">
function check_agree(form) {
	if (!form.agree.checked) {
	alert('이용 약관에 동의 후 회원가입을 진행하실 수 있습니다.');
	form.agree.focus();
	return false;
} else if (!form.agree2.checked) {
	alert('개인 정보 수집에 동의 후 회원가입을 진행하실 수 있습니다.');
	form.agree2.focus();
	return false;
}
	document.f.submit();
}
</SCRIPT>
</head>
<body>
<br>
<br>
<form action="MembersForm.action" method="post" name="f">
<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">
	
	<tr height="25">
		<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
		<td align="left" colspan="3"><strong>&nbsp;&nbsp;이용 약관</strong></td>
	</tr>
	
	<tr height="25">
		<td></td>
	</tr>
	
	<tr align="center" bgcolor="#888888" height="1">
		<td colspan="4"></td>
	</tr>
	
</table>
	
<br>
<br>
	
<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">

<tr align="center">
	<td align="center">
		<textarea align="left" wrap="hard" theme="simple" rows="10" cols="90" readonly>개인 회원 약관 (개정 2016. 08. 04 / 적용 2016. 08. 04)
이용약관
</textarea>
	</td>
</tr>

<tr height="20">
	<td></td>
</tr>

<tr align="center">
	<td align="center"><input type="checkbox" name="agree" value="anything"><font size="2"> 위 이용 약관에 동의합니다.</font></td>
</tr>

<tr height="20">
	<td></td>
</tr>
	
<tr align="center" bgcolor="#888888" height="1">
	<td colspan="4"></td>
</tr>

</table>

<br>
<br>
<br>
<br>

<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">

	<tr height="25">
		<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
		<td align="left" colspan="3"><strong>&nbsp;&nbsp;개인 정보 수집</strong></td>
	</tr>
	
	<tr height="25">
		<td></td>
	</tr>
	
	<tr align="center" bgcolor="#888888" height="1">
		<td colspan="4"></td>
	</tr>
	
</table>

<br>
<br>

<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">

<tr align="center">
	<td align="center">
		<textarea align="left" wrap="hard" theme="simple" rows="10" cols="90" readonly>1. 개인정보는 어디에 이용되나요?
		동의함?
		</textarea>
	</td>
</tr>

<tr height="20">
	<td></td>
</tr>

<tr align="center">
	<td align="center"><input type="checkbox" name="agree2" value="anything"><font size="2"> 위 개인 정보 수집에 동의합니다.</font></td>
</tr>

<tr height="20">
	<td></td>
</tr>
	
<tr align="center" bgcolor="#888888" height="1">
	<td colspan="4"></td>
</tr>

</table>

<br>
<br>
<br>
<br>

<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">

<tr align="center">

	<td align="center">
			<input type="button" value="회원가입진행" class="login1" onClick="return check_agree(this.form);"/>
	</td>
	
	<td align="center">
			<input type="button" value="회원가입취소" class="login1" onClick="window:location='loginForm.action'"/>
	</td>
	
</tr>
</table>
</form>


<br>
<br>

</body>
</html>