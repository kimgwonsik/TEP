package board;

import java.util.Date;

//게시판 테이블 공통(스승/제자) Model
public class BoardModel {

	// 게시글번호
	private Integer b_no;

	// 작성자
	private String b_name;

	// 카테고리
	private String b_category;

	// 제목
	private String b_subject;

	// 내용
	private String b_content;

	// 파일업로드
	private String b_file_orgname;

	// 파일다운로드
	private String b_file_savname;

	// 관심지역
	private String b_fav_area;

	// 관심분야
	private String bt_fav_field;

	// 유/무료 여부
	private String b_payment;

	// 게시날짜
	private Date b_date;

	// 조회수
	private Integer b_readcount;

	public Integer getB_no() {
		return b_no;
	}

	public void setB_no(Integer b_no) {
		this.b_no = b_no;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
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

	public String getB_file_orgname() {
		return b_file_orgname;
	}

	public void setB_file_orgname(String b_file_orgname) {
		this.b_file_orgname = b_file_orgname;
	}

	public String getB_file_savname() {
		return b_file_savname;
	}

	public void setB_file_savname(String b_file_savname) {
		this.b_file_savname = b_file_savname;
	}

	public String getB_fav_area() {
		return b_fav_area;
	}

	public void setB_fav_area(String b_fav_area) {
		this.b_fav_area = b_fav_area;
	}

	public String getBt_fav_field() {
		return bt_fav_field;
	}

	public void setBt_fav_field(String bt_fav_field) {
		this.bt_fav_field = bt_fav_field;
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

}