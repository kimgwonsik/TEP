<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/boardwrite.css" type="text/css">
<script src="/TEP/static/js/ckeditor/ckeditor.js"></script>
<script>
	window.onload = function() {
		CKEDITOR.replace('b_content');
	}
</script>
<script type="text/javascript">
function formAction(val){
	var f = document.form;
	switch(val){
	case 0://수정
		f.action="boardModify.action";
		f.submit();
		break;
	case 1://삭제
		f.action="boardDelete.action";
		f.submit();
		break;
	}
}
</script>
</head>
<body>

<form name="form" method="post">
<input type="hidden" name="b_no" value='<s:property value="data.b_no"/>'>
<table class="boardwrite" align=center border="0">
<tr>
<td class="bw_title">종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류</td>
<td  class="bw_content">
<s:if test="data.b_kind == 0">
일반
</s:if>
<s:elseif test="data.b_kind == 1">
스승찾기
</s:elseif>
<s:elseif test="data.b_kind == 2">
제자찾기
</s:elseif>
</td>
</tr>

<tr>
<td class="bw_title">카테고리</td>
<td  class="bw_content">
<s:property value="data.b_category"/>
</td>
</tr>

<tr>
<td class="bw_title">관심분야</td>
<td class="bw_content">
<s:property value="data.b_fav_field"/>
</td>
</tr>

<tr>
<td class="bw_title">관심지역</td>
<td class="bw_content">
<s:property value="data.b_fav_area"/>
</td>
</tr>

<tr>
<td class="bw_title">비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
<td class="bw_content"><s:property value="data.b_payment"/>원</td>
</tr>

<tr>
<td class="bw_title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
<td class="bw_content"><s:property value="data.b_subject"/></td>
</tr>

<tr>
<td class="bw_title">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
<td>
<textarea id="b_content" disabled="disabled"><s:property value="data.b_content"/></textarea>
</td>
</tr>

<s:if test="#session.session_m_email != null">
<tr>
<td colspan="2" align="right" style="border:none;">
<input type="button" value="수정" onclick="formAction('0');">
<input type="button" value="삭제" onclick="formAction('1');">
</td>
</tr>
</s:if>

</table>
</form>

</body>
</html>