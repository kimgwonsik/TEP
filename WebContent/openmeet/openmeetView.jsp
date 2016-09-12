<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/openmeetview.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css">
<link rel="stylesheet" href="/TEP/static/js/dtpicker/jquery.simple-dtpicker.css">
<script src="/TEP/static/js/alertify.min.js"></script>
<script src="/TEP/static/js/dtpicker/jquery-1.7.1.js"></script>
<script src="/TEP/static/js/dtpicker/jquery.simple-dtpicker.js"></script>
<script src="/TEP/static/js/openmeetview.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.category').find("td").click(function() {
			$(this).toggleClass("category_select");
		});
		$('.area').find("td").click(function() {
			$(this).toggleClass("category_select");
		});
	});

	$(function() {
		$('#searchbox').keypress(function(event) {
			if (event.keyCode == 13) {
				searchSubmit();
			}
		});
		
		$('.btnEventSearch').click(function(event) {
			searchSubmit();
			event.preventDefault();
		});
	});

	function searchSubmit() {
		var category = "";
		var area = "";

		/* if (!$('#searchbox').val()) {
			return false;
		} */

		if ($('.category').find("td").hasClass("category_select")) {
			$('.category').find("td").each(function(i) {
				if ($(this).hasClass("category_select")) {
					category += $(this).text() + "|";
				}
			});
		}

		if ($('.area').find("td").hasClass("category_select")) {
			$('.area').find("td").each(function(i) {
				if ($(this).hasClass("category_select")) {
					area += $(this).text() + "|";
				}
			});
		}

		if (category.length > 0) {
			$('#searchCate').val(category.substring(0, category.length - 1));
		}

		if (area.length > 0) {
			$('#searchAddr').val(area.substring(0, area.length - 1));
		}

		if($('#pay').val() != null){
			$('#searchPay').val($('#pay').val());
		}
		
		if($('#startdt').val() != null){
			$('#searchMStart').val($('#startdt').val());
		}
		
		if($('#enddt').val() != null){
			$('#searchMEnd').val($('#enddt').val());
		}
		
		document.search_form.submit();
	}
</script>
</head>
<body>
<table border="0" width=900px cellpadding=15 align=center>
<tr>

<!-- 모임 리스트 -->
<td width="80%">

<table border="0" width=100% cellpadding=5>
<tr>
<td colspan="3"><font style="font-weight: bold;font-size: x-large;">모임</font></td>
</tr>

<s:iterator value="list" status="stat">
	<s:url id="openmeetDetailURL" action="openmeetDetail">
		<s:param name="o_no">
			<s:property value="o_no"/>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>
		</s:param>
	</s:url>
	
	<s:if test="#stat.index%3 == 0">
	<tr>
	</s:if>
	
	<td width="33%" align="center">
		<s:a cssClass="contentSubject" href="%{openmeetDetailURL}">
			<table border="0" class="om_img_base">
			<tr>
			<td><img class="openmeet_rep" src='<s:property value="o_rep_img"/>'/></td>
			</tr>
			<tr>
			<td class="om_view_subject"><s:property value="o_subject"/></td>
			</tr>
			</table>
		</s:a>
	</td>
</s:iterator>
	
<s:if test="list.size() <= 0">
<tr>
<td width=100%><h3>등록된 게시물이 없습니다.</h3></td>
</tr>
</s:if>

<!-- 페이징 -->
<s:if test="list.size() > 0">
<tr>
<td colspan="3" class="opemneet_paging"><s:property value="pagingHtml" escape="false"/></td>
</tr>
</s:if>
</table>

<td width="20%" valign="top">
<!-- 모임개설 검색 카테고리 -->
<div class="title" style="padding-top:53px;">모임제목 / 본문</div>
<div style="padding-left:2.2px;padding-right:2.2px;">
<form name="search_form" action="search.action" method="post">
<input id="searchCate" type="hidden" name="searchCategory">
<input id="searchAddr" type="hidden" name="searchAddr">
<input id="searchPay" type="hidden" name="searchPay">
<input id="searchMStart" type="hidden" name="searchMStart">
<input id="searchMEnd" type="hidden" name="searchMEnd">
<input id="searchbox" type="text" name="searchWord" value="<s:property value="searchWord"/>" maxlength="13" placeholder="키워드로 모임을 검색하세요" title="키워드로 모임을 검색하세요">
<input type="image" src="/TEP/static/image/btnEventSearch.gif" class="btnEventSearch" alt="검색" onmouseover="this.src='/TEP/static/image/btnEventSearchOn_red.gif'" onmouseout="this.src='/TEP/static/image/btnEventSearch.gif'">
</form>
</div>

<br>

<div class="title">카테고리</div>
<table class="category">
<tr>
<td>교육</td>
<td>강연</td>
</tr>
<tr>
<td>세미나|컨퍼런스</td>
<td>문화|예술</td>
</tr>
<tr>
<td>방송|연예</td>
<td>취미활동</td>
</tr>
<tr>
<td>소모임|친목행사</td>
<td>공모전</td>
</tr>
<tr>
<td>전시|박람회</td>
<td>패션|뷰티</td>
</tr>
<tr>
<td>이벤트|파티</td>
<td>여행</td>
</tr>
<tr>
<td>후원금모금</td>
<td>기타</td>
</tr>
</table>

<br>

<div class="title">지역</div>
<table class="area">
<tr>
<td>서울</td>
<td>부산|울산|경남</td>
</tr>
<tr>
<td>인천|경기</td>
<td>대전|충정|세종</td>
</tr>
<tr>
<td>광주|전라</td>
<td>강원</td>
</tr>
<tr>
<td>대구|경북</td>
<td>제주</td>
</tr>
</table>

<br>


<div class="title">참여비용</div>
<div style="padding-left:2.2px;padding-right:2.2px;">
<input id="pay" type="number" style="width: 100%;height:20px;font-size: x-small;color: gray;text-align: right;" maxlength="7">
</div>
<div style="font-size: xx-small;font-family: sans-serif;color: navy;font-weight: bold;padding-top:3px;">*0원으로 입력하면 '무료'로 개설된 모임이 검색됩니다.</div>

<br>

<div class="title">모임기간</div>
<div style="text-align: center;">
<input type="text" class="dtpicker2" id="startdt" size="5">&nbsp;&nbsp;~&nbsp;
<input type="text" class="dtpicker2" id="enddt" size="5">
</div>
<div style="font-size: xx-small;font-family: sans-serif;color: navy;font-weight: bold;padding-top:3px;">*시작과 종료를 모두 선택해야 검색됩니다.</div>

</table>
</body>
</html>