<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/openmeetdetail.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css" type="text/css">
<script src="/TEP/static/js/alertify.min.js"></script>

</head>
<body>
<table width=930px border="0" align=center>
<tr>
<td>

<table style="width:100%;" border="0">
<tr>
<td style="font-weight: bold;font-size: large;font-family: sans-serif;">모임 상세보기</td>
<td align="right"><input type="button" value="목록보기" onclick="location.href='openmeet.action'"></td>
</tr>
</table>

<table class="om_detail_header_table">
<tr>

<td width="15%" class="om_detail_header_table_td1">
<div><img class="om_detail_header" src="<s:property value="detailData.o_rep_img"/>"></div>
<dl class="om_detail_header">
<dt class="om_detail_header_dt">개설자 정보</dt>
<hr class="om_detail_hr">
<dd class="om_detail_header_dd1"><s:property value="detailData.o_name"/></dd>
<dd class="om_detail_header_dd2">＠&nbsp;<s:property value="detailData.o_email"/></dd>
<dd class="om_detail_header_dd2">☏&nbsp;<s:property value="detailData.o_phone"/></dd>
<dd class="om_detail_header_dd2">＃&nbsp;<s:if test="detailData.o_company != null"><s:property value="detailData.o_company"/></s:if><s:else>소속없음</s:else></dd>
</dl>
<hr class="om_detail_hr">
</td>

<td width="85%" class="om_detail_header_table_td2">
<div class="om_detail_header_subject"><s:property value="detailData.o_subject"/></div>
<br>
<table border="0">
<tr>
<td>모임기간 : <s:property value="detailData.o_meetdate"/></td>
</tr>
<tr>
<td>모임장소 : <s:property value="detailData.o_addr"/></td>
</tr>
<tr>
<td>신청인원 : 총<s:property value="detailData.o_total_pnum"/>명</td>
</tr>
</table>
<hr class="om_detail_hr">
<div><s:property value="detailData.o_title"/></div>
<br>
<br>
<table  align="right">
<tr><td>
<table border="0" align="center" cellpadding=10  class="om_detail_header_table_register" >
<tr>
<td colspan="2">신청기간 : <s:property value="detailData.o_registerdate"/></td>
</tr>
<tr>
<td colspan="2"><hr class="om_detail_hr"></td>
</tr>
<tr>
<td>총<s:property value="detailData.o_total_pnum"/>명&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<s:property value="detailData.o_permit_pnum"/>명 신청가능</td>
<td align="right">
<s:if test="detailData.o_payment == 0">
무료
</s:if>
<s:elseif test="detailData.o_payment > 0">
유료 : <s:property value="detailData.o_payment"/>원
</s:elseif>
</td>
</tr>
</table>
</td></tr>
<tr><td align="right">
<s:form action="omd_subscribe" method="post" onsubmit="return cmt_check('0');">
	<input type="hidden" name="o_no" value='<s:property value="o_no"/>'>
	<s:if test="detailData.o_permit_pnum <= 0">
	<input type="button" value="신청마감" disabled="disabled" style="background-color: gray;">
	</s:if>
	<s:else>
	<input type="submit" value="신청하기">
	</s:else>
</s:form>
</td></tr>
</table>

</td>
</tr>
</table>

<hr class="om_detail_hr">

<table  class="om_detail_content">
<tr><td>



<table width=100%>
<tr>
<td align="center">

<div style="font-size: small;color:navy;">※ 접수 후에는 정식접수 안내를 위해 전화 또는 문자를 드리고 있습니다. (문의 070-4739-9697)</div>
<br>
<div>
<%-- <s:if test="detailData.o_content_img != null">
<img src="<s:property value="detailData.o_content_img"/>">
<br>
</s:if> --%>
<s:property value="detailData.o_content" escape="false"/>
</div>

</td>
</tr>
</table>

<br>
<hr class="om_detail_hr">
<div style="font-weight: bold;font-size: large;">지도보기</div>
<div id="map" style="width:100%;height:350px;" class="om_detail_contet_map"></div>

<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services" onerror="alertify.log('지도 로드중 에러!')"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addr2coord('<s:property value="detailData.o_addr"/>', function(status, result) {

// 정상적으로 검색이 완료됐으면 
 if (status === daum.maps.services.Status.OK) {

    var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;"><s:property value="detailData.o_addr"/></div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});

function cmt_check(kind) {
	var session_id = '<s:property value="#session.session_m_email"/>';
	var area = document.getElementById('cmt_content');

	if (session_id == null || session_id.length <= 0) {
		alertify.error("로그인 상태가 아닙니다.");
		return false;
	}
	
	if (kind == 1 && !area.value) {
		alertify.error("댓글에 내용이 입력되지 않았습니다.");
		area.focus();
		return false;
	}
}
</script>

<!-- 댓글 -->
<div style="font-weight: bold;font-size:small;padding-top: 50px">댓글(<s:property value="cmtData.size()"/>)</div>
<hr class="om_detail_hr">
<s:form action="omd_insert_cmt" onsubmit="return cmt_check('1');" method="post">
<input type="hidden" name="o_no" value='<s:property value="o_no"/>'>
<div style="padding-right:6px;padding-bottom:5px;"><textarea id="cmt_content" name="c_content" class="om_detail_comments"></textarea></div>
<div align="right"><input type="submit" value="내용입력"></div>
</s:form>

<s:form action="omd_delete_cmt" method="post" name="cmt_delete_form">
<s:iterator value="cmtData" status="cmtStat">
<hr class="om_detail_hr">
<div style="padding-left:13px;font-weight: bold;font-family: sans-serif;font-size: x-small;">
<s:property value="c_name"/>

<!-- 댓글 삭제 -->
<input type="hidden" name="c_no" value="<s:property value="c_no"/>">
<input type="hidden" name="o_no" value="<s:property value="o_no"/>">
<s:if test="#session.session_m_no != null && #session.session_m_no == m_no">
<span style="float:right;">
<s:a href="#" onclick="document.cmt_delete_form.submit();">삭제</s:a>
</span>
</s:if>

</div>
<div style="padding-top:5px; padding-left:13px;font-family: monospace;font-size: x-small;"><s:property value="c_content"/></div>
</s:iterator>
</s:form>

<!-- 참여신청/취소안내 -->
<div style="font-weight: bold;font-size:small;padding-top: 50px">참여신청/취소안내</div>
<div class="cancel_info">
* 모임의 신청/취소/변경/환불은 참여신청 기간 내에만 가능합니다. <br>
* 결제한 유료모임은 환불 시 결제 수단과 환불 시점에 따라 수수료가 부과될 수 있습니다. 자세한 사항은 취소/환불약관을 확인해주세요.<br>
* 결제, 환불, 참여신청 수정/취소, 참여상태 확인, 참여내역 확인은 마이페이지에서 할 수 있습니다.<br>
* 모임 또는 그룹의 설정, 모집정원 초과 여부에 따라 대기자로 선정될 수 있습니다. 자세한 사항은 FAQ를 확인해주세요.<br>
* TEP 결제서비스를 이용하는 모임은 개설자의 사업자 여부에 따라 결제증빙 발행이 가능합니다. 자세한 사항은 FAQ를 확인해 주세요.<br>
* 개설자 선정방식 또는 개설자 통장입금 방식의 모임 참여/결제 확인은 개설자에게 문의 바랍니다.<br>
* TEP는 참여신청 및 참가비 결제 기능을 제공하는 회사로 모임개설자가 아닙니다. 모임 내용과 관련한 사항은 모임 개설자에게 문의 바랍니다.<br>
</div>

</td></tr>
</table>


<table cellpadding=3 align=right>
<tr>
<s:if test="detailData.m_no == #session.session_m_no">
<td><input type="button" value="수정하기" onclick="location.href='openmeetModify.action?o_no=<s:property value="o_no"/>'"></td>
<td><input type="button" value="삭제하기" onclick="location.href='openmeetDelete.action?o_no=<s:property value="o_no"/>'"></td>
</s:if>
<td>
<input type="button" value="뒤로가기" onclick="history.back();">
</td>
</tr>
</table>


</td>
</tr>
</table>


</body>
</html>