// openmeetDetail script
document.write('<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services"></script>');
function om_detail_check(){
	var cmt_textarea = document.getElementByName("c_content");
	if(!cmt_textarea.value){
		alert("댓글의 내용이 입력되지 않았습니다.");
		cmt_textarea.focus();
		return false;
	}
}

// custom javascript alert usage js file include
document.write('<script src="/TEP/static/js/alertify.min.js"></script>');