<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/TEP/static/css/root.css">
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css">
<script src="/TEP/static/js/alertify.min.js"></script>
<script src="/TEP/static/js/jquery-3.1.0.js"></script>
<script language="javascript">

	window.onload = function(){
		alertify.error("아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다.");
		history.go(-1);
		}

</script>
</head>
<body>
</body>
</html>
