<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link href="/TEP/static/css/root.css" rel="stylesheet"/>
<link rel="stylesheet" href="/TEP/static/css/openmeetsubscribe.css" type="text/css">
<script type="text/javascript" src="/TEP/static/js/alertify.min.js"></script>
<script type="text/javascript">
	function valueChk(){
		var f = document.oms_form;
		var limit = '<s:property value="detailData.o_permit_pnum"/>';
		var num = document.getElementById("c_pnum");
		
		if(!f.s_name.value){
			alertify.error("이름이 입력되지 않았습니다.");
			f.s_name.focus();
			return false;
		}
		if(!f.s_company.value){
			alertify.error("소속이 입력되지 않았습니다.");
			f.s_company.focus();
			return false;
		}
		if(!f.s_phone.value){
			alertify.error("전화번호가 입력되지 않았습니다.");
			f.s_phone.focus();
			return false;
		}
		if(!num.value){
			alertify.error("신청 인원이 입력되지 않았습니다.");
			num.focus();
			return false;
		}
		if(num.value > parseInt(limit)){
			alertify.error("신청가능 인원이 초과되었습니다.");
			num.value = "";
			num.focus();
			return false;
		} 
	}
</script>
</head>
<body>
<table width=930px border="0" align=center>
<tr>
<td>

<s:form name="oms_form" action="omd_subscribe_insert" method="post" onsubmit="return valueChk();">
<input type="hidden" name="o_no" value="<s:property value="detailData.o_no"/>">
<input type="hidden" name="s_email" value="<s:property value="mData.m_email"/>">
<div class="omds_title">신청하기</div>
<table class="omds_header_table">
<tr>

<td width="15%" class="omds_header_table_td1">
<div><img class="omds_header" src="<s:property value="detailData.o_rep_img"/>"></div>
</td>

<td width="85%" class="omds_header_table_td2">
<div class="omds_header_subject"><s:property value="detailData.o_subject"/></div>
<br>
<table border="0">
<tr>
<td>모임기간 : <s:property value="detailData.o_meetdate"/></td>
</tr>
<tr>
<td>모임장소명 : <s:property value="detailData.o_title"/></td>
</tr>
<tr>
<td>모임세부주소 : <s:property value="detailData.o_addr"/></td>
</tr>
<tr>
<td>신청인원 : 총<s:property value="detailData.o_total_pnum"/>명&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<s:property value="detailData.o_permit_pnum"/>명 신청가능
·
<input type="number" id="c_pnum" name="o_current_pnum" size="1" class="om_detail_register_input">명

</td>
</tr>
</table>
</td>
</tr>
</table>

<hr class="omds_hr">

<div class="omds_title">신청자 정보 입력
<span style="float:right;font-size:small;font-weight:normal;"><input type="checkbox" name="update_meminfo" value="true">기존회원정보변경</span>
</div>
<table class="omds_member_info">
<tr>
<td width="15%" align="right" class="omds_title_td">이름</td>
<td width="35%"><input type="text" name="s_name" value="<s:property value="mData.m_name"/>"></td>
<td width="15%" align="right" class="omds_title_td">이메일</td>
<td width="35%"><input type="text" value="<s:property value="mData.m_email"/>" disabled="disabled"></td>
</tr>
<tr>
<td align="right" class="omds_title_td">소속</td>
<td>
<input type="text" name="s_company" value="<s:property value="mData.m_company"/>">
</td>
<td align="right" class="omds_title_td">전화번호</td>
<td>
<input type="number" name="s_phone" value="<s:property value="mData.m_phone"/>">
</td>
</tr>
</table>
 
<div class="omds_btn">
<input type="submit" value="신청완료">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="취소하기" onclick="javascript:history.back();">
</div>
</s:form>

</td>
</tr>
</table>
</body>
</html>