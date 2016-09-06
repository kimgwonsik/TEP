<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/openmeetview.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<title></title>
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
			<img class="openmeet_rep" src='<s:property value="l_rep_img"/>'/>
			<br><s:property value="l_subject"/>
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
<td colspan="3" width="100%" align="center"><s:property value="pagingHtml" escape="false"/></td>
</tr>

</table>

<td>

<!-- 모임개설 검색 카테고리 -->
<div class="title">장소 키워드검색</div>
<div><input type="text" name="lendplace_category_search" alt="예)역삼동,음향설비,주차,인터넷 등" value="예)역삼동,음향설비,주차,인터넷 등" onclick="this.value=''" size="26"/></div>
<br>
<div class="title">카테고리 선택</div>
<br>
<div class="title">수용인원별</div>
<table class="gborder">
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;1~20명</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;20~50명</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;50~100명</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;100명이상</a></td>
</tr>
</table>
<br>
<div class="title">지역별</div>
<table class="gborder">
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;서울</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;경기</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;대구/경북</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;부산</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;대전</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;광주</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;강원</a></td>
</tr>
</table>
<br>
<div class="title">유/무료</div>
<table class="gborder">
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;유료</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;무료</a></td>
</tr>
</table>
<br>
<div class="title">최근 인기있는 장소</div>
<table class="gborder">
<tr>
<td align="center"><a class="category" href=""></a></td>
</tr>
</table>

</table>
</body>
</html>