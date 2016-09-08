package mypage;
import config.SqlMapper;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionContext;
import members.MembersModel;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
public class MypageDeleteAction implements SessionAware{
	public static final String M_EMAIL = "session_m_email";
	public static final String M_NAME= "session_m_name";
	public static final String M_NO = "session_m_no";
	//implements SessionAware로 수정하기
	private SqlMapClient sqlMapper;
	private MembersModel paramClass;
	private MembersModel resultClass;
	
	private String m_email;
	private String m_password;
	private int deleteCheck;
	private Map session;
	
	public MypageDeleteAction() {
		sqlMapper=SqlMapper.getMapper();
	}
	
	public String deleteForm() throws Exception{
		return "success";
	}
	
	public String execute() throws Exception{
		paramClass=new MembersModel();
		resultClass=new MembersModel();
		//m_email=session.get("session_m_email");
		m_email=ActionContext.getContext().getSession().get("session_m_email").toString();
		resultClass=(MembersModel)sqlMapper.queryForObject("two.selectOneMember", m_email);
		
		if(resultClass.getM_password().equals(m_password)){
			deleteCheck=1;
			paramClass.setM_email(getM_email());
			
			sqlMapper.delete("two.deleteMember", paramClass);
		}else{
			deleteCheck=0;
		}
		session.remove(M_EMAIL);
		session.remove(M_NAME);
		session.remove(M_NO);
		return "success";
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

	public int getDeleteCheck() {
		return deleteCheck;
	}

	public void setDeleteCheck(int deleteCheck) {
		this.deleteCheck = deleteCheck;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	
	
}
