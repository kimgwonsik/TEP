package openmeet;

import java.util.Date;

public class SubscribeModel {
	private Integer s_no; //auto increase
	private String s_name; //이름
	private String s_email; //이메일
	private String s_company; //소속
	private String s_phone; //전화번호
	private Integer s_snum; //신청인원
	private Date s_date;
	private Integer o_no; //모임글번호
	private Integer m_no; //회원번호
	
	public Integer getS_no() {
		return s_no;
	}
	public void setS_no(Integer s_no) {
		this.s_no = s_no;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_email() {
		return s_email;
	}
	public void setS_email(String s_email) {
		this.s_email = s_email;
	}
	public String getS_company() {
		return s_company;
	}
	public void setS_company(String s_company) {
		this.s_company = s_company;
	}
	public String getS_phone() {
		return s_phone;
	}
	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}
	public Integer getO_no() {
		return o_no;
	}
	public void setO_no(Integer o_no) {
		this.o_no = o_no;
	}
	public Integer getM_no() {
		return m_no;
	}
	public void setM_no(Integer m_no) {
		this.m_no = m_no;
	}
	public Integer getS_snum() {
		return s_snum;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public void setS_snum(Integer s_snum) {
		this.s_snum = s_snum;
	}
}
