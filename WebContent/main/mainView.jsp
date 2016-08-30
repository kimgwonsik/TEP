<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<script src="/TEP/static/js/jquery-3.1.0.js"></script>
<script src="/TEP/static/js/jquery.bxslider/jquery.bxslider.min.js"></script>
<link href="/TEP/static/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet" />
</head>
<body>

<table border="0" align=center>
<tr>
<td>
<img src="/TEP/main/image/main_page_category_frame.png" usemap="#c_map_link" border="0"/>
</td>
<td width="600px" style="padding:4%;padding-bottom:1%;">


<ul class="bxslider">
	<li><a href="#"><img src="/TEP/main/slide_img/main_ex1.png" alt=""></a></li>
	<li><a href="#"><img src="/TEP/main/slide_img/main_ex2.png" alt=""></a></li>
	<li><a href="#"><img src="/TEP/main/slide_img/main_ex3.png" alt=""></a></li>
	<li><a href="#"><img src="/TEP/main/slide_img/main_ex4.png" alt=""></a></li>
	<li><a href="#"><img src="/TEP/main/slide_img/main_ex5.png" alt=""></a></li>
</ul>

<script>
$('.bxslider').bxSlider({
	  mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
	  speed:1500, //default:500 이미지변환 속도
	  auto: true, //default:false 자동 시작
	  captions: true, // 이미지의 title 속성이 노출된다.
	  autoControls: true, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
	});
</script>


</td>
</tr>
</table>

<map name="c_map_link">
	<area shape="rect" alt="모임카테고리" title="" coords="73,27,140,104" href="openmeet.action" target="_self" />
	<area shape="rect" alt="장소대관" title="" coords="71,152,141,228" href="lendplace.action" target="" />
	<area shape="rect" alt="모임개설하기" title="" coords="13,279,194,318" href="openmeet_write.action" target="" />
</map>

</body>
</html>