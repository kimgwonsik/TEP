package login;
import config.SqlMapper;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import com.ibatis.sqlmap.client.SqlMapClient;
import members.MembersModel;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends MembersModel implements SessionAware{
	
	public static SqlMapClient sqlMapper;
	
	private String m_email;
	private String m_password;
	private Map session;
	private MembersModel paramClass = new MembersModel();
	private MembersModel resultClass = new MembersModel();


	public String index() throws Exception{
		if(session.get("session_m_email")==null)
			return "login";
		else
			return "success";
	}
	
	public LoginAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String login() throws Exception{
		
	
		resultClass = (MembersModel)sqlMapper.queryForObject("two.loginCheck", getM_email());
		
		if(resultClass != null){
			if(resultClass.getM_password().equals(getM_password())){
			session.put("m_email", resultClass.getM_email());
			session.put("m_password", resultClass.getM_password());
			}
			return "success";
		}
		return "error";
	}
	
	public String logout() throws Exception{
		if(session.get("m_email") != null){
			session.remove("m_email");
			session.remove("m_password");
		}
		return "success";
	}
	
	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session=session;
	}

}
