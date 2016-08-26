<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<script type="text/javascript" src="/TEP/static/js/root.js"></script>
<style type="text/css">
dl.om_detail_header{
	list-style: none;
	padding-left: 0px;
}
dt.om_detail_header_dt{
	font-weight:bold;
	font-size: small;
}
dd.om_detail_header_dd1{
	margin-left: 0px;
	font-size: x-small;
	font-weight: bold;
}
dd.om_detail_header_dd2{
	margin-left: 0px;
	font-size: x-small;
	font-family:monospace;
	color: gray;
}
img.om_detail_header{
	width: 230px;height: 230px;
}
body, ul, ol, html, h1, h2, h3, h4, h5, h6, p, img, form, dl, dd, dt {
    padding: 0;
    margin: 0;
    border: 0;
    font-size: small;
}
</style>
</head>
<body>
<table width=930px border="0" align=center>
<tr>
<td>



<table class="om_detail_header">
<tr>

<td width="15%">
<div><img class="om_detail_header" src="/TEP/openmeet/image/ex1.jpg"></div>
<dl class="om_detail_header">
<dt class="om_detail_header_dt">개설자 정보</dt>
<hr>
<dd class="om_detail_header_dd1"><s:property value="detailData.o_name"/></dd>
<dd class="om_detail_header_dd2">＠&nbsp;<s:property value="detailData.o_email"/></dd>
<dd class="om_detail_header_dd2">☏&nbsp;<s:property value="detailData.o_phone"/></dd>
<dd class="om_detail_header_dd2">＃&nbsp;<s:property value="detailData.o_company"/></dd>
</dl>
<hr>
</td>

<td width="85%" style="padding-left: 50px;">
<div><s:property value="detailData.o_subject"/></div>
<br>
<table border="0">
<tr>
<td>모임기간 : <s:property value="detailData.o_meetdate"/></td>
</tr>
<tr>
<td>모임장소명 : <s:property value="detailData.o_title"/></td>
</tr>
<tr>
<td>모임장소주소 : <s:property value="detailData.o_addr"/></td>
</tr>
<tr>
<td>신청인원 : 총<s:property value="detailData.o_total_pnum"/>명</td>
</tr>
</table>
<hr>
<div><s:property value="detailData.o_content"/></div>
<br>
<br>
<table  align="center">
<tr><td>
<table border="0" align="center" cellpadding=10 style="border-style: double;border-color: gray;border-width: 5px">
<tr>
<td colspan="2">신청기간 : <s:property value="detailData.o_registerdate"/></td>
</tr>
<tr>
<td colspan="2"><hr></td>
</tr>
<tr>
<td>총<s:property value="detailData.o_total_pnum"/>명&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<s:property value="detailData.o_permit_pnum"/>명 신청가능</td>
<td>
<s:if test="detailData.o_payment == 0">
무료
</s:if>
<s:elseif test="detailData.o_payment > 0">
유료 : <s:property value="detailData.o_payment"/>원
</s:elseif>
·
<input type="number" name="o_current_pnum" size="3">명</td>
</tr>
</table>
</td></tr>
<tr><td align="right">
<input type="button" name="openmeet_submit" value="신청하기">
</td></tr>
</table>

</td>
</tr>
</table>

<br>
<hr>


<table width=100%>
<tr>
<td align="center">

<div style="font-size: small;color: red;">※ 접수 후에는 정식접수 안내를 위해 전화 또는 문자를 드리고 있습니다. (문의 070-4739-9697)</div>

<div>
<s:if test="detailData.o_content_img != null">
<img src="<s:property value="detailData.o_content_img"/>">
<br>
</s:if>
<s:property value="detailData.o_content"/>
</div>

</td>
</tr>
</table>

<br>
<div style="font-weight: bold;font-size: large;">지도보기</div>
<div id="map" style="width:100%;height:350px;"></div>
<br>
<b>※&nbsp;<s:property value="detailData.o_addr"/>&nbsp;(<s:property value="detailData.o_title"/>)</b>
<br>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
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
</script>

</td>
</tr>
</table>
</body>
</html>