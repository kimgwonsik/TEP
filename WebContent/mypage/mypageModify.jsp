<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/boardview.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css">
<script src="/TEP/static/js/alertify.min.js"></script>
<script src="/TEP/static/js/jquery-3.1.0.js"></script>
<title></title>
<script type="text/javascript">
function check(){
	 var join=document.userinput

	    if(join.m_name.value==""){
	    	alertify.error("이름을 입력해주세요");
	    	join.m_name.focus();
	    	return false;
	    }
	    else if(join.m_nickname.value==""){
	    	alertify.error("닉네임을 입력해주세요");
	    	join.m_nickname.focus();
	    	return false;
	    }
	    else if(join.m_password.value==""){
	    	alertify.error("비밀번호를 입력해주세요");
	    	join.m_password.focus();
	    	return false;
	    }
	    else if(join.m_password.value != join.m_password1.value){
	    	alertify.error("비밀번호가 틀립니다 다시 확인해주세요.");
	    	join.m_password1.focus();
	    	return false;
	    }
	    else if(join.m_phone.value==""){
	    	alertify.error("핸드폰 번호를 입력해주세요");
	    	join.m_phone.focus();
	    	return false;
	    }

	    if(userinput.m_password.value.length < 4){
	    	alertify.error("최소 4자리 이상 입력해주세요!");
	    	userinput.m_password.value= "";
	   	 	userinput.m_password.focus();
	   	 	return false;
	  	}
	    
		var f=document.userinput;
		f.submit();
}
</script>

</head>
<body>
<br>
<table align="center" width="920" border="0" cellspacing="0" cellpadding="0">

	<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;회원 수정</strong></td>
	</tr>

</table>
<br>
<form action="modifyMember.action" name="userinput" method="post">
<table border="0" bordercolor="#FF2929" cellpadding="0" cellspacing="0" width="600" height="300" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td><font color="red">*</font> ID(이메일)</td>
			<td>
				<input type="text" name="m_email" id="m_email" size="50%" value="${session.session_m_email }">
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> 이름</td>
			<td>
				<input type="text" name="m_name" id="m_name" size="50%" value="${resultClass.m_name}">
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> 닉네임</td>
			<td>
				<input type="text" name="m_nickname" id="m_nickname" size="50%" value="${resultClass.m_nickname}">
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> 패스워드</td>
			<td>
				<input type="password" name="m_password" id="m_password" size="50%">
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> 패스워드 확인</td>
			<td>
				<input type="password" name="m_password1" id="m_password1" size="50%">
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> 전화번호</td>
			<td>
				<input type="text" name="m_phone" id="m_phone" size="50%" value="${resultClass.m_phone}">
			</td>
		</tr>
		<tr>
			<td>   소속</td>
			<td>
				<input type="text" name="m_company" id="m_company" size="50%" value="${resultClass.m_company}">
			</td>
		</tr>
		<tr> 
			<td>   관심 지역</td>
			<td>
				<input type="text" name="m_fav_area" id="m_fav_area" size="50%" value="${resultClass.m_fav_area}">
			</td>
		</tr>
		<tr>
			<td>   관심 분야</td>
			<td>
				<input type="text" name="m_fav_field" id="m_fav_field" size="50%" value="${resultClass.m_fav_field}">
			</td>
		</tr>
	</table>

<br>
<br>

<table align="center" width="385" border="0" cellspacing="0" cellpadding="0">
	
	<tr>
		<td align=center>
			<input type="reset" value="리셋" class="inputb"/>
			<input type="button" value="수정" onclick="check()">
		</td>
	</tr>
	
</table>
</form>
</body>
</html>