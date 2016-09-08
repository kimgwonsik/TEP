<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/boardwrite.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/alertify.core.css">
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css">
<script src="/TEP/static/js/alertify.min.js"></script>
<script src="/TEP/static/js/ckeditor/ckeditor.js"></script>
<script>
	window.onload = function() {
		CKEDITOR.replace('bh_content');
		
		var f = document.mForm;
		f.bh_category1.value='<s:property value="data.bh_category1"/>';
		f.bh_category2.value='<s:property value="data.bh_category2"/>';
	}
</script>
</head>
<body>
<form id="mForm" action="HelpUpdate.action" method="post" onsubmit="return valuecheck();">
<input type="hidden" name="bh_no" value="<s:property value="data.bh_no"/>">

<table style="width:890px;" border="0" align=center>
<tr>
<td style="font-weight: bold;font-size: large;font-family: sans-serif;">문의내역 수정하기</td>
<td align="right"><input type="button" value="목록보기" onclick="location.href='helpHistory.action'"></td>
</tr>
</table>

<table class="boardwrite" align=center border="0">
<tr>
<td class="bw_title">카테고리</td>
<td>
<select name="bh_category1">
	<option value="문의하기">문의하기</option>
	<option value="신고하기">신고하기</option>
</select>
</td>
</tr>

<tr>
<td class="bw_title">세부카테고리</td>
<td>
<select name="bh_category2">
	<optgroup label="문의하기">
	<option value="광고">광고</option>
	<option value="기능">기능</option>
	<option value="오류">오류</option>
	<option value="제안">제안</option>
	<option value="장소">장소</option>
	<option value="기타">기타</option>
	</optgroup>
	<optgroup label="신고하기">
	<option value="허위광고">허위광고</option>
	<option value="명예훼손/욕설/음란">명예훼손/욕설/음란</option>
	<option value="개인정보노출">개인정보노출</option>
	<option value="저작권위반">저작권위반</option>
	<option value="기타">기타</option>
	</optgroup>
</select>
</td>
</tr>

<tr>
<td class="bw_title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
<td><input id="bh_subject" type="text" name="bh_subject" size=50 maxlength="25" value='<s:property value="data.bh_subject"/>'></td>
</tr>

<tr>
<td colspan="2"><textarea id="bh_content" name="bh_content"><s:property value='data.bh_content' escape='false'/></textarea></td>
</tr>

<tr>
<td colspan="2" align="right" style="border:none;">
<input type="submit" value="저장">
<input type="button" value="취소" onclick="location.href='helpHistory.action'">
</td>
</tr>

</table>
</form>

</body>
</html>