<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/openmeetdetail.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/js/dtpicker/jquery.simple-dtpicker.css">
<script src="/TEP/static/js/dtpicker/jquery-1.7.1.js"></script>
<script src="/TEP/static/js/dtpicker/jquery.simple-dtpicker.js"></script>

<script>
	$(function() {
		// -- append by class just for lower strings count --
		$('.dtpicker2').appendDtpicker({
			"futureOnly" : false,
			"autodateOnStart" : false,
			"locale":"ko"
		});

		$('#startdt').change(function() {
			var de = new Date($('#startdt').handleDtpicker('getDate')); // constructor need to avoid linking object
			de.setDate(de.getDate());
			$('#enddt').handleDtpicker('setMinDate', de); //set min end date is 7 day later then start date
		});
		$('#enddt').change(function() {
			var ds = new Date($('#enddt').handleDtpicker('getDate'));
			ds.setDate(ds.getDate());
			$('#startdt').handleDtpicker('setMaxDate', ds); //set max end date is 7 day earlier then end date
		});
	});
</script>

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

<form id="bookForm" action="lendplaceBookInsert.action" method="post" enctype="multipart/form-data" theme="simple">
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
				<td><b><s:property value="detailData.l_subject"/></b></td>
			</tr>
			<input type="hidden" name="l_no" value="<s:property value="detailData.l_no"/>">
			
			<tr>
				<td align=right>*대관시간&nbsp;&nbsp;</td>
				<td><input type="text" class="dtpicker2" name="lb_t_sdate" id="startdt" />부터</td>
			</tr>
			<tr>
				<td align=right></td>
				<td><input type="text" class="dtpicker2" name="lb_t_edate" id="enddt" />까지 사용합니다.</td>
			</tr>
			
			<tr>
				<td align=right>*신청자 이름&nbsp;&nbsp;</td>
				<td><input type="text" name="lb_name" value='<s:property value="sessionData.m_name"/>' /></td>
			</tr>
			<tr>
				<td align=right>*신청자 소속&nbsp;&nbsp;</td>
				<td><input type="text" name="lb_company" alt="예) TEP" value="예) TEP" onclick="this.value=''" /></td>
			</tr>
			<tr>
				<td align=right>*신청자 전화번호&nbsp;&nbsp;</td>
				<td><input type="number" name="lb_phone" value='<s:property value="sessionData.m_phone"/>' /></td>
			</tr>
			<tr>
				<td align=right>*신청자 이메일&nbsp;&nbsp;</td>
				<td><input type="text" name="lb_email" value='<s:property value="sessionData.m_email"/>' /></td>
			</tr>
			<tr>
				<td></td>
				<td>
				<input type="submit" value="접수완료" onclick="alert('접수가 완료되었습니다.')">
				<input type="button" value="취소" onclick="location.href='lendplace.action'">
				</td>
			</tr>
		</table>



<!-- 아래쪽 테이블 닫는 태그-->
</td></tr>
</table>
</form>

<!-- 전체 테이블 닫는 태그 -->
</td>
</tr>
</table>
</body>
</html>