package board;

import java.util.Date;

//게시판 테이블 공통(스승/제자) Model
public class BoardModel {

	// 게시글번호
	private Integer b_no;
	
	// 게시글 종류
	private Integer b_kind;

	// 작성자
	private String b_name;
	
	// 이메일
	private String b_email;
	
	// 소속
	private String b_company;

	// 카테고리
	private String b_category;

	// 제목
	private String b_subject;

	// 내용
	private String b_content;

	// 관심지역
	private String b_fav_area;

	// 관심분야
	private String b_fav_field;

	// 유/무료 여부
	private String b_payment;

	// 게시날짜
	private Date b_date;

	// 조회수
	private Integer b_readcount;
	
	private Integer m_no;

	public Integer getB_no() {
		return b_no;
	}

	public void setB_no(Integer b_no) {
		this.b_no = b_no;
	}

	public Integer getB_kind() {
		return b_kind;
	}

	public void setB_kind(Integer b_kind) {
		this.b_kind = b_kind;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_email() {
		return b_email;
	}

	public void setB_email(String b_email) {
		this.b_email = b_email;
	}

	public String getB_company() {
		return b_company;
	}

	public void setB_company(String b_company) {
		this.b_company = b_company;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getB_subject() {
		return b_subject;
	}

	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_fav_area() {
		return b_fav_area;
	}

	public void setB_fav_area(String b_fav_area) {
		this.b_fav_area = b_fav_area;
	}

	public String getB_fav_field() {
		return b_fav_field;
	}

	public void setB_fav_field(String b_fav_field) {
		this.b_fav_field = b_fav_field;
	}

	public String getB_payment() {
		return b_payment;
	}

	public void setB_payment(String b_payment) {
		this.b_payment = b_payment;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public Integer getB_readcount() {
		return b_readcount;
	}

	public void setB_readcount(Integer b_readcount) {
		this.b_readcount = b_readcount;
	}

	public Integer getM_no() {
		return m_no;
	}

	public void setM_no(Integer m_no) {
		this.m_no = m_no;
	}

}