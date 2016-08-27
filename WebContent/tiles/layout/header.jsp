<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/header.css" type="text/css">
</head>
<body>

<div class="loginBar">
<span style="float:left;padding-left:10px;">
<a href="openmeet.action">모임</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="lendplace.action">장소</a>
</span>
<span>
	<a href="#">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	<a href="#">마이페이지</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	<a href="#">사이트맵</a>&nbsp;&nbsp;
</span>
</div>

	<table class="searchBar" align=center>
		<tr>
			<td class="logo">
				<a href="main.action">
					<img border="0" width="90px" src="/TEP/main/image/tep_logo_red.png" />
				</a>
			</td>
			<td style="padding-right: 10px; padding-left: 20px;">
				<input type="text" name="totalSearchKeyword" size="50">
			</td>
			<td>
				<input type="button" name="totalSearchBtn" value="검색">
			</td>
		</tr>
	</table>

	<hr color=red class="header">
<br>
</body>
</html>