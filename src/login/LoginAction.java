package login;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;
import members.MembersModel;

public class LoginAction extends ActionSupport implements SessionAware{
	public static SqlMapClient sqlMapper1;
	private static final long serialVersionUID = 1L;

	private SqlMapClient sqlMapper;

	private String m_email;
	private String m_password;
	private Map session;
	private MembersModel paramClass;
	private MembersModel resultClass;

	public String index() throws Exception{
		/*if(session.get("session_m_email")==null)
			return "login";
		else*/
			return "success";
	}
	
	public LoginAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String login() throws Exception{
		paramClass=new MembersModel();
		
		paramClass.setM_email(m_email);
		paramClass.setM_password(m_password);
	
		resultClass = (MembersModel)sqlMapper.queryForObject("two.loginCheck", paramClass);
		
		if(resultClass != null){
			session.put("session_m_email", resultClass.getM_email());
			session.put("session_m_name", resultClass.getM_name());
			session.put("session_m_no", resultClass.getM_no());
			return "success";
		}
		return "error";
	}
	
	public String logout() throws Exception{
		if(session.get("session_m_email") != null){
			session.remove("session_m_email");
			session.remove("session_m_name");
			session.remove("session_m_no");
		}
		return "success";
	}
	

	

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public MembersModel getParamClass() {
		return paramClass;
	}

	public void setParamClass(MembersModel paramClass) {
		this.paramClass = paramClass;
	}

	public MembersModel getResultClass() {
		return resultClass;
	}

	public void setResultClass(MembersModel resultClass) {
		this.resultClass = resultClass;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}
	
}
