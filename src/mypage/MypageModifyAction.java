package mypage;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import config.SqlMapper;
import com.ibatis.sqlmap.client.SqlMapClient;

import java.sql.SQLException;
import java.util.Map;
import members.MembersModel;

public class MypageModifyAction {
	private SqlMapClient sqlMapper;
	private MembersModel paramClass;
	private MembersModel resultClass;
	
	private String m_email;
	private String m_name;
	private String m_nickname;
	private String m_password;
	private String m_phone;
	private String m_company;
	private String m_fav_area;
	private String m_fav_field;
	
	private Map<String,Object> session;
	
	public MypageModifyAction() {
		sqlMapper=SqlMapper.getMapper();
	}
	public String modifyPwChk(){
		return "success";
	}
	
	public String form() throws Exception{
	
		paramClass=new MembersModel();
		resultClass=new MembersModel();
		
		m_email=ActionContext.getContext().getSession().get("session_m_email").toString();
		resultClass=(MembersModel)sqlMapper.queryForObject("two.selectOneMember", m_email);
		
		if(resultClass.getM_password().equals(m_password)){
			return "success";
		}else
			return "error";
	}
	
	public String execute() throws Exception{
		ActionContext context=ActionContext.getContext();
		session=context.getSession();
		if(session.get("session_m_email")==null){
			return "login";
		}
		paramClass=new MembersModel();
		paramClass.setM_email(getM_email());
		paramClass.setM_name(getM_name());
		paramClass.setM_password(getM_password());
		paramClass.setM_phone(getM_phone());
		paramClass.setM_company(getM_company());
		paramClass.setM_fav_area(getM_fav_area());
		paramClass.setM_fav_field(getM_fav_field());
		
		sqlMapper.update("two.modifyMember", paramClass);
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

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_company() {
		return m_company;
	}

	public void setM_company(String m_company) {
		this.m_company = m_company;
	}

	public String getM_fav_area() {
		return m_fav_area;
	}

	public void setM_fav_area(String m_fav_area) {
		this.m_fav_area = m_fav_area;
	}

	public String getM_fav_field() {
		return m_fav_field;
	}

	public void setM_fav_field(String m_fav_field) {
		this.m_fav_field = m_fav_field;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	
	
}
