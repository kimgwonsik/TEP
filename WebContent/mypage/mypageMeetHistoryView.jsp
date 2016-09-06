<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/openmeetview.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
</head>
<body>
<br>
<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">

	<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;모임참여내역</strong></td>
	</tr>

</table>
<br>
<table border="0" width=900px cellpadding=15 align=center>
<tr>

<!-- 모임 리스트 -->
<td width="80%">

<table border="0" width=100% cellpadding=5>

<br>
<!-- <tr>
<td colspan="3"><font style="font-weight: bold;font-size: x-large;">모임참여내역</font></td>
</tr> -->

<s:iterator value="list" status="stat">
	<s:url id="openmeetDetailURL" action="openmeetDetail">
		<s:param name="o_no">
			<s:property value="o_no"/>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>
		</s:param>
	</s:url>
	
	<s:if test="#stat.index%3 == 0">
	<tr>
	</s:if>
	
	<td width="33%" align="center">
		<s:a cssClass="contentSubject" href="%{openmeetDetailURL}">
			<img class="openmeet_rep" src='<s:property value="o_rep_img"/>'/>
			<br><font style="font-family: sans-serif;"><s:property value="o_subject"/></font>
		</s:a>
	</td>
</s:iterator>
	
<s:if test="list.size() <= 0">
	<tr>
	<td width=100%  align="center"><h3>등록된 게시물이 없습니다.</h3></td>
	</tr>
</s:if>

<!-- 페이징 -->
<tr>
<td colspan="3" width="100%" align="center"><s:property value="pagingHtml" escape="false"/></td>
</tr>

</table>

<td>

</table>
</body>
</html>