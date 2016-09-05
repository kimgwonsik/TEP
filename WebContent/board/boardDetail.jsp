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
		CKEDITOR.replace('b_content');
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
<input type="hidden" name="b_no" value='<s:property value="data.b_no"/>'>
</form>

<table class="boardwrite" align=center border="0">

<tr>
<td colspan="2" align="right" style="border:none;">
<input type="button" value="목록보기" onclick="location.href='board.action'">
</td>
</tr>

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
<td class="bw_content">
<s:if test="data.b_payment == 0">
무료
</s:if>
<s:else>
<s:property value="data.b_payment"/>원</td>
</s:else>
</tr>

<tr>
<td class="bw_title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
<td class="bw_content"><s:property value="data.b_subject"/></td>
</tr>

<tr>
<td colspan="2">
<textarea id="b_content" disabled="disabled"><s:property value="data.b_content"/></textarea>
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
<!-- 댓글 -->
<div style="font-weight: bold;font-size:small;padding-top: 10px">댓글(<s:property value="cmtData.size()"/>)</div>
<hr class="om_detail_hr">
<s:form action="board_insert_cmt" onsubmit="return cmt_check('1');" method="post">
<input type="hidden" name="b_no" value='<s:property value="b_no"/>'>
<div style="padding-right:6px;padding-bottom:5px;"><textarea id="cmt_content" name="c_content" class="om_detail_comments"></textarea></div>
<div align="right"><input type="submit" value="내용입력"></div>
</s:form>

<s:form action="board_delete_cmt" method="post" name="cmt_delete_form">
<s:iterator value="cmtData" status="cmtStat">
<hr class="om_detail_hr">
<div style="padding-left:13px;font-weight: bold;font-family: sans-serif;font-size: x-small;">
<s:property value="c_name"/>

<!-- 댓글 삭제 -->
<input type="hidden" name="c_no" value="<s:property value="c_no"/>">
<input type="hidden" name="b_no" value="<s:property value="b_no"/>">
<s:if test="#session.session_m_no != null && #session.session_m_no == m_no">
<span style="float:right;">
<s:a href="#" onclick="document.cmt_delete_form.submit();">삭제</s:a>
</span>
</s:if>

</div>
<div style="padding-top:5px; padding-left:13px;font-family: monospace;font-size: x-small;"><s:property value="c_content"/></div>
</s:iterator>
</s:form>
</td>
</tr>

</table>

</body>
</html>