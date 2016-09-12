<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<style type="text/css">
table.Cmt {
	width: 920px;
	text-align: center;
	margin-right: 6px;
}

table.Cmt td {
	padding: 5px;
}

tr.Cmt_head_tr {
	background-color: #FFEDED;
	font-family: sans-serif;
	font-size: small;
	font-weight: bold;
}

tr.Cmt_head_tr td {
	border-top: 3px solid red;
	border-bottom: 0.5px solid red;
	height: 25px;
}

tr.Cmt_content_tr {
	font-family: sans-serif;
	font-size: small;
	color: gray;
}

tr.Cmt_content_tr td {
	border-bottom: 0.5px solid red;
	height: 25px;
}

tr.Cmt_content_tr a {
	text-decoration: none;
	color: gray;
}

tr.Cmt_content_tr a:HOVER {
	color: red;
}
</style>
</head>

<body>
	<br>
	
	<table align="center" width="920" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td>
	
	<table width=100%>

		<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3">
				<strong>&nbsp;&nbsp;답글내역</strong>
			</td>
		</tr>

	</table>
	<br>
	<table class="Cmt" align=center cellspacing=0  width=100%>
		<tr class="Cmt_head_tr">
			<td>번호</td>
			<td width="55%">내용</td>
			<td>작성자</td>
			<td>등록일</td>


		</tr>


		<s:iterator value="Clist" status="stat">


			<s:if test="b_no != null">
				<s:url id="CmtDetailURL" action="boardDetail">
					<s:param name="b_no">
						<s:property value="b_no" />
					</s:param>
				</s:url>
			</s:if>


			<s:elseif test="o_no != null">
				<s:url id="CmtDetailURL" action="openmeetDetail">
					<s:param name="o_no">
						<s:property value="o_no" />
					</s:param>
				</s:url>
			</s:elseif>


			<tr class="Cmt_content_tr">

				<td>
					<s:property value="c_no" />
				</td>

				<td>
					<s:a href="%{CmtDetailURL}">
						<s:property value="c_content" />
					</s:a>
				</td>

				<td>
					<s:property value="c_name" />
				</td>
				<td>
					<s:date name="c_date" format="yyyy.MM.dd" />
				</td>

			</tr>
		</s:iterator>

		<s:if test="Clist.size() <= 0">
			<tr>
				<td colspan="5" align="center">
					<h3>등록된 게시물이 없습니다.</h3>
				</td>
			</tr>
		</s:if>

		<!-- 페이징 -->
		<tr>
			<td colspan="5" width="100%" align="center" style="padding-top: 20px; padding-bottom: 10px">
				<s:property value="pagingHtml" escape="false" />
			</td>
		</tr>
	</table>
	
		</td>
		</tr>
	</table>
	
</body>
</html>
</html>