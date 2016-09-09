<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/openmeetdetail.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/js/dtpicker/jquery.simple-dtpicker.css">
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css">
<script src="/TEP/static/js/alertify.min.js"></script>
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

<script type="text/javascript">
	function valueChk(){
	var f = document.bookForm;
	
		if(!f.lb_t_sdate.value){
				alertify.error("대관시작 시간이 입력되지 않았습니다.");
				f.lb_t_sdate.focus();
				return false;
			} 
			 if(!f.lb_t_edate.value){
				alertify.error("대관종료 시간이 입력되지 않았습니다.");
				f.lb_t_edate.focus();
				return false;
			}
			if(!f.lb_phone.value){
				alertify.error("전화번호가 입력되지 않았습니다.");
				f.lb_phone.focus();
				return false;
			}
			 if(!f.lb_name.value){
					alertify.error("이름이 입력되지 않았습니다.");
					f.lb_name.focus();
					return false;
				} 
				if(!f.lb_company.value){
					alertify.error("소속이 입력되지 않았습니다.");
					f.lb_company.focus();
					return false;
				}
				if(!f.lb_email.value){
					alertify.error("이메일이 입력되지 않았습니다.");
					f.lb_email.focus();
					return false;
				}
	} 
</script>

</head>
<body>
<!-- 전체 테이블 -->
<table width=930px border="0" align=center>
<tr>
<td>

<table style="width:100%;" border="0">
<tr>
<td style="font-weight: bold;font-size: large;font-family: sans-serif;">장소 신청하기</td>
<td align="right"><input type="button" value="뒤로가기" onclick="history.back();"></td>
</tr>
</table>

<!-- 위 테이블 -->
<table class="om_detail_header_table">
<tr>

<!--위 왼쪽 칸-->
<td width="15%" class="om_detail_header_table_td1">
<div><img class="om_detail_header" src="<s:property value='detailData.l_rep_img'/>"></div>
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
<div><%-- <s:property value="detailData.l_content"/> --%></div>
<br>
<br>
<table  align="right">
<tr><td align="right">
<!-- <input type="button" name="lendplace_submit" value="장소사용 신청하기"> -->
</td></tr>
</table>

</td>
</tr>
</table>

<!-- 위쪽과 아래쪽 테이블 분기선 -->
<hr class="om_detail_hr">

<form name="bookForm" action="lendplaceBookInsert.action" method="post" theme="simple">
<table class="om_detail_content">
<tr><td>

		<input type="hidden" name="l_no" value="<s:property value="detailData.l_no"/>">
		<table border="0" align=center cellpadding=5 width=500px>
			<tr>
				<td align=right><font color="red">*</font> 신청하는 장소&nbsp;&nbsp; </td>
				<td><b><s:property value="detailData.l_subject"/></b></td>
			</tr>
			
			<tr>
				<td align=right><font color="red">*</font> 대관시간&nbsp;&nbsp;</td>
				<td><input type="text" class="dtpicker2" name="lb_t_sdate" id="startdt" size="13" />&nbsp;~&nbsp;<input type="text" class="dtpicker2" name="lb_t_edate" id="enddt" size="13"  />
				</td>
			</tr>
			
			<tr>
				<td align=right><font color="red">*</font> 신청자 이름&nbsp;&nbsp;</td>
				<td><input type="text" name="lb_name" value='<s:property value="sessionData.m_name"/>' /></td>
			</tr>
			<tr>
				<td align=right><font color="red">*</font> 신청자 소속&nbsp;&nbsp;</td>
				<td><input type="text" name="lb_company" placeholder="예) TEP"  value='<s:property value="sessionData.m_name"/>' /></td>
			</tr>
			<tr>
				<td align=right><font color="red">*</font> 신청자 전화번호&nbsp;&nbsp;</td>
				<td><input type="number" name="lb_phone" value='<s:property value="sessionData.m_phone"/>' /></td>
			</tr>
			<tr>
				<td align=right><font color="red">*</font> 신청자 이메일&nbsp;&nbsp;</td>
				<td><input type="text" name="lb_email" value='<s:property value="sessionData.m_email"/>' /></td>
			</tr>
			<tr>
				<td></td>
				<td>
				<input type="button" value="취소" onclick="location.href='lendplace.action'">&nbsp;&nbsp;&nbsp;
				<input type="submit" value="접수완료" onclick="return valueChk();" style="width:130px;">
				</td>
			</tr>
		</table>

</td></tr>
</table>
</form>


</td>
</tr>
</table>
</body>
</html>