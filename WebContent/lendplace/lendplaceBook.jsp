<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/openmeetdetail.css" type="text/css">
</head>
<body>
<!-- 전체 테이블 -->
<table width=930px border="0" align=center>
<tr>
<td>

<div style="font-weight: bold;font-size: large;">&nbsp;&nbsp;&nbsp;모임장소 추천</div>

<!-- 위 테이블 -->
<table class="om_detail_header_table">
<tr>

<!--위 왼쪽 칸-->
<td width="15%" class="om_detail_header_table_td1">
<div><img class="om_detail_header" src="<s:property value='detailData.l_rep_img'/>"></div>

<hr class="om_detail_hr">
</td>

<!--위 오른쪽 칸-->
<td width="85%" class="om_detail_header_table_td2">

<div class="om_detail_header_subject"><s:property value="detailData.l_subject"/></div>
<br>
<table border="0">
<tr>
<td>주소 : <s:property value="detailData.l_addr"/></td>
</tr>
<tr>
<td>수용인원 : <s:property value="detailData.l_pnum"/>명</td>
</tr>
<tr>
<td>대관시간 : <s:property value="detailData.l_sdate"/>~<s:property value="detailData.l_edate"/></td>
</tr>
<tr>
<td>대관금액 : <s:property value="detailData.l_payment"/>원</td>
</tr>
<tr>
<td>대여횟수 : <s:property value="detailData.l_use_num"/>번</td>
</tr>
</table>
<hr class="om_detail_hr">
<div><s:property value="detailData.l_content"/></div>
<br>
<br>
<table  align="right">
<tr><td align="right">
<input type="button" name="lendplace_submit" value="장소사용 신청하기">
</td></tr>
</table>

</td>
</tr>
</table>

<!-- 위쪽과 아래쪽 테이블 분기선 -->
<hr class="om_detail_hr">

<table class="om_detail_content">
<tr><td>

<table>
<div style="font-weight: bold;font-size: large;">장소 신청하기</div>
</table>

<table>

			<tr>
				<td>장소 대관 시간과 신청자 정보를 정확히 입력해 주세요.</td>
			</tr>
			<tr>
				<td align=right>*신청하는 장소&nbsp;&nbsp; </td>
				<td><input type="text" name="id" maxlength="10" /></td>
			</tr>
			<tr>
				<td align=right>*대관시간&nbsp;&nbsp;</td>
				<td><input type="text" name="id" maxlength="10" />부터</td>
			</tr>
			<tr>
				<td align=right></td>
				<td><input type="text" name="id" maxlength="10" />까지 사용합니다.</td>
			</tr>
			<tr>
				<td align=right>*신청자 이름&nbsp;&nbsp;</td>
				<td><input type="text" name="name" maxlength="20" value='<s:property value="sessionData.m_name"/>' /></td>
			</tr>
			<tr>
				<td align=right>*신청자 소속&nbsp;&nbsp;</td>
				<td><input type="text" name="name" maxlength="20" alt="예) TEP" value="예) TEP" onclick="this.value=''" /></td>
			</tr>
			<tr>
				<td align=right>*신청자 전화번호&nbsp;&nbsp;</td>
				<td><input type="text" name="name" maxlength="20" value='<s:property value="sessionData.m_phone"/>' /></td>
			</tr>
			<tr>
				<td align=right>*신청자 이메일&nbsp;&nbsp;</td>
				<td><input type="text" name="email" maxlength="50" value='<s:property value="sessionData.m_email"/>' /></td>
			</tr>
			<tr>
				<td></td>
				<td>
				<input type="button" name="lendplace_submit" value="접수완료">
				<input type="button" name="lendplace_submit" value="취소" onclick="location.href='lendplace.action'">
				</td>
			</tr>
		</table>






<!-- 아래쪽 테이블 닫는 태그-->
</td></tr>
</table>


<!-- 전체 테이블 닫는 태그 -->
</td>
</tr>
</table>
</body>
</html>