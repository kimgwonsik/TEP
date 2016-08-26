package openmeet;

import java.util.Date;

//모임개설 테이블
public class OpenmeetModel {

	// 게시글번호
	private Integer o_no;

	// 작성자
	private String o_name;
	
	// 이메일
	private String o_email;

	// 소속
	private String o_company;
	
	// 카테고리
	private String o_category;

	// 제목
	private String o_subject;

	// 내용
	private String o_content;

	// 리스트 대표이미지
	private String o_rep_img;

	// 내용 대표이미지
	private String o_content_img;

	// 모임시작날짜
	private Date o_m_sdate;

	// 모임종료날짜
	private Date o_m_edate;

	// 접수시작날짜
	private Date o_r_sdate;

	// 접수종료날짜
	private Date o_r_edate;

	// 모임장소 제목
	private String o_title;

	// 모임장소 세부위치
	private String o_addr;

	// 총 모임 인원
	private Integer o_total_pnum;

	// 현재 신청 인원
	private Integer o_current_pnum;
	
	// 유/무료 여부
	private String o_payment;

	// 게시날짜
	private Date o_date;

	// 조회수
	private Integer o_readcount;

	public Integer getO_no() {
		return o_no;
	}

	public void setO_no(Integer o_no) {
		this.o_no = o_no;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public String getO_email() {
		return o_email;
	}

	public void setO_email(String o_email) {
		this.o_email = o_email;
	}

	public String getO_company() {
		return o_company;
	}

	public void setO_company(String o_company) {
		this.o_company = o_company;
	}

	public String getO_category() {
		return o_category;
	}

	public void setO_category(String o_category) {
		this.o_category = o_category;
	}

	public String getO_subject() {
		return o_subject;
	}

	public void setO_subject(String o_subject) {
		this.o_subject = o_subject;
	}

	public String getO_content() {
		return o_content;
	}

	public void setO_content(String o_content) {
		this.o_content = o_content;
	}

	public String getO_rep_img() {
		return o_rep_img;
	}

	public void setO_rep_img(String o_rep_img) {
		this.o_rep_img = o_rep_img;
	}

	public String getO_content_img() {
		return o_content_img;
	}

	public void setO_content_img(String o_content_img) {
		this.o_content_img = o_content_img;
	}

	public Date getO_m_sdate() {
		return o_m_sdate;
	}

	public void setO_m_sdate(Date o_m_sdate) {
		this.o_m_sdate = o_m_sdate;
	}

	public Date getO_m_edate() {
		return o_m_edate;
	}

	public void setO_m_edate(Date o_m_edate) {
		this.o_m_edate = o_m_edate;
	}

	public Date getO_r_sdate() {
		return o_r_sdate;
	}

	public void setO_r_sdate(Date o_r_sdate) {
		this.o_r_sdate = o_r_sdate;
	}

	public Date getO_r_edate() {
		return o_r_edate;
	}

	public void setO_r_edate(Date o_r_edate) {
		this.o_r_edate = o_r_edate;
	}

	public String getO_title() {
		return o_title;
	}

	public void setO_title(String o_title) {
		this.o_title = o_title;
	}

	public String getO_addr() {
		return o_addr;
	}

	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}

	public Integer getO_total_pnum() {
		return o_total_pnum;
	}

	public void setO_total_pnum(Integer o_total_pnum) {
		this.o_total_pnum = o_total_pnum;
	}

	public Integer getO_current_pnum() {
		return o_current_pnum;
	}

	public void setO_current_pnum(Integer o_current_pnum) {
		this.o_current_pnum = o_current_pnum;
	}

	public String getO_payment() {
		return o_payment;
	}

	public void setO_payment(String o_payment) {
		this.o_payment = o_payment;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public Integer getO_readcount() {
		return o_readcount;
	}

	public void setO_readcount(Integer o_readcount) {
		this.o_readcount = o_readcount;
	}
}