package mypage;

import config.SqlMapper;
import com.ibatis.sqlmap.client.SqlMapClient;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import members.MembersModel;

public class MypageModifyAction implements SessionAware{
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
	
	private Map<String, String> session;
	
	public MypageModifyAction() {
		sqlMapper=SqlMapper.getMapper();
	}
	public String modifyPwChk(){
		return "success";
	}
	
	public String form() throws Exception{
		System.out.println(getM_password());

		setM_email(session.get("session_m_email").toString());
		resultClass=(MembersModel)sqlMapper.queryForObject("two.selectOneMember", m_email);
		
		if(getM_password().equals(resultClass.getM_password())){
			return "success";
		}else
			return "error";
	}

	public String execute() throws Exception{
		paramClass=new MembersModel();
		paramClass.setM_email(getM_email());
		paramClass.setM_name(getM_name());
		paramClass.setM_nickname(getM_nickname());
		paramClass.setM_password(getM_password());
		paramClass.setM_phone(getM_phone());
		paramClass.setM_company(getM_company());
		paramClass.setM_fav_area(getM_fav_area());
		paramClass.setM_fav_field(getM_fav_field());

		sqlMapper.update("two.modifyMember", paramClass);//여기가 이상한듯?

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

	public void setSession(Map session) {
		this.session = session;
	}

	public Map<String, String> getSession() {
		return session;
	}
	
	
}
