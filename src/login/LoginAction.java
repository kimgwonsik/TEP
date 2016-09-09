package login;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.TepConstants;

public class LoginAction implements SessionAware{
	private SqlMapClient sqlMapper;
	private Map session;
	
	private String m_email;
	private String m_password;
	
	public String index() throws Exception{
			return "success";
	}
	
	public LoginAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String login() throws Exception{
		MembersModel data = new MembersModel();
		data.setM_email(m_email);
		data.setM_password(m_password);
	
		MembersModel resultData = (MembersModel)sqlMapper.queryForObject("two.loginCheck", data);
		
		if(resultData != null){
			session.put(TepConstants.M_EMAIL, resultData.getM_email());
			session.put(TepConstants.M_NAME, resultData.getM_name());
			session.put(TepConstants.M_NO, resultData.getM_no());
			return "success";
		}
		return "error";
	}
	
	public String logout() throws Exception{
		if(session.get(TepConstants.M_EMAIL) != null){
			session.remove(TepConstants.M_EMAIL);
			session.remove(TepConstants.M_NAME);
			session.remove(TepConstants.M_NO);

			if(session.get(TepConstants.SAVEURI) != null){
				session.remove(TepConstants.SAVEURI);
			}
		}
		return "success";
	}
	
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

}
