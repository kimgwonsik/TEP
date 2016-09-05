package mypage;

import config.SqlMapper;
import com.ibatis.sqlmap.client.SqlMapClient;

import board.help.BoardhelpModel;

import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import members.MembersModel;

public class MypageModifyAction extends MembersModel implements SessionAware{
	private SqlMapClient sqlMapper;
	private MembersModel resultClass;
	private String m_email;
	private String m_password;

	
	private Map session;
	
	public MypageModifyAction() {
		sqlMapper=SqlMapper.getMapper();
	}
	public String modifyPwChk(){
		return "success";
	}
	
	public String form() throws Exception{
		//System.out.println(resultClass.getM_password());

		setM_email(session.get("session_m_email").toString());
		resultClass=(MembersModel)sqlMapper.queryForObject("two.selectOneMember", m_email);
		
		if(getM_password().equals(resultClass.getM_password())){
			return "success";
		}else
			return "error";
	}

	public String execute() throws Exception{
		setM_no((int)session.get("session_m_no"));
		setM_email(getM_email());
		setM_name(getM_name());
		setM_nickname(getM_nickname());
		setM_password(getM_password());
		setM_phone(getM_phone());
		setM_company(getM_company());
		setM_fav_area(getM_fav_area());
		setM_fav_field(getM_fav_field());

		sqlMapper.update("two.modifyMember", this);

		return "success";
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
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
	
	
}
