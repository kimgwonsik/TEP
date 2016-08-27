package comments;

import java.util.Date;

//답변글 테이블
public class CommentsModel {

	// 답변글번호
	private Integer c_no;

	// 작성자
	private String c_name;

	// 답변내용
	private String c_content;

	// 답변날짜
	private Date c_date;

	// 댓글의 댓글시 no
	private Integer c_my_no;
	
	// 모임개설 FK
	private Integer o_no;
	
	// 스승찾기 FK
	private Integer bt_no;
	
	// 제자찾기 FK
	private Integer bd_no;
	
	// 회원고유번호 FK
	private Integer m_no;
	
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

	public Integer getC_my_no() {
		return c_my_no;
	}

	public void setC_my_no(Integer c_my_no) {
		this.c_my_no = c_my_no;
	}

	public Integer getO_no() {
		return o_no;
	}

	public void setO_no(Integer o_no) {
		this.o_no = o_no;
	}

	public Integer getBt_no() {
		return bt_no;
	}

	public void setBt_no(Integer bt_no) {
		this.bt_no = bt_no;
	}

	public Integer getBd_no() {
		return bd_no;
	}

	public void setBd_no(Integer bd_no) {
		this.bd_no = bd_no;
	}

	public Integer getM_no() {
		return m_no;
	}

	public void setM_no(Integer m_no) {
		this.m_no = m_no;
	}

}