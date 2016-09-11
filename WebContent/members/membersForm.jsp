<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/TEP/static/css/boardview.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css">
<script src="/TEP/static/js/alertify.min.js"></script>
<script src="/TEP/static/js/jquery-3.1.0.js"></script>
<title>회원가입</title>
<script type="text/javascript">
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
	var eng_check = /^[A-za-z]/g;
	var num_check = /^[0-9]*$/;
	var phone_check1 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var phone_check2 = /^\d{2,3}-\d{3,4}-\d{4}$/;
	
	function insert() {

		var join = document.userinput

		if (join.m_email.value == "") {
			alertify.error("이메일을 입력해주세요");
			join.m_email.focus();
			return false;
		}
		
		if (!join.m_email.value.match(regExp)) {
			alertify.error("이메일 형식과 맞지 않습니다.");
			userinput.m_email.focus();
			return false;
		}
		
		if (join.m_name.value == "") {
			alertify.error("이름을 입력해주세요");
			join.m_name.focus();
			return false;
		}
		
		if (join.m_name.value.match(num_check)) {
			alertify.error("이름에는 숫자가 포함될수 없습니다.");
			join.m_name.focus();
			return false;
		}
		
		if (join.m_nickname.value == "") {
			alertify.error("닉네임을 입력해주세요");
			join.m_nickname.focus();
			return false;
		} 
		
		if (join.m_password.value == "") {
			alertify.error("비밀번호를 입력해주세요");
			join.m_password.focus();
			return false;
		} 
		
		if (userinput.m_password.value.length < 4) {
			alertify.error("최소 4자리 이상 입력해주세요!");
			userinput.m_password.focus();
			return false;
		}
		
		if (join.m_phone.value == "") {
			alertify.error("전화번호를 입력해주세요");
			join.m_phone.focus();
			return false;
		}

		if(!join.m_phone.value.match(phone_check1) && !join.m_phone.value.match(phone_check2)){
			alertify.error("전화번호 형식이 잘못되었습니다. 다시 입력해주세요.");
			alertify.log("예) 010-1234-1234<br> 또는 02-123-1234");
			join.m_phone.focus();
			return false;
		}

		join.submit();
	}

	function openConfirmId(userinput) {
		var url = "membersIdChk.action?m_email=" + document.userinput.m_email.value;
		var join = document.userinput;
		if (!userinput.m_email.value.match(regExp)) {
			alertify.error("이메일 형식과 맞지 않습니다.");
			userinput.m_email.focus();
			return false;
		}
		if (join.m_email.value == "") {
			alertify.error("아이디를 입력해주세요");
			join.m_email.focus();
			return false;
		}
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
	}
</script>

<style type="text/css">
.memform_table input{
	width: 250px;
}
.memform_table td {
	text-align: right;
}
table.memform_table {
	border:1px solid red;
	padding:1%;
}
</style>

</head>
<body style="font-family: sans-serif;">
	<center>
		<h3>
			<font size="4">회원가입 정보입력</font>
		</h3>
		<br>
		<form method="post" action="InsertMembers.action" name="userinput">
			<table class="memform_table" border="0" cellpadding="6" cellspacing="0">
				<tr>
					<td>
						<font color="red">*</font> ID(이메일)
					</td>
					<td>
						<input type="text" name="m_email" id="m_email" style="ime-mode: disabled" maxlength="23">
					</td>
					<td>
						<input style="width:70px;" type="button" name="confirmId" value="ID 중복" onclick="openConfirmId(this.form)"/>
					</td>
				</tr>
				<tr>
					<td>
						<font color="red">*</font> 이름
					</td>
					<td>
						<input type="text" name="m_name" id="m_name"  maxlength="9">
					</td>
				</tr>
				<tr>
					<td>
						<font color="red">*</font> 닉네임
					</td>
					<td>
						<input type="text" name="m_nickname" id="m_nickname"  maxlength="13">
					</td>
				</tr>
				<tr>
					<td>
						<font color="red">*</font> 패스워드
					</td>
					<td>
						<input type="password" name="m_password" id="m_password" placeholder=" 4자리 이상  입력해주세요"  maxlength="15">
					</td>
				</tr>
				<tr>
					<td>
						<font color="red">*</font> 전화번호
					</td>
					<td>
						<input type="text" name="m_phone" id="m_phone" placeholder="ex) 010-1234-1234"  maxlength="13">
					</td>
				</tr>
				<tr>
					<td>소속</td>
					<td>
						<input type="text" name="m_company" id="m_company"  maxlength="13">
					</td>
				</tr>
				<tr>
					<td>관심 지역</td>
					<td>
						<input type="text" name="m_fav_area" id="m_fav_area"  maxlength="13">
					</td>
				</tr>
				<tr>
					<td>관심 분야</td>
					<td>
						<input type="text" name="m_fav_field" id="m_fav_field"  maxlength="13">
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<input type="button" style="width: 113px" value="취소" onclick="window:location='main.action'">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" style="width: 113px" value="등록" onclick="insert()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
