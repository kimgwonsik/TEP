<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/openmeetview.css" type="text/css">
<script type="text/javascript" src="/TEP/static/js/jquery-3.1.0.js"></script>
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
				var category = "";
				var area = "";

				if(!$('#searchbox').val()){
					return false;
				}
				
				if ($('.category').find("td").hasClass("category_select")) {
					$('.category').find("td").each(function(i) {
						if ($(this).hasClass("category_select")) {
							category += $(this).text()+"|";
						}
					});
				}

				if ($('.area').find("td").hasClass("category_select")) {
					$('.area').find("td").each(function(i) {
						if ($(this).hasClass("category_select")) {
							area += $(this).text()+"|";
						}
					});
				}
				
				if(category.length > 0){
					$('#search_category').val(category.substring(0,category.length-1));
				} 
				
				if(area.length > 0){
					$('#search_area').val(area.substring(0,area.length-1));
				}
				
				document.search_form.submit();
			}
		});
	});

	
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
<input id="search_category" type="hidden" name="search_category">
<input id="search_area" type="hidden" name="search_area">
<input id="searchbox" type="text" name="searchWord" value="<s:property value="searchWord"/>" maxlength="13" placeholder="키워드로 모임을 검색하세요">
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

</table>
</body>
</html>