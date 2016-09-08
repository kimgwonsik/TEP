package mypage;

import java.util.Map;
import config.SqlMapper;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import members.MembersModel;

public class MypageAction extends MembersModel implements SessionAware {
	private SqlMapClient sqlMapper;
	private MembersModel resultClass;
	private String m_email;
	private Map session;
	
	public MypageAction(){
		sqlMapper=SqlMapper.getMapper();
	}
	
	public String execute() throws Exception {

		setM_email(session.get("session_m_email").toString());
		resultClass=(MembersModel)sqlMapper.queryForObject("two.selectOneMember", m_email);
		
		return "success";
	}
	@Override
	public void setSession(Map session) {
		this.session = session;
	}
	public MembersModel getResultClass() {
		return resultClass;
	}
	public void setResultClass(MembersModel resultClass) {
		this.resultClass = resultClass;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
}
