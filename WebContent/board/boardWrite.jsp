<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/boardwrite.css" type="text/css">
<script src="/TEP/static/js/ckeditor/ckeditor.js"></script>
<script src="/TEP/static/js/boardwrite.js"></script>
<script>
	window.onload = function() {
		CKEDITOR.replace('b_content');
	}
</script>
</head>
<body>

<form id="writeForm" action="boardWriteInsert.action" method="post" onsubmit="return valuecheck();">
<table class="boardwrite" align=center border="0">

<tr>
<td class="bw_title">종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류</td>
<td>
<select name="b_kind">
	<option value="0">일반게시물</option>
	<option value="1">스승찾아요</option>
	<option value="2">제자찾아요</option>
</select>
</td>
</tr>

<tr>
<td class="bw_title">카테고리</td>
<td>
<select name="b_category">
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
</tr>

<tr>
<td class="bw_title">관심분야</td>
<td>
<select name="b_fav_field">
	<option value="프로그래밍">프로그래밍</option>
	<option value="네일아트">네일아트</option>
	<option value="공예">공예</option>
	<option value="작곡/작사">작곡/작사</option>
	<option value="번역/통역">번역/통역</option>
	<option value="디자인">디자인</option>
	<option value="분석">분석</option>
	<option value="운동">운동</option>
	<option value="기타">기타</option>
</select>
</td>
</tr>

<tr>
<td class="bw_title">관심지역</td>
<td>
<select name="b_fav_area">
	<option value="서울">서울</option>
	<option value="부산/울산/경남">부산/울산/경남</option>
	<option value="인천/경기">인천/경기</option>
	<option value="대전/충청/세종">대전/충청/세종</option>
	<option value="광주/전라">광주/전라</option>
	<option value="강원">강원</option>
	<option value="대구/경북">대구/경북</option>
	<option value="제주">제주</option>
	<option value="기타">기타</option>
</select>
</td>
</tr>

<tr>
<td class="bw_title">비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
<td><input type="number" name="b_payment" value="0"></td>
</tr>

<tr>
<td class="bw_title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
<td><input id="b_subject" type="text" name="b_subject" size="100%"></td>
</tr>

<tr>
<td class="bw_title">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
<td><textarea id="b_content" name="b_content"></textarea></td>
</tr>


<tr>
<td colspan="2" align="right" style="border:none;">
<input type="submit" value="저장">
<input type="button" value="취소" onclick="location.href='board.action'">
</td>
</tr>

</table>
</form>

</body>
</html>