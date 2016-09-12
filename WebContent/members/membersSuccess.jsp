<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/TEP/static/css/boardview.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<style type="text/css">
table.login_table {
	border-style: solid;
	border-color: red;
	border-width: thin;
	padding: 3%;
}

td.login_name {
	text-align: center;
	font-family: sans-serif;
	font-weight: bold;
	font-size: 19px;
}

b.login_msg{
	font-family: sans-serif;
	color: olive;
}

td.login_btn_grp {
	padding-top: 30px;
	text-align: center;
}

input.login_btn {
	width: 100px;
	height: 50px;
}
</style>

<script type="text/javascript">
	window.onload = function () {
		var msg = [
		           '모임을 개설하여 친구들을 만나보세요~!',
		           'TEP에서 좋은인연 만들어 보세요!',
		           '모두에게 재능을 전파해보세요^^',
		           '모임은 또다른 친구 입니다!',
		           '모임 개설을 망설이지 마세요^-^',
		           ];
		var rnum = Math.floor(Math.random() * msg.length);
		
		document.getElementById("login_msg").innerHTML = "<b class='login_msg'>"+msg[rnum]+"</b>";
	}
</script>

</head>
<body>
	<br>

<table class="login_table" align=center>

	<tr>
		<td class="login_name">
			회원가입에 성공했습니다.
		</td>
	</tr>
	<tr>
		<td id="login_msg" align="center" height="30"></td>
	</tr>

	<tr>
		<td class="login_btn_grp">
			<input class="login_btn" type="button" value="마이페이지" onclick="location.href='mypageView.action'">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input class="login_btn" type="button" value="메인으로" onclick="location.href='main.action'">
		</td>
	</tr>

</table>

	<br>
</body>
</html>
