<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.util.Date" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원가입</title>
<script type="text/javascript">
function insert(){
	var f=document.frm;
	f.submit();		
}
function list(){
	location.href='http://localhost:8060/TEP/main.action';
}
</script>
</head>
<body>
<center>
<h3>사원정보등록</h3>
<form method="post" action="http://localhost:8060/TEP/insertMembers.action" name="frm">
	<table border="1" bordercolor="#ccccff" cellpadding="0" cellspacing="0" width="300" height="300">
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" name="m_email">
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="m_name">
			</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>
				<input type="text" name="m_nickname">
			</td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td>
				<input type="password" name="m_password">
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" name="m_phone">
			</td>
		</tr>
		<tr>
			<td>관심 지역</td>
			<td>
				<input type="text" name="m_fav_area">
			</td>
		</tr>
		<tr>
			<td>관심 분야</td>
			<td>
				<input type="text" name="m_fav_field">
			</td>
		</tr>
		<tr>
			<td>가입 날짜</td>
			<td>
				<input type="date" name="m_date">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="등록" onclick="insert()">
				<input type="button" value="취소" onclick="list()">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>
