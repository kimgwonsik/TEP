<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원 탈퇴</title>
<script language="javascript">
function check(){
	if(document.modifyPwChk.password.value==""){
		alert("비밀번호를 입력하세요");
		document.modifyPwChk.m_password.focus();
		return false;
	}
	return true;
}
</script>
<link rel="stylesheet" href="/TEP/static/css/menubar.css" type="text/css">
</head>
<body>
<nav id="topMenu" >
   <ul>
      <li><a class="menuLink" href="mypageView.action">마이페이지 홈</a></li>
      <li><a class="menuLink" href="modifyPwChk.action">회원정보수정</a></li>
      <li><a class="menuLink" href="#">내가쓴글보기</a></li>
      <li><a class="menuLink" href="#">모임참여내역</a></li>
      <li><a class="menuLink" href="#">고객센터</a></li>
      <li><a class="menuLink" href="deleteMemberForm.action">회원탈퇴</a></li>
   </ul>
</nav>
<form name="modifyPwChk" action="modifyMemberForm.action" method="post" onsubmit="return check();">

<br>
<br>

<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">

	<tr height="25">
			<td bgcolor="#ff8c00" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;회원정보 수정</strong></td>
	</tr>

</table>

<br>
<br>

<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	
	<tr bgcolor="#888888">
		<td height="1"></td>
	</tr>
	
	<tr height="20">
		<td></td>
	</tr>
	
	<tr align="center">
		<td align="center"><font size="2">비밀번호를 입력하세요</font><br><br><input type="text" name="m_password" maxlength="20"/></td>
	</tr>
	
	<tr height="20">
		<td></td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1"></td>
	</tr>
	
</table>

<br>

<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

	<tr>
		<td align="center">
			<input type="submit" value="계속" class="inputb"/>
			<input type="button" value="취소" onclick="history.go(-1)" class="inputb"/>
		</td>
	</tr>
	
</table>

<br>
<br>

</body>
</html>