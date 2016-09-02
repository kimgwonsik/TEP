package board.help;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import members.MembersModel;

public class BoardhelpDeleteAction implements SessionAware{
	private SqlMapClient sqlMapper;
	private MembersModel paramClass;
	private MembersModel resultClass;
	
	private String m_email;
	private String m_password;
	private int deleteCheck;
	private Map<String, String> session;
	
	
	
	
	
	
	
	@Override
	public void setSession(Map arg0) {
		// TODO Auto-generated method stub
		
	}
}
