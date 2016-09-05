<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/menubar.css" type="text/css">
<title></title>
</head>
<body>
<nav id="topMenu">
   <ul>
      <li class="topMenuLi">
      	<a class="menuLink" href="mypageView.action">마이페이지 홈</a>
      </li>
      <li>|</li>
      <li class="topMenuLi">
      	<a class="menuLink" href="modifyPwChk.action">회원정보수정</a>
      </li>
      <li>|</li>
      <li class="topMenuLi">
      	<a class="menuLink" href="#">내가쓴글보기</a>
      		<ul class="submenu">
      			<li><a href="#" class="submenuLink">게시판내역</a></li>
      			<li><a href="#" class="submenuLink">답글내역</a></li>
      			<li><a href="#" class="submenuLink">모임개설내역</a></li>
      		</ul>	
      </li>
      <li>|</li>
      <li class="topMenuLi">
      	<a class="menuLink" href="#">모임참여내역</a>
      </li>
      <li>|</li>
      <li class="topMenuLi">
      	<a class="menuLink" href="helpHistory.action">문의내역</a>
      </li>
      <li>|</li>
      <li class="topMenuLi">
      	<a class="menuLink" href="deleteMemberForm.action">회원탈퇴</a>
      </li>
   </ul>
</nav>
</body>
</html>
