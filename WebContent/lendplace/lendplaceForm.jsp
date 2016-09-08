<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/openmeetform.css">
<link rel="stylesheet" href="/TEP/static/js/dtpicker/jquery.simple-dtpicker.css">
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css">
<script src="/TEP/static/js/alertify.min.js"></script>
<script src="/TEP/static/js/dtpicker/jquery-1.7.1.js"></script>
<script src="/TEP/static/js/dtpicker/jquery.simple-dtpicker.js"></script>
<script src="/TEP/static/js/ckeditor/ckeditor.js"></script>
<script src="/TEP/static/js/openmeetform.js"></script>

<script>
	window.onload = function() {
		CKEDITOR.replace('l_content',{
				'filebrowserUploadUrl':'ckeditorImageUpload.action'
		});
	}
</script>

</head>
<body>

<table border="0" width=890px align=center>
<tr>
<td style="font-weight: bold;font-size: large;font-family: sans-serif;">관리자 대관장소 등록</td>
</tr>
</table>

<s:form name="omf_form" action="lendplaceFormInsert" method="post" enctype="multipart/form-data" theme="simple">
<table class="omf_table_root" border="0" width=890px align=center>

<tr>
<td class="td_title">장소명</td>
<td>
<input type="text" name="l_subject" />
</td>
</tr>

<tr>
<td class="td_title">주소</td>
<td>
<input type="text" name="l_addr" size="70%" />
</td>
</tr>

<tr>
<td class="td_title">수용인원</td>
<td>
<input type="number" name="l_pnum" />명
</td>
</tr>



<tr>
<td class="td_title">대관 가능시간</td>
<td>
<input type="text" class="dtpicker2" name="l_t_sdate" id="startdt"  size="13">부터&nbsp;&nbsp;&nbsp;
<input type="text" class="dtpicker2" name="l_t_edate" id="enddt" size="13">까지
</td>
</tr>

<tr>
<td class="td_title">대관금액</td>
<td>
<input type="number" name="l_payment" value="0" size="5" maxlength="7">원&nbsp;&nbsp;<b style="font-size: xx-small;font-family:monospace;color: navy;">*값을 0원으로 설정시, 무료로 개설됨.</b>
</td>
</tr>



<tr>
<td class="td_title">대표 이미지</td>
<td>
<s:file name="upload" accept=".gif, .jpg, .jpeg, .png"/>
</td>
</tr>

<tr>
<td colspan="2"><hr></td>
</tr>

<tr>
<td colspan="2" align="center">
<textarea id="l_content" name="l_content"></textarea>
</td>
</tr>


<tr>
<td colspan="2"><hr></td>
</tr>

<tr>
<td colspan="2" align="center" style="padding-bottom:11px;">
<input type="submit" value="장소등록">&nbsp;&nbsp;&nbsp;
<input type="button" value="취소하기" onclick="location.href='main.action'">
</td>
</tr>

</table>
</s:form>
		
			
</body>
</html>