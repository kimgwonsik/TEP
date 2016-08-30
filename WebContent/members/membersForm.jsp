<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원가입</title>
<script type="text/javascript">
var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
function insert(){
    	  
    var join=document.userinput
    
    if(join.m_email.value==""){
    	alert("아이디를 입력해주세요");
    	join.m_email.focus();
    	return false;
    }
    else if(join.m_name.value==""){
    	alert("이름을 입력해주세요");
    	join.m_name.focus();
    	return false;
    }
    else if(join.m_nickname.value==""){
    	alert("닉네임을 입력해주세요");
    	join.m_nickname.focus();
    	return false;
    }
    else if(join.m_password.value==""){
    	alert("비밀번호를 입력해주세요");
    	join.m_password.focus();
    	return false;
    }
    else if(join.m_phone.value==""){
    	alert("핸드폰 번호를 입력해주세요");
    	join.m_phone.focus();
    	return false;
    }
 
    
    if(!userinput.m_email.value.match(regExp)){
    	alert("이메일 형식과 맞지 않습니다.");
    	userinput.m_email.value = "";
    	userinput.m_email.focus();
    	return false;
    }
    
    if(userinput.m_password.value.length < 4){
    	alert("최소 4자리 이상 입력해주세요!");
    	userinput.m_password.value= "";
   	 	userinput.m_password.focus();
   	 	return false;
  	}
    
	var f=document.userinput;
	f.submit();
}

function openConfirmId(userinput){
	var url="membersIdChk.action?m_email="+document.userinput.m_email.value;
	var join=document.userinput;
	if(!userinput.m_email.value.match(regExp)){
    	alert("이메일 형식과 맞지 않습니다.");
    	userinput.m_email.value = "";
    	userinput.m_email.focus();
    	return false;
    }
	if(join.m_email.value==""){
		alert("아이디를 입력해주세요");
		join.m_email.focus();
		return false;
	}
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}

</script>
</head>
<body>
<center>
<h3>회원가입 정보입력</h3>
<form method="post" action="InsertMembers.action" name="userinput">
	<table border="1" bordercolor="#ccccff" cellpadding="0" cellspacing="0" width="300" height="300">
		<tr>
			<td>ID(이메일)</td>
			<td>
				<input type="text" name="m_email" id="m_email">
				<input type="button" name="confirmId" value="ID 중복확인" onclick="openConfirmId(this.form)" class="topb"/>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="m_name" id="m_name">
			</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>
				<input type="text" name="m_nickname" id="m_nickname">
			</td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td>
				<input type="password" name="m_password" id="m_password">
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" name="m_phone" id="m_phone">
			</td>
		</tr>
		<tr>
			<td>소속</td>
			<td>
				<input type="text" name="m_company" id="m_company">
			</td>
		</tr>
		<tr>
			<td>관심 지역</td>
			<td>
				<input type="text" name="m_fav_area" id="m_fav_area">
			</td>
		</tr>
		<tr>
			<td>관심 분야</td>
			<td>
				<input type="text" name="m_fav_field" id="m_fav_field">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="등록" onclick="insert()">
				<input type="button" value="취소" onclick="window:location='main.action'">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>
