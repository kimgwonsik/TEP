<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<style type="text/css">
table.openmeet{
	width: 900px;
	text-align: center;
}
table.openmeet td{
	padding:5px;
}
tr.openmeet_head_tr{
	background-color: #FFEDED;
	font-family: sans-serif;
	font-size: small;
	font-weight: bold;
}
tr.openmeet_head_tr td{
	border-top: 3px solid red;
	border-bottom: 0.5px solid red;
	height: 30px;
}
td.openmeet_subject{
	text-align: left;
	padding-left:5px;
}
td.openmeet_subject a{
	text-decoration: none;
	color: gray;
}
td.openmeet_subject a:HOVER{
	color: red;
}
tr.openmeet_content_tr{
	font-family: sans-serif;
	font-size: small;
	color: gray;
}
tr.openmeet_content_tr td{
	border-bottom: 0.3px solid red;
	height: 25px;
}
font.openmeet_subject_kind{
	color: red;
	font-family: sans-serif;
	font-size: x-small;
	padding-right:5px;
}
</style>
</head>
<body>
<br>
<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">

	<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;모임개설보기</strong></td>
	</tr>

</table>
<br>

<table class="openmeet" align=center cellspacing=0>
 <tr class="openmeet_head_tr">
<td>강사</td>
<td width="70%">제목</td>
<td>제목</td>
<td>주제</td>
<td>등록일</td>
</tr>



<a>
<s:iterator value="Olist" status="stat">
	<s:url id="openmeetDetailURL" action="openmeetDetail">
		<s:param name="o_no">
			<s:property value="o_no"/>
		</s:param>
	</s:url>

 	
	<td><s:property value="o_no"/></td> 

	<td>
	<s:a href="%{openmeetDetailURL}">
	<s:property value="o_subject"/>
	</s:a>
	</td>
		
	<td><s:property value="o_name"/></td>
	<td><s:date name="o_date" format="yyyy.MM.dd"/></td>
	<td><s:property value="o_readcount"/></td>
	</tr>
</s:iterator>
	
	


<s:if test="Olist.size() <= 0">
	<tr>
	<td colspan="5" align="center"><h3>등록된 게시물이 없습니다.</h3></td>
	</tr>
</s:if>

<!-- 페이징 -->
<tr>
<td colspan="5" width="100%" align="center"><s:property value="pagingHtml" escape="false"/></td>
</tr>

 <!-- 게시판 검색 -->
<tr>
<td colspan="5" align="center">
	<form method="post" action="writeHistoryOmeet.action">
		<table>
		<tr>
		<td>
		<select name="searchKeyO">
			<option value="0" selected="selected">제목</option>
			<option value="1">제목+내용</option>
			<!-- <option value="2">작성자</option> -->
		</select>
		</td>
		<td><input type="text" name="searchWordO" size="15" maxlength="50" /></td>
		<td><input type="submit" value="검색" /></td>
		</tr>
		</table>
	</form>
</td>
</tr> 
</table>
</body>
</html>