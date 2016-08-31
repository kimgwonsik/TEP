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
<div style="font-weight: bold;font-size: x-large;">&nbsp;모임장소 추천</div>
<table class="om_detail_header_table">
<tr>

<td width="15%" class="om_detail_header_table_td1">
<div><img class="om_detail_header" src="<s:property value='detailData.l_rep_img'/>"></div>

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
<tr><td align="right">
<input type="button" name="lendplace_submit" value="장소사용 신청하기">
</td></tr>
</table>

</td>
</tr>
</table>

<hr class="om_detail_hr">

<table  class="om_detail_content">
<tr><td>

<div style="font-weight: bold;font-size: large;">지도보기</div>
<div id="map" style="width:100%;height:350px;" class="om_detail_contet_map"></div>
<br>
<b>※&nbsp;<s:property value="detailData.l_addr"/>&nbsp;(<s:property value="detailData.l_subject"/>)</b>
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
geocoder.addr2coord('<s:property value="detailData.l_addr"/>', function(status, result) {

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
        content: '<div style="width:150px;text-align:center;padding:6px 0;"><s:property value="detailData.l_subject"/></div>'
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

<!-- 참여신청/취소안내 -->
<div style="font-weight: bold;font-size:small;padding-top: 50px">모임장소 추천안내</div>
<div class="cancel_info">
* TEP에서 소규모의 미팅이나 스터디, 세미나 그리고 대규모의 강연까지 가능한 모임장소를 추천해 드립니다.<br>
* 모임의 목적에 맞는 규모와 장소, 시간, 편의시설, 지원장비 등을 꼼꼼히 확인하시고 목록에서 장소를 신청해 주세요.<br>
</div>

</td></tr>
</table>


</td>
</tr>
</table>
</body>
</html>