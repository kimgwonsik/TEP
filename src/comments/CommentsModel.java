package comments;

import java.util.Date;

//답변글 테이블
public class CommentsModel {

	// 답변글번호
	private Integer c_no;

	// 작성자
	private String c_name;

	// 비밀번호
	private String c_password;

	// 답변내용
	private String c_content;

	// 답변날짜
	private Date c_date;

	// 부모 게시글번호
	private Integer c_pno;

	public Integer getC_no() {
		return c_no;
	}

	public void setC_no(Integer c_no) {
		this.c_no = c_no;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_password() {
		return c_password;
	}

	public void setC_password(String c_password) {
		this.c_password = c_password;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}

	public Integer getC_pno() {
		return c_pno;
	}

	public void setC_pno(Integer c_pno) {
		this.c_pno = c_pno;
	}

}