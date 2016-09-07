<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
	}
	
	function valuecheck(){
		var subject = document.getElementById("bh_subject");
		var content = CKEDITOR.instances.bh_content;
		
		if(!subject.value){
			alertify.error("제목이 입력되지 않았습니다.");
			subject.focus();
			return false;
		}
		
		if(!content.getData()){
			alertify.error("내용이 입력되지 않았습니다.");
			content.focus();
			return false;
		}
	}
</script>
</head>
<body>

<form id="writeForm" action="helpWriteInsert.action" method="post" onsubmit="return valuecheck();">
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
<td><input id="bh_subject" type="text" name="bh_subject" size="50" maxlength="25"></td>
</tr>

<tr>
<td colspan="2"><textarea id="bh_content" name="bh_content"></textarea></td>
</tr>

<tr>
<td colspan="2" align="right" style="border:none;">
<input type="submit" value="저장">
<input type="button" value="취소" onclick="location.href='boardHelp.action'">
</td>
</tr>

</table>
</form>

</body>
</html>