<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/TEP/static/css/boardview.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<title>아이디 중복 확인</title>
<script language="javascript">
function windowclose(){
	opener.document.userinput.m_email.value="${m_email}";
	/* opener.document.joinForm.checkConfirmId.value="true"; */
	window.close();
}

function check(){
	if(idChk.m_email.value==""){
		alert("아이디를 입력해 주세요");
		idChk.m_email.focus();
		return false;
	}
	
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	if(!idChk.m_email.value.match(regExp)){
		alert("이메일 형식과 맞지 않습니다.");
		idChk.m_email.value = "";
		idChk.m_email.focus();
		return false;
	}
}
</script>
</head>
<body>
<s:if test="chkId==1">

	<form name=idChk onsubmit="return check();">
	
	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	
		<tr height="25">
			<td bgcolor="red" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="red"><strong>&nbsp;&nbsp;ID 중복</strong></font></td>
		</tr>
	
	</table>

	<br>

	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	
		<tr bgcolor="red">
			<td height="1"></td>
		</tr>
		
		<tr height="10">
			<td></td>
		</tr>
		
		<tr>
			<td><font color="red">"${m_email }" 는 이미 사용중인 아이디입니다. 다른 아이디를 선택해 주세요</font></td>
		</tr>
		
		<tr height="10">
			<td></td>
		</tr>
		
		<tr bgcolor="red">
			<td height="1"></td>
		</tr>
	
	</table>
	
	<br>
	<br>

	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

		<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;ID 중복 확인</strong></font></td>
		</tr>

	</table>

	<br>

	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	
		<tr bgcolor="#FF2929">
			<td height="1"></td>
		</tr>
	
		<tr height="10">
			<td></td>
		</tr>
	
		<tr align="center">
			<td>
				<input type=text maxlength=20 name="m_email"/>
				<input type=submit value="ID 중복확인" class="topb"/>
			</td>
		<tr>
		
		<tr height="10">
			<td></td>
		</tr>
	
		<tr bgcolor="#FF2929">
			<td height="1"></td>
		</tr>
	
		<tr height="20">
			<td></td>
		</tr>
		
		<tr>
			<td align="center"><input type="button" class="login1" value="닫기" onclick="javascript:window.close();"/></td>
		</tr>
		
	</table>

	</form>
	
</s:if>

<s:else>

	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

		<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;사용 가능</strong></font></td>
		</tr>

	</table>

	<br>

	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	
		<tr bgcolor="#FF2929">
			<td height="1"></td>
		</tr>
	
		<tr height="10">
			<td></td>
		</tr>
		
		<tr>
			<td>입력하신 "${m_email}" 는 사용할 수 있는 아이디입니다.</td>
		</tr>
		
		<tr height="10">
			<td></td>
		</tr>
		
		<tr bgcolor="#FF2929">
			<td height="1"></td>
		</tr>
		
		<tr height="20">
			<td></td>
		</tr>
		
		<tr>
			<td align="center"><input type="button" style="width: 113px" class="login1" value="닫기" onclick="javascript:window.close();"/></td>
		</tr>
	</table>
</s:else>
</body>
</html>