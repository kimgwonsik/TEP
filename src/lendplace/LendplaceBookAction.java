package lendplace;
import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;

import members.*;

public class LendplaceBookAction implements SessionAware{
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

	public int getL_no() {
		return l_no;
	}

	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	
	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	
	@Override
	public void setSession(Map session) {
		this.session = session;
	}
	public Map getSession() {
		return session;
	}
}
