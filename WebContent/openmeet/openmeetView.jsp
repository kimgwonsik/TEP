<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/openmeetview.css" type="text/css">
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
			<img class="openmeet_rep" src='<s:property value="o_rep_img"/>'/>
			<br><font style="font-family: sans-serif;"><s:property value="o_subject"/></font>
		</s:a>
	</td>
</s:iterator>
	
<s:if test="list.size() <= 0">
	<tr>
	<td width=100%  align="center"><h3>등록된 게시물이 없습니다.</h3></td>
	</tr>
</s:if>

<!-- 페이징 -->
<tr>
<td colspan="3" width="100%" align="center"><s:property value="pagingHtml" escape="false"/></td>
</tr>

</table>

<td>

<!-- 모임개설 검색 카테고리 -->
<div class="title">모임제목 / 본문</div>
<div><input type="text" name="openmeet_category_search" alt="키워드로 모임을 검색하세요" value="키워드로 모임을 검색하세요" onclick="this.value=''" size="26"/></div>
<br>
<div class="title">카테고리</div>
<table class="gborder">
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;교육</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;강연</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;세미나/컨퍼런스</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;문화/예술</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;방송/연예</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;취미활동</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;소모임/친목행사</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;공모전</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;전시/박람회</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;패션/뷰티</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;이벤트/파티</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;여행</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;후원금 모금</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;기타</a></td>
</tr>
</table>
<br>
<div class="title">지역</div>
<table class="gborder">
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;서울</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;부산/울산/경남</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;인천/경기</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;대전/충정/세종</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;광주/전라</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;강원</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;대구/경북</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;제주</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;기타지역</a></td>
<td class="cate"><a class="category" href="">&nbsp;</a></td>
</tr>
</table>
<br>
<div class="title">요일/시간</div>
<table class="gborder">
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;주중</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;주말</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;오전</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;오후</a></td>
</tr>
<tr>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;저녁</a></td>
<td class="cate"><a class="category" href="">&nbsp;&nbsp;새벽</a></td>
</tr>
</table>
<br>
<div class="title">참여비용</div>
<table class="gborder">
<tr>
<td align="center"><a class="category" href="">무&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;료</a></td>
</tr>
<tr>
<td align="center"><a class="category" href="">~&nbsp;&nbsp;10,000원</a></td>
</tr>
<tr>
<td align="center"><a class="category" href="">10,000원&nbsp;&nbsp;~&nbsp;&nbsp; 25,000원</a></td>
</tr>
<tr>
<td align="center"><a class="category" href="">25,000원&nbsp;&nbsp;~&nbsp;&nbsp; 40,000원</a></td>
</tr>
<tr>
<td align="center"><a class="category" href="">40,000원&nbsp;&nbsp;~&nbsp;&nbsp; 99,000원</a></td>
</tr>
<tr>
<td align="center"><a class="category" href="">99,000원&nbsp;&nbsp;~</a></td>
</tr>
</table>
<br>
<div class="title">모임시작일</div>
<span><input type="text" name="openmeet_date_search_start" size="5"/></span>
&nbsp;~&nbsp;
<span><input type="text" name="openmeet_date_search_end" size="5"/></span>
</tr>

</table>
</body>
</html>