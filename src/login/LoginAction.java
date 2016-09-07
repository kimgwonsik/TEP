package login;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.TepUtils;

public class LoginAction implements SessionAware{
	public static final String M_EMAIL = "session_m_email";
	public static final String M_NAME= "session_m_name";
	public static final String M_NO = "session_m_no";
	
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
			session.put(M_EMAIL, resultData.getM_email());
			session.put(M_NAME, resultData.getM_name());
			session.put(M_NO, resultData.getM_no());
			return "success";
		}
		return "error";
	}
	
	public String logout() throws Exception{
		if(session.get(M_EMAIL) != null){
			session.remove(M_EMAIL);
			session.remove(M_NAME);
			session.remove(M_NO);

			if(session.get(TepUtils.SAVEURI) != null){
				session.remove(TepUtils.SAVEURI);
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
