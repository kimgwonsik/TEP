<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/openmeetview.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css">
<script src="/TEP/static/js/alertify.min.js"></script>
<script type="text/javascript" src="/TEP/static/js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.people').find("td").click(function() {
			if (!$(this).hasClass("category_select")) {
				$('.people').find("td").each(function(i) {
					$(this).removeClass("category_select");
				});
				$(this).addClass("category_select");
			}
		});
		
		$('.area').find("td").click(function() {
			if (!$(this).hasClass("category_select")) {
				$('.area').find("td").each(function(i) {
					$(this).removeClass("category_select");
				});
				$(this).addClass("category_select");
			}
		});
		
		$('.payment').find("td").click(function() {
			if (!$(this).hasClass("category_select")) {
				$('.payment').find("td").each(function(i) {
					$(this).removeClass("category_select");
				});
				$(this).addClass("category_select");
			}
		});
	});

	$(function() {
		$('#searchbox').keypress(function(event) {
			if (event.keyCode == 13) {
				var people = "";
				var area = "";
				var payment = "";

				if(!$('#searchbox').val()){
					return false;
				}
				
				if ($('.people').find("td").hasClass("category_select")) {
					$('.people').find("td").each(function(i) {
						if ($(this).hasClass("category_select")) {
							people += $(this).text();
						}
					});
				}

				if ($('.area').find("td").hasClass("category_select")) {
					$('.area').find("td").each(function(i) {
						if ($(this).hasClass("category_select")) {
							area += $(this).text();
						}
					});
				}
				
				if ($('.payment').find("td").hasClass("category_select")) {
					$('.payment').find("td").each(function(i) {
						if ($(this).hasClass("category_select")) {
							payment += $(this).text();
						}
					});
				}
				
				if(people.length > 0){
					$('#search_people').val(people.substring(0,1));
				} else {
					alertify.error("인원이 선택되지 않았습니다.");
					return false;
				}

				if(area.length > 0){
					$('#search_area').val(area);
				} else {
					alertify.error("지역이 선택되지 않았습니다.");
					return false;
				}
				
				if(payment.length > 0){
					$('#search_payment').val(payment);
				}else {
					alertify.error("비용이 선택되지 않았습니다.");
					return false;
				}
				
				document.search_form.submit();
			}
		});
	});
</script>
</head>
<body>
<table border="0" cellpadding=15 width=900px align=center>
<tr>

<!-- 장소 리스트 -->
<td width="80%">
<table border="0" width=100% cellpadding=5>
<tr>
<td colspan="3"><font style="font-weight: bold;font-size: x-large;">장소 대관</font></td>
</tr>

<s:iterator value="list" status="stat">
	<s:url id="lendplaceDetailURL" action="lendplaceDetail">
		<s:param name="l_no">
			<s:property value="l_no"/>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>
		</s:param>
	</s:url>
	<s:if test="#stat.index%3 == 0">
	<tr>
	</s:if>
	
	<td width="33%" align="center">
		<s:a cssClass="contentSubject" href="%{lendplaceDetailURL}">
			<table border="0" class="om_img_base">
			<tr>
			<td><img class="openmeet_rep" src='<s:property value="l_rep_img"/>'/></td>
			</tr>
			<tr>
			<td class="om_view_subject"><s:property value="l_subject"/></td>
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
<tr>
<td colspan="3" class="opemneet_paging"><s:property value="pagingHtml" escape="false"/></td>
</tr>

</table>

<td width="20%" valign="top">

<div class="title" style="padding-top:53px;">장소 키워드검색</div>
<div style="padding-left:2.2px;padding-right:2.2px;">
<form name="search_form" action="lsearch.action" method="post">
<input id="search_people" type="hidden" name="search_people">
<input id="search_area" type="hidden" name="search_area">
<input id="search_payment" type="hidden" name="search_payment">
<input id="searchbox" type="text" name="searchWord" value="<s:property value="searchWord"/>" maxlength="13" placeholder="예)역삼동,음향설비,주차,인터넷 등"/>
</form>
</div>
<br>

<div class="title">수용인원</div>
<table class="people">
<tr>
<td>0~20명</td>
<td>20~50명</td>
</tr>
<tr>
<td>50~100명</td>
<td>100명이상</td>
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

<div class="title">유/무료</div>
<table class="payment">
<tr>
<td>유료</td>
<td>무료</td>
</tr>
</table>



</table>
</body>
</html>