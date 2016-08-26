package login;
import config.SqlMapper;
import com.ibatis.sqlmap.client.SqlMapClient;
import members.MembersModel;

public class LoginAction extends MembersModel{

	private MembersModel vo = new MembersModel();
	private SqlMapClient sqlMapper;
	
	private String m_email;
	private String m_password;
	private int check;
	

	public LoginAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String login() throws Exception{
		
		vo.setM_email(getM_email());
		vo.setM_password(getM_password());
		
		
		
		return "success";
		
	}
}
