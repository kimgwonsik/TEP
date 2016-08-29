package login;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import config.SqlMapper;
import members.MembersModel;

public class LoginAction extends ActionSupport implements SessionAware{
	
	private static final long serialVersionUID = 1L;

	private SqlMapClient sqlMapper;
	private String m_email;
	private String m_password;
	private Map<String, String> session;
	private ActionContext context = ActionContext.getContext();
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
			
			//session 저장
			context.setSession(session);
			return "success";
		}
		return "error";
	}
	
	@SuppressWarnings("unchecked")
	public String logout() throws Exception{
		session = context.getSession();
		if(session.get("m_email") != null){
			session.remove("session_m_email");
			session.remove("session_m_name");
			
			//session 삭제
			ActionContext.getContext().setSession(session);
		}
		return "success";
	}
	
	@Override
	public void setSession(Map session) {
		this.session=session;
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

	public Map getSession() {
		return session;
	}

	
	
}
