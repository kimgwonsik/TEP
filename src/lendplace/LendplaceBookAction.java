package lendplace;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import board.BoardModel;
import config.SqlMapper;

import members.*;
import util.TepUtils;


public class LendplaceBookAction extends LendplacebookModel implements SessionAware{
	private LendplaceModel detailData = new LendplaceModel();
	private MembersModel sessionData = new MembersModel();
	private SqlMapClient sqlMapper;
	private int currentPage;
	private int l_no;
	private int m_no;
	private Map session;
	
	public LendplaceBookAction(){
		sqlMapper=SqlMapper.getMapper();
	}
	public String execute(){
		try {
			detailData = (LendplaceModel) sqlMapper.queryForObject("lendplace_select_one", getL_no());
			sessionData = (MembersModel) sqlMapper.queryForObject("members_select_one_where_m_no", session.get("session_m_no"));
		} catch (SQLException e) {
			System.out.println("lendplace_select_one EX : "+e.getMessage());
		}
		return "success";
	}
	
	public String insert() throws Exception{
		LendplacebookModel bi = new LendplacebookModel();
		int m_no = (int) session.get("session_m_no");
		try {
			bi.setLb_sdate(TepUtils.dateParse(getLb_t_sdate()));
			bi.setLb_edate(TepUtils.dateParse(getLb_t_edate()));
			bi.setLb_name(getLb_name());
			bi.setLb_company(getLb_company());
			bi.setLb_phone(getLb_phone());
			bi.setLb_email(getLb_email());
			bi.setLb_regdate(Calendar.getInstance().getTime());
			bi.setM_no(m_no);
			bi.setL_no(getL_no());
			
			sqlMapper.insert("book_insert",bi);
			
		} catch (Exception e) {
			System.out.println("LendplaceBookAction insert ex : "+e.getMessage());
		}
		return "success";
	}
	
	
	
	public LendplaceModel getDetailData() {
		return detailData;
	}

	public void setDetailData(LendplaceModel detailData) {
		this.detailData = detailData;
	}
	
	public MembersModel getSessionData() {
		return sessionData;
	}
	
	public void setSessionData(MembersModel sessionData) {
		this.sessionData = sessionData;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	
	@Override
	public void setSession(Map session) {
		this.session = session;
	}
	public Map getSession() {
		return session;
	}
}
