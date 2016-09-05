<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<style type="text/css">
table.comments{
	width: 900px;
	text-align: center;
}
table.comments td{
	padding:5px;
}
tr.comments_head_tr{
	background-color: #FFEDED;
	font-family: sans-serif;
	font-size: small;
	font-weight: bold;
}
tr.comments_head_tr td{
	border-top: 3px solid red;
	border-bottom: 0.5px solid red;
	height: 30px;
}
td.comments_subject{
	text-align: left;
	padding-left:5px;
}
td.comments_subject a{
	text-decoration: none;
	color: gray;
}
td.comments_subject a:HOVER{
	color: red;
}
tr.comments_content_tr{
	font-family: sans-serif;
	font-size: small;
	color: gray;
}
tr.comments_content_tr td{
	border-bottom: 0.3px solid red;
	height: 25px;
}
font.comments_subject_kind{
	color: red;
	font-family: sans-serif;
	font-size: x-small;
	padding-right:5px;
}
</style>
</head>
<body>

<br>

<table class="comments" align=center cellspacing=0>
 <tr class="comments_head_tr">
<td>작성자</td>
<td width="55%">제목</td>
<td>번호</td>
<td>등록일</td>

</tr> 

<s:iterator value="Clist" status="stat">
	
	
	<tr>
	<td><s:property value="c_name"/></td>
	<td><s:property value="c_content"/></td>
	<td><s:property value="c_no"/><td> 
	<td><s:property value="c_my_no"/><td> 
	<td><s:property value="c_date"/> 
	</tr>
</s:iterator>

<s:if test="Clist.size() <= 0">
	<tr>
	<td colspan="5" align="center"><h3>등록된 게시물이 없습니다.</h3></td>
	</tr>
</s:if>

<!-- 페이징 -->
<tr>
<td colspan="5" width="100%" align="center"><s:property value="pagingHtml" escape="false"/></td>
</tr>

</table>
</body>
</html>