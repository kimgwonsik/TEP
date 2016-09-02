function cmt_check(kind) {
	var session_id = '<s:property value="#session.session_m_email"/>';
	var area = document.getElementById('cmt_content');

	if (session_id == null || session_id.length <= 0) {
		alertify.error("로그인 상태가 아닙니다.");
		return false;
	}
	if (kind == 1 && !area.value) {
		alertify.error("댓글에 내용이 입력되지 않았습니다.");
		area.focus();
		return false;
	}
}