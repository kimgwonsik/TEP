<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/boardwrite.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/alertify.core.css" />
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css" />
<script src="/TEP/static/js/alertify.min.js"></script>
<script src="/TEP/static/js/comments.js"></script>
<script src="/TEP/static/js/ckeditor/ckeditor.js"></script>
<script>
	window.onload = function() {
		CKEDITOR.replace('bh_content');
	}
</script>
<script type="text/javascript">
function form_action(val){
	var f = document.detail_form;
	if(val == 0){
		f.action="boardHelpModify.action";
		f.submit();
	} else if(val == 1){
		f.action="boardHelpDelete.action";
		f.submit();
	}
}
</script>
</head>
<body>

<form name="detail_form" method="post">
<input type="hidden" name="bh_no" value='<s:property value="data.bh_no"/>'>
</form>

<table class="boardwrite" align=center border="0">

<tr>
<td colspan="2" align="right" style="border:none;">
<input type="button" value="목록보기" onclick="location.href='boardHelp.action'">
</td>
</tr>

<tr>
<td class="bw_title">종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류</td>
<td  class="bw_content">
고객센터
</td>
</tr>

<tr>
<td class="bw_title">카테고리</td>
<td  class="bw_content">
<s:property value="data.bh_category1"/>
</td>
</tr>

<tr>
<td class="bw_title">세부카테고리</td>
<td class="bw_content">
<s:property value="data.bh_category2"/>
</td>
</tr>

<tr>
<td class="bw_title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
<td class="bw_content"><s:property value="data.bh_subject"/></td>
</tr>

<tr>
<td class="bw_title">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
<td>
<textarea id="bh_content" disabled="disabled"><s:property value="data.bh_content"/></textarea>
</td>
</tr>

<s:if test="#session.session_m_no != null && #session.session_m_no == data.m_no">
<tr>
<td colspan="2" align="right" style="border:none;">
<input type="button" value="수정" onclick="form_action('0');">
<input type="button" value="삭제" onclick="form_action('1');">
</td>
</tr>
</s:if>

<tr>
<td colspan="2">
</tr>

</table>

</body>
</html>