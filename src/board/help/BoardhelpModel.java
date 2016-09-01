package board.help;

import java.util.Date;

//고객센터 게시판 테이블
public class BoardhelpModel {

	// 게시글번호
	private Integer bh_no;

	// 작성자
	private String bh_name;

	// 연락처
	private String bh_phone;

	// 이메일
	private String bh_email;

	// 제목
	private String bh_subject;

	// 카테고리
	private String bh_category1;

	// 세부 카테고리
	private String bh_category2;

	// 내용
	private String bh_content;

	// 게시날짜
	private Date bh_date;
	
	private Integer m_no;
	
	public Integer getM_no() {
		return m_no;
	}

	public void setM_no(Integer m_no) {
		this.m_no = m_no;
	}

	public Integer getBh_no() {
		return bh_no;
	}

	public void setBh_no(Integer bh_no) {
		this.bh_no = bh_no;
	}

	public String getBh_name() {
		return bh_name;
	}

	public void setBh_name(String bh_name) {
		this.bh_name = bh_name;
	}

	public String getBh_phone() {
		return bh_phone;
	}

	public void setBh_phone(String bh_phone) {
		this.bh_phone = bh_phone;
	}

	public String getBh_email() {
		return bh_email;
	}

	public void setBh_email(String bh_email) {
		this.bh_email = bh_email;
	}

	public String getBh_subject() {
		return bh_subject;
	}

	public void setBh_subject(String bh_subject) {
		this.bh_subject = bh_subject;
	}

	public String getBh_category1() {
		return bh_category1;
	}

	public void setBh_category1(String bh_category1) {
		this.bh_category1 = bh_category1;
	}

	public String getBh_category2() {
		return bh_category2;
	}

	public void setBh_category2(String bh_category2) {
		this.bh_category2 = bh_category2;
	}

	public String getBh_content() {
		return bh_content;
	}

	public void setBh_content(String bh_content) {
		this.bh_content = bh_content;
	}

	public Date getBh_date() {
		return bh_date;
	}

	public void setBh_date(Date bh_date) {
		this.bh_date = bh_date;
	}

}