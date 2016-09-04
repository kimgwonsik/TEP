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

<script>
	window.onload = function() {
		CKEDITOR.replace('o_content',{
				'filebrowserUploadUrl':'ckeditorImageUpload.action'
		});
	}
</script>

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
		$('#startdt2').change(function() {
			var de = new Date($('#startdt2').handleDtpicker('getDate'));
			de.setDate(de.getDate());
			$('#enddt2').handleDtpicker('setMinDate', de);
		});
		$('#enddt2').change(function() {
			var ds = new Date($('#enddt2').handleDtpicker('getDate'));
			ds.setDate(ds.getDate());
			$('#startdt2').handleDtpicker('setMaxDate', ds);
		});
	});
</script>

<script>
	function valueCheck(){
		var f = document.omf_form;
		var content = CKEDITOR.instances.o_content;
		
		if(!f.o_subject.value){
			alertify.error('모임명이 입력되지 않았습니다.');
			f.o_subject.focus();
			return false;
		}
		if(!f.o_msdate.value){
			alertify.error('모임일시가 지정되지 않았습니다.');
			f.o_msdate.focus();
			return false;
		} else if(!f.o_medate.value){
			alertify.error('모임일시가 지정되지 않았습니다.');
			f.o_medate.focus();
			return false;
		}
		if(!f.o_rsdate.value){
			alertify.error('접수기간이 지정되지 않았습니다.');
			f.o_rsdate.focus();
			return false;
		} else if(!f.o_redate.value){
			alertify.error('접수기간이 지정되지 않았습니다.');
			f.o_redate.focus();
			return false;
		}
		if(!f.o_addr.value){
			alertify.error('상세주소가 입력되지 않았습니다.');
			f.o_addr.focus();
			return false;
		}
		if(!f.o_title.value){
			alertify.error('간략소개가 입력되지 않았습니다.');
			f.o_title.focus();
			return false;
		}
		if(!f.o_total_pnum.value){
			alertify.error('인원이 입력되지 않았습니다.');
			f.o_total_pnum.focus();
			return false;
		} else if(f.o_total_pnum.value < 2){
			alertify.error('최소인원은 2명입니다.');
			f.o_total_pnum.focus();
			f.o_total_pnum.value=2;
			return false;
		}
		if(!f.o_payment.value){
			alertify.error('비용이 입력되지 않았습니다.');
			f.o_payment.focus();
			return false;
		} else if(f.o_payment.value < 0){
			alertify.error('음수는 입력할수 없습니다.');
			f.o_payment.focus();
			f.o_payment.value=0;
			return false;
		}
		if(!f.upload.value){
			alertify.error('대표 이미지가 선택되지 않았습니다.');
			f.upload.focus();
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


<s:form onsubmit="return valueCheck();" name="omf_form" action="openmeetWrite" method="post" enctype="multipart/form-data" theme="simple">
<table class="omf_table_root" border="0" width=890px align=center>

<tr>
<td width="200px" class="td_title">카테고리/모임명</td>
<td  style="padding: 0;">
<table cellpadding=0 cellspacing=0>
<tr>
<td>
<select name="o_category">
	<option value="교육">교육</option>
	<option value="강연">강연</option>
	<option value="세미나/컨퍼런스">세미나/컨퍼런스</option>
	<option value="문화/예술">문화/예술</option>
	<option value="방송/연예">방송/연예</option>
	<option value="취미활동">취미활동</option>
	<option value="소모임/친목행사">소모임/친목행사</option>
	<option value="공모전">공모전</option>
	<option value="전시/박람회">전시/박람회</option>
	<option value="패션/뷰티">패션/뷰티</option>
	<option value="이벤트/파티">이벤트/파티</option>
	<option value="여행">여행</option>
	<option value="후원금모금">후원금모금</option>
	<option value="기타">기타</option>
</select>
</td>
<td>
<input type="text" name="o_subject" size="73%" placeholder="모임명을 입력 해주세요." maxlength="32">
</td>
</tr>
</table>

</td>
</tr>

<tr>
<td class="td_title">모임일시</td>
<td>
<input type="text" class="dtpicker2" name="o_msdate" id="startdt">부터&nbsp;&nbsp;&nbsp;
<input type="text" class="dtpicker2" name="o_medate" id="enddt">까지
</td>
</tr>

<tr>
<td class="td_title">접수기간</td>
<td>
<input type="text" class="dtpicker2" name="o_rsdate" id="startdt2">부터&nbsp;&nbsp;&nbsp;
<input type="text" class="dtpicker2" name="o_redate" id="enddt2">까지
</td>
</tr>

<tr>
<td colspan="2"><hr></td>
</tr>

<tr>
<td class="td_title">&nbsp;</td>
<td style="padding: 0;">
<table cellpadding=0 cellspacing=0>
<tr>
<td><input id="search_keyword_addr" type="text" name="" size="53%" placeholder="장소명, 주소를 검색해 주세요." onkeypress="searchAddrEnterKey();" maxlength="25"></td>
<td><input type="button" value="검색" onclick="searchAddrEnterKey('13');"></td>
</tr>
</table>
</td>
</tr>

<tr>
<td>&nbsp;</td>
<td>
<div class="map_wrap">
	<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
</div>
</td>
</tr>

<tr>
<td class="td_title">모임 상세주소</td>
<td>
<div>
<input id="detail_addr" type="text" name="o_addr" size="73%" placeholder="지도를 클릭하면 주소가 자동으로 입력됩니다." maxlength="30">
</div>
</td>
</tr>

<tr>
<td class="td_title">모임 간략소개</td>
<td>
<textarea class="ofm_o_title" name="o_title" rows="3" cols="71" maxlength="90"></textarea>
</td>
</tr>


<tr>
<td class="td_title">총 모임 인원</td>
<td>
<div>
<input type="number" name="o_total_pnum" value="2" size="5" maxlength="6">명&nbsp;&nbsp;<b style="font-size: xx-small;font-family:monospace;color: navy;">*최소 개설인원은 2명입니다.</b>
</div>
</td>
</tr>

<tr>
<td class="td_title">유/무료 선택</td>
<td>
<input type="number" name="o_payment" value="0" size="5" maxlength="7">원&nbsp;&nbsp;<b style="font-size: xx-small;font-family:monospace;color: navy;">*값을 0원으로 설정하면, 무료로 개설 됩니다.</b>
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
<textarea id="o_content" name="o_content"></textarea>
</td>
</tr>

<tr>
<td colspan="2">
<!-- 신청문의/연락처 설정-->
<div style="font-weight: bold;font-size:small;padding-top: 30px">신청문의/연락처 설정</div>
<div class="omf_info">
* 기본 연락처와 이메일 정보는 회원가입시 입력한 정보로 자동 설정됩니다.<br>
* 다른 사람의 전화번호를 입력했을 경우, 개인정보 도용으로 처벌 받을 수 있습니다.<br>
* TEP은 신청자와 개설자 간의 분쟁에 책임지지 않습니다.<br>
</div>
</td>
</tr>

<tr>
<td colspan="2"><hr></td>
</tr>

<tr>
<td colspan="2" align="center" style="padding-bottom:11px;">
<input type="submit" value="모임개설">&nbsp;&nbsp;&nbsp;<input type="button" value="취소하기" onclick="location.href='main.action'">
</td>
</tr>

</table>
</s:form>




<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services" onerror="alertify.log('지도 로드중 에러!')"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places(); 
	var searchAddr = document.getElementById('search_keyword_addr');
	function searchAddrEnterKey(btn){
		 if(event.keyCode == 13 || btn==13) {
			ps.keywordSearch(searchAddr.value, placesSearchCB); 
		}
	}
	
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (status, data, pagination) {
	    if (status === daum.maps.services.Status.OK) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new daum.maps.LatLngBounds();

	        for (var i=0; i<data.places.length; i++) {
	            displayMarker(data.places[i]);    
	            bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
	        }       
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new daum.maps.Marker({
	        map: map,
	        position: new daum.maps.LatLng(place.latitude, place.longitude) 
	    });

	    daum.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
	        infowindow.open(map, marker);
	    });
	}
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	var marker = new daum.maps.Marker() // 클릭한 위치를 표시할 마커입니다
	 ,infowindow = new daum.maps.InfoWindow({
		zindex : 1
	});  // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	
	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
			if (status === daum.maps.services.Status.OK) {
				var detailAddr = !!result[0].roadAddress.name ? result[0].roadAddress.name : result[0].jibunAddress.name;
				document.getElementById('detail_addr').value=detailAddr;
				
				// 마커를 클릭한 위치에 표시합니다 
				marker.setPosition(mouseEvent.latLng);
				marker.setMap(map);
				
				// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				infowindow.setContent('<div style="padding:5px;font-size:12px;">' + detailAddr + '</div>');
				infowindow.open(map, marker);
			}
		});
	});

	function searchAddrFromCoords(coords, callback) {
		geocoder.coord2addr(coords, callback); // 좌표로 행정동 주소 정보를 요청합니다
	}

	function searchDetailAddrFromCoords(coords, callback) {
		geocoder.coord2detailaddr(coords, callback); // 좌표로 법정동 상세 주소 정보를 요청합니다
	}
</script>			
			
</body>
</html>