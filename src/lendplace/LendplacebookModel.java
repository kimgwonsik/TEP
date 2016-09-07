package lendplace;

import java.util.Date;

//대관신청 접수 테이블
public class LendplacebookModel {

	// 대관신청 번호
	private Integer lb_no;
	
	// 신청자 이름
	private String lb_name;
	
	// 신청자 이메일
	private String lb_email;
	
	// 소속
	private String lb_company;
	
	// 신청자 전화번호
	private String lb_phone;
	
	// 대관시작시간
	private Date lb_sdate;

	// 대관종료시간
	private Date lb_edate;
	
	// 접수완료 시간
	private Date lb_regdate;
	
	// 장소 고유번호
	private Integer l_no;
	
	// 회원 고유번호
	private Integer m_no;
	
	// 장소신청시 날짜부분이 스트링값으로 넘어와 String 날짜변수생성
	private String lb_t_sdate; //대관시작
	private String lb_t_edate; //대관종료
	
	
	public Integer getLb_no() {
		return lb_no;
	}
	public void setLb_no(Integer lb_no) {
		this.lb_no = lb_no;
	}
	public String getLb_name() {
		return lb_name;
	}
	public void setLb_name(String lb_name) {
		this.lb_name = lb_name;
	}
	public String getLb_email() {
		return lb_email;
	}
	public void setLb_email(String lb_email) {
		this.lb_email = lb_email;
	}
	public String getLb_company() {
		return lb_company;
	}
	public void setLb_company(String lb_company) {
		this.lb_company = lb_company;
	}
	public String getLb_phone() {
		return lb_phone;
	}
	public void setLb_phone(String lb_phone) {
		this.lb_phone = lb_phone;
	}
	public Date getLb_sdate() {
		return lb_sdate;
	}
	public void setLb_sdate(Date lb_sdate) {
		this.lb_sdate = lb_sdate;
	}
	public Date getLb_edate() {
		return lb_edate;
	}
	public void setLb_edate(Date lb_edate) {
		this.lb_edate = lb_edate;
	}
	public Date getLb_regdate() {
		return lb_regdate;
	}
	public void setLb_regdate(Date lb_regdate) {
		this.lb_regdate = lb_regdate;
	}
	public Integer getL_no() {
		return l_no;
	}
	public void setL_no(Integer l_no) {
		this.l_no = l_no;
	}
	public Integer getM_no() {
		return m_no;
	}
	public void setM_no(Integer m_no) {
		this.m_no = m_no;
	}
	public String getLb_t_sdate() {
		return lb_t_sdate;
	}
	public void setLb_t_sdate(String lb_t_sdate) {
		this.lb_t_sdate = lb_t_sdate;
	}
	public String getLb_t_edate() {
		return lb_t_edate;
	}
	public void setLb_t_edate(String lb_t_edate) {
		this.lb_t_edate = lb_t_edate;
	}
	
	
	


}
