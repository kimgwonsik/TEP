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
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;${session.session_m_name } 님의 정보</strong></td>
	</tr>

</table>
<br>
<table border="0" bordercolor="#FF2929" cellpadding="0" cellspacing="0" width="600" height="300" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td>ID(이메일) : </td>
			<td>
				${session.session_m_email }
			</td>
		</tr>
		<tr>
			<td>이름 : </td>
			<td>
				${resultClass.m_name}
			</td>
		</tr>
		<tr>
			<td>닉네임 :</td>
			<td>
				${resultClass.m_nickname}
			</td>
		</tr>
		<tr>
			<td>전화번호 :</td>
			<td>
				${resultClass.m_phone}
			</td>
		</tr>
		<tr>
			<td>소속 :</td>
			<td>
				${resultClass.m_company}
			</td>
		</tr>
		<tr> 
			<td>관심 지역 :</td>
			<td>
				${resultClass.m_fav_area}
			</td>
		</tr>
		<tr>
			<td>관심 분야 :</td>
			<td>
				${resultClass.m_fav_field}
			</td>
		</tr>
	</table>

<br>
<br>

</body>
</html>