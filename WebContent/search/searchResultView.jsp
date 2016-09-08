<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<link rel="stylesheet" href="/TEP/static/css/searchresultview.css" type="text/css">
<style>
.menu a {
	font-family:sans-serif;
	cursor: pointer;
}

select.o_category, select.b_category{
	 width: 190px;
}

 .menu .hide {
	display: none;
}

body, ul, ol, html, h1, h2, h3, h4, h5, h6, p, img, form, dl, dd, dt {
	padding: 0;
	margin: 0;
	border: 0;
	list-style: none;
	font-size: small;
}
a.search_title{
	font-size: x-small;
	font-family: sans-serif;
}
</style>
<link rel="stylesheet" href="/TEP/static/css/openmeetform.css">
<link rel="stylesheet" href="/TEP/static/js/dtpicker/jquery.simple-dtpicker.css">
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css">
<script src="/TEP/static/js/alertify.min.js"></script>
<script src="/TEP/static/js/dtpicker/jquery-1.7.1.js"></script>
<script src="/TEP/static/js/dtpicker/jquery.simple-dtpicker.js"></script>
<script src="/TEP/static/js/ckeditor/ckeditor.js"></script>
<script src="/TEP/static/js/openmeetform.js"></script>
<script>
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
            
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>

</head>
<body>

<table width=930px align=center border="1">
<tr>
<td align=center>


<div>
    <ul>
        <li class="menu">
            <a class="search_title">모임 상세검색</a>
            <ul class="hide">
            <form action="" method="post">
            	<table class="search_openmeet_menu" border="1">
            	
            	<tr>
            	<td>작성자</td>
            	<td><input type="text" name="o_name" maxlength="10"></td>
            	</tr>
            	
            	<tr>
            	<td>카테고리</td>
            	<td>
					<select class="o_category" name="o_category">
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
            	<td>제목</td>
            	<td><input type="text" name="o_subject" maxlength="30"></td>
            	</tr>
            	
            	<tr>
            	<td>내용</td>
            	<td><input type="text" name="o_content" maxlength="100"></td>
            	</tr>
            	
            	<tr>
            	<td>장소</td>
            	<td><input type="text" name="o_addr" maxlength="30"></td>
            	</tr>
            	
            	<tr>
            	<td>모임기간</td>
            	<td>
	            	<input type="text" class="dtpicker2" name="o_msdate" id="startdt" size="13">&nbsp;&nbsp;~&nbsp;&nbsp;
	            	<input type="text" class="dtpicker2" name="o_medate" id="enddt" size="13">
            	</td>
            	</tr>
            	
            	<tr>
            	<td>인원</td>
            	<td><input type="text" name="o_total_pnum" size="5" maxlength="7">명</td>
            	</tr>
            	
            	<tr>
            	<td>유/무료</td>
            	<td><input type="number" name="o_payment" value="0" size="5" maxlength="7">원&nbsp;&nbsp;<b style="font-size: xx-small;font-family:monospace;color: navy;">*값을 0원으로 입력하면, 무료모임이 검색됩니다.</b></td>
            	</tr>
            	
            	<tr>
            	<td colspan="2" align="center"><input type="submit" value="검     색" style="width:150px;"></td>
            	</tr>
            	</table>
           	</form>
            </ul>
        </li>
 
 <li>
 <table border="0" width=100% cellpadding=5>

<s:iterator value="olist" status="stat">
	<s:url id="openmeetDetailURL" action="openmeetDetail">
		<s:param name="o_no">
			<s:property value="o_no"/>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>
		</s:param>
	</s:url>
	
	<s:if test="#stat.index%4 == 0">
	<tr>
	</s:if>
	<td width="25%" align="center">
		<s:a cssClass="contentSubject" href="%{openmeetDetailURL}">
			<img class="openmeet_rep" src='<s:property value="o_rep_img"/>'/>
			<br><font style="font-family: sans-serif;"><s:property value="o_subject"/></font>
		</s:a>
	</td>
	
</s:iterator>
	
<s:if test="olist.size() <= 0">
	<tr>
	<td width=100%  align="center"><h5>검색된 게시물이 없습니다.</h5></td>
	</tr>
</s:if>

<!-- 페이징 -->
<tr>
<td colspan="4" width="100%" align="center"><s:property value="pagingHtml" escape="false"/></td>
</tr>

</table>
 
 </li>
 
        <li class="menu">
            <a class="search_title">게시판 상세검색</a>
            <ul class="hide">
                <table class="search_board_menu" border="1">
            	
            	<tr>
            	<td>작성자</td>
            	<td><input type="text" name="b_name" maxlength="10"></td>
            	</tr>
            	
            	<tr>
            	<td>카테고리</td>
            	<td>
					<select class="b_category" name="b_category">
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
            	<td>제목</td>
            	<td><input type="text" name="b_subject" maxlength="30"></td>
            	</tr>
            	
            	<tr>
            	<td>내용</td>
            	<td><input type="text" name="b_content" maxlength="100"></td>
            	</tr>
            	
            	<tr>
            	<td>장소</td>
            	<td><input type="text" name="b_fav_area" maxlength="25"></td>
            	</tr>
            	
            	<tr>
            	<td>분야</td>
            	<td><input type="text" name="b_fav_field" maxlength="25"></td>
            	</tr>
            	
            	<tr>
            	<td>유/무료</td>
            	<td><input type="number" name="b_payment" value="0" size="5" maxlength="7">원&nbsp;&nbsp;<b style="font-size: xx-small;font-family:monospace;color: navy;">*값을 0원으로 입력하면, 무료로 등록된 게시물이 검색됩니다.</b></td>
            	</tr>
            	
            	<tr>
            	<td colspan="2" align="center"><input type="submit" value="검     색" style="width:150px;"></td>
            	</tr>
            	</table>
            </ul>
        </li>
    </ul>
</div>


</td>
</tr>
</table>

</body>
</html>