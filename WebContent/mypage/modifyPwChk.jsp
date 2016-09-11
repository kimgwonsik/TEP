<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript">
	function check() {
		if (document.modifyPwChk.password.value == "") {
			alert("비밀번호를 입력하세요");
			document.modifyPwChk.m_password.focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body>
	<form name="modifyPwChk" action="modifyMemberForm.action" method="post" onsubmit="return check();">
		<br>
		<table align="center" width="920" border="0" cellspacing="0" cellpadding="0">
			<tr height="25">
				<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
				<td align="left" colspan="3">
					<strong>&nbsp;&nbsp;회원정보 수정</strong>
				</td>
			</tr>
		</table>
		<br>

		<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

			<tr bgcolor="#FF2929">
				<td height="1"></td>
			</tr>

			<tr height="20">
				<td></td>
			</tr>

			<tr align="center">
				<td align="center">
					<font size="2">비밀번호를 입력하세요</font><br>
					<br>
					<input type="password" name="m_password" maxlength="20" />
				</td>
			</tr>

			<tr height="20">
				<td></td>
			</tr>

			<tr bgcolor="#FF2929">
				<td height="1"></td>
			</tr>

		</table>

		<br>

		<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

			<tr>
				<td align="center">
					<input type="submit" value="수   정" class="inputb" style="width: 130px;" />
				</td>
			</tr>

		</table>

		<br> <br>
</body>
</html>