function valuecheck(){
	var subject = document.getElementById("b_subject");
	var content = CKEDITOR.instances.b_content;
	
	if(!subject.value){
		alert("제목이 입력되지 않았습니다.");
		subject.focus();
		return false;
	}
	
	if(!content.getData()){
		alert("내용이 입력되지 않았습니다.");
		content.focus();
		return false;
	}
}
