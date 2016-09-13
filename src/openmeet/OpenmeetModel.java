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

	// 전화번호
	private String o_phone;
	
	// 소속
	private String o_company;
	
	// 카테고리
	private String o_category;

	// 제목
	private String o_subject;

	// 모임간략소개
	private String o_title;
	
	// 내용
	private String o_content;

	// 모임장소 세부위치
	private String o_addr;
	
	// 리스트 대표이미지
	private String o_rep_img;

	// 내용 대표이미지
	private String o_content_img;

	// 모임시작날짜
	private Date o_m_sdate;

	// 모임종료날짜
	private Date o_m_edate;

	// 모임기간
	private String o_meetdate;
	
	// 접수시작날짜
	private Date o_r_sdate;

	// 접수종료날짜
	private Date o_r_edate;
	
	// 신청기간
	private String o_registerdate;

	// 총 모임 인원
	private Integer o_total_pnum;

	// 현재 신청 인원
	private Integer o_current_pnum;
	
	// 신청 가능 인원
	private Integer o_permit_pnum;
	
	// 유/무료 여부
	private String o_payment;

	// 게시날짜
	private Date o_date;

	// 좋아요 눌린수
	private Integer o_likeit;
	
	// 조회수
	private Integer o_readcount;
	
	// 회원번호
	private Integer m_no;
	
	// 모임개설시 날짜부분이 스트링값으로 넘어와 String 날짜변수생성 (모임기간/접수기간)
	private String o_msdate; //모임시작
	private String o_medate; //모임종료
	private String o_rsdate; //접수시작
	private String o_redate;//접수종료

	
	public String getO_msdate() {
		return o_msdate;
	}

	public void setO_msdate(String o_msdate) {
		this.o_msdate = o_msdate;
	}

	public String getO_medate() {
		return o_medate;
	}

	public void setO_medate(String o_medate) {
		this.o_medate = o_medate;
	}

	public String getO_rsdate() {
		return o_rsdate;
	}

	public void setO_rsdate(String o_rsdate) {
		this.o_rsdate = o_rsdate;
	}

	public String getO_redate() {
		return o_redate;
	}

	public void setO_redate(String o_redate) {
		this.o_redate = o_redate;
	}

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

	public String getO_phone() {
		return o_phone;
	}

	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
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

	public String getO_meetdate() {
		return o_meetdate;
	}

	public void setO_meetdate(String o_meetdate) {
		this.o_meetdate = o_meetdate;
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

	public String getO_registerdate() {
		return o_registerdate;
	}

	public void setO_registerdate(String o_registerdate) {
		this.o_registerdate = o_registerdate;
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

	public Integer getO_permit_pnum() {
		return o_permit_pnum;
	}

	public void setO_permit_pnum(Integer o_permit_pnum) {
		this.o_permit_pnum = o_permit_pnum;
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

	public Integer getM_no() {
		return m_no;
	}

	public void setM_no(Integer m_no) {
		this.m_no = m_no;
	}
	
	public Integer getO_likeit() {
		return o_likeit;
	}

	public void setO_likeit(Integer o_likeit) {
		this.o_likeit = o_likeit;
	}

	// OpenmeetModel 모델 복사
    public void CopyData(OpenmeetModel param) {
    	this.o_no = param.getO_no();
    	this.o_name = param.getO_name();
    	this.o_email = param.getO_email();
    	this.o_phone = param.getO_phone();
    	this.o_company = param.getO_company();
    	this.o_category = param.getO_category();
    	this.o_subject = param.getO_subject();
    	this.o_title = param.getO_title();
    	this.o_content = param.getO_content();
    	this.o_addr = param.getO_addr();
    	this.o_rep_img = param.getO_rep_img();
    	this.o_content_img = param.getO_content_img();
    	this.o_m_sdate = param.getO_m_sdate();
    	this.o_m_edate = param.getO_m_edate();
    	this.o_meetdate = param.getO_meetdate();
    	this.o_r_sdate = param.getO_r_sdate();
    	this.o_r_edate = param.getO_r_edate();
    	this.o_registerdate = param.getO_registerdate();
    	this.o_total_pnum = param.getO_total_pnum();
    	this.o_current_pnum = param.getO_current_pnum();
    	this.o_permit_pnum = param.getO_permit_pnum();
    	this.o_payment = param.getO_payment();
    	this.o_date = param.getO_date();
    	this.o_readcount = param.getO_readcount();
    	this.m_no = param.getM_no();
    	this.o_msdate = param.getO_msdate();
    	this.o_medate = param.getO_medate();
    	this.o_rsdate = param.getO_rsdate();
    	this.o_redate = param.getO_redate();
    	this.o_likeit = param.getO_likeit();
    }
}