package lendplace;

import java.util.Date;

//대관신청 테이블
public class LendplaceModel {

	// 글번호
	private Integer l_no;

	// 제목
	private String l_subject;

	// 장소 (세부주소)
	private String l_addr;

	// 소속
	private String l_company;

	// 내용
	private String l_content;
	
	// 리스트 대표 이미지
	private String l_rep_img;
	
	// 내용 대표 이미지
	private String l_content_img;

	// 신청자 이름
	private String l_name;

	// 신청자 전화번호
	private String l_phone;

	// 신청자 이메일
	private String l_email;

	// 모임인원
	private Integer l_pnum;

	// 대관시작시간
	private Date l_sdate;

	// 대관종료시간
	private Date l_edate;

	// 대여된 총횟수
	private Integer l_use_num;

	// 유/무료 여부
	private String l_payment;

	// 게시날짜
	private Date l_date;
	
	private Integer m_no;
	
	
	// 장소신청시 날짜부분이 스트링값으로 넘어와 String 날짜변수생성
	private String l_t_sdate; //대관시작
	private String l_t_edate; //대관종료
	
	public String getL_t_sdate() {
		return l_t_sdate;
	}

	public void setL_t_sdate(String l_t_sdate) {
		this.l_t_sdate = l_t_sdate;
	}

	public String getL_t_edate() {
		return l_t_edate;
	}

	public void setL_t_edate(String l_t_edate) {
		this.l_t_edate = l_t_edate;
	}

	
	

	public Integer getL_no() {
		return l_no;
	}

	public void setL_no(Integer l_no) {
		this.l_no = l_no;
	}

	public String getL_subject() {
		return l_subject;
	}

	public void setL_subject(String l_subject) {
		this.l_subject = l_subject;
	}

	public String getL_addr() {
		return l_addr;
	}

	public void setL_addr(String l_addr) {
		this.l_addr = l_addr;
	}

	public String getL_company() {
		return l_company;
	}

	public void setL_company(String l_company) {
		this.l_company = l_company;
	}

	public String getL_content() {
		return l_content;
	}

	public void setL_content(String l_content) {
		this.l_content = l_content;
	}

	public String getL_rep_img() {
		return l_rep_img;
	}

	public void setL_rep_img(String l_rep_img) {
		this.l_rep_img = l_rep_img;
	}

	public String getL_content_img() {
		return l_content_img;
	}

	public void setL_content_img(String l_content_img) {
		this.l_content_img = l_content_img;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getL_phone() {
		return l_phone;
	}

	public void setL_phone(String l_phone) {
		this.l_phone = l_phone;
	}

	public String getL_email() {
		return l_email;
	}

	public void setL_email(String l_email) {
		this.l_email = l_email;
	}

	public Integer getL_pnum() {
		return l_pnum;
	}

	public void setL_pnum(Integer l_pnum) {
		this.l_pnum = l_pnum;
	}

	public Date getL_sdate() {
		return l_sdate;
	}

	public void setL_sdate(Date l_sdate) {
		this.l_sdate = l_sdate;
	}

	public Date getL_edate() {
		return l_edate;
	}

	public void setL_edate(Date l_edate) {
		this.l_edate = l_edate;
	}

	public Integer getL_use_num() {
		return l_use_num;
	}

	public void setL_use_num(Integer l_use_num) {
		this.l_use_num = l_use_num;
	}

	public String getL_payment() {
		return l_payment;
	}

	public void setL_payment(String l_payment) {
		this.l_payment = l_payment;
	}

	public Date getL_date() {
		return l_date;
	}

	public void setL_date(Date l_date) {
		this.l_date = l_date;
	}
	
	public Integer getM_no() {
		return m_no;
	}

	public void setM_no(Integer m_no) {
		this.m_no = m_no;
	}



}