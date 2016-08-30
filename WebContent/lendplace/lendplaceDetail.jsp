<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/openmeetdetail.css" type="text/css">
<script type="text/javascript" src="/TEP/static/js/root.js"></script>
</head>
<body>
<table width=930px border="0" align=center>
<tr>
<td>

<table class="om_detail_header_table">
<tr>

<td width="15%" class="om_detail_header_table_td1">
<div><img class="om_detail_header" src="/TEP/openmeet/image/ex1.jpg"></div>
<dl class="om_detail_header">
<dt class="om_detail_header_dt">개설자 정보</dt>
<hr class="om_detail_hr">
<dd class="om_detail_header_dd1"><s:property value="detailData.o_name"/></dd>
<dd class="om_detail_header_dd2">＠&nbsp;<s:property value="detailData.o_email"/></dd>
<dd class="om_detail_header_dd2">☏&nbsp;<s:property value="detailData.o_phone"/></dd>
<dd class="om_detail_header_dd2">＃&nbsp;<s:property value="detailData.o_company"/></dd>
</dl>
<hr class="om_detail_hr">
</td>

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
<tr><td>
<table border="0" align="center" cellpadding=10  class="om_detail_header_table_register" >
<tr>
<td colspan="2"><s:property value="detailData.l_content"/></td>
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
·
<input type="number" name="o_current_pnum" size="1" class="om_detail_register_input">명</td>
</tr>
</table>
</td></tr>
<tr><td align="right">
<input type="button" name="openmeet_submit" value="장소사용 신청하기">
</td></tr>
</table>

</td>
</tr>
</table>

<hr class="om_detail_hr">

<table  class="om_detail_content">
<tr><td>

<br>
<hr class="om_detail_hr">
<div style="font-weight: bold;font-size: large;">지도보기</div>
<div id="map" style="width:100%;height:350px;" class="om_detail_contet_map"></div>
<br>
<b>※&nbsp;<s:property value="detailData.o_addr"/>&nbsp;(<s:property value="detailData.o_title"/>)</b>
<br>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
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
        content: '<div style="width:150px;text-align:center;padding:6px 0;"><s:property value="detailData.o_title"/></div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});

function om_cmt_check(){
	var area = document.getElementById('cmt_content');
	if(!area.value){
		alert("댓글에 내용이 입력되지 않았습니다.");
		area.focus();
		return false;
	}
}
</script>


<!-- 댓글 -->
<div style="font-weight: bold;font-size:small;padding-top: 50px">댓글(<s:property value="cmtData.size()"/>)</div>
<hr class="om_detail_hr">
<s:form action="omd_insert_cmt" onsubmit="return om_cmt_check();" method="post">
<input type="hidden" name="currentPage" value='<s:property value="currentPage"/>'>
<input type="hidden" name="o_no" value='<s:property value="o_no"/>'>
<div style="padding-right:6px;padding-bottom:5px;"><textarea id="cmt_content" name="c_content" class="om_detail_comments"></textarea></div>
<div align="right"><input type="submit" value="내용입력"></div>
</s:form>

<s:iterator value="cmtData" status="cmtStat">
<hr class="om_detail_hr">
<div style="padding-left:13px;font-weight: bold;font-family: sans-serif;font-size: x-small;"><s:property value="c_name"/></div>
<div style="padding-top:5px; padding-left:13px;font-family: monospace;font-size: x-small;"><s:property value="c_content"/></div>
</s:iterator>

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


</td>
</tr>
</table>
</body>
</html>