<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/TEP/static/css/boardview.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<style type="text/css">
table.login_table{
	border-style: solid;
	border-color: red;
	border-width: thin;
	padding: 2%;
}
td.login_title{
	text-align: center;
	font-family: sans-serif;
	font-weight: bold;
	font-size: 28px;
}
td.login_btn_grp{
	padding-top:30px;
	text-align: center;
}
input.login_btn{
	width: 150px;
	height: 50px;
}
</style>
</head>
<body>
<br>

<table class="login_table" align=center>

<tr>
<td class="login_title">로그인에 성공 하였습니다.</td>
</tr>

<tr>
<td class="login_btn_grp">
<input class="login_btn" type="button" value="메인으로" onclick="location.href='main.action'">
<s:if test="#session.save_current_page_uri != null">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input class="login_btn" type="button" value="이전 페이지" onclick="location.href='<s:property value="#session.save_current_page_uri"/>'">
</s:if>
</td>
</tr>

</table>

<br>
</body>
</html>
