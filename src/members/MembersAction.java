package members;
import members.MembersModel;
import com.ibatis.sqlmap.client.SqlMapClient;
import java.util.*;

import org.apache.struts2.interceptor.SessionAware;

import config.SqlMapper;
import java.sql.*;
public class MembersAction extends MembersModel implements SessionAware{
	public static final String M_EMAIL = "session_m_email";
	public static final String M_NAME= "session_m_name";
	public static final String M_NO = "session_m_no";
	
	private SqlMapClient sqlMapper;
	private Map session;
	Calendar today = Calendar.getInstance();
	
	public MembersAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String MemberForm(){
		return "success";
	}
	public String Insert() throws Exception{
		MembersModel vo = new MembersModel();
		
		vo.setM_email(getM_email());
		vo.setM_name(getM_name());
		vo.setM_nickname(getM_nickname());
		vo.setM_password(getM_password());
		vo.setM_phone(getM_phone());
		vo.setM_company(getM_company());
		vo.setM_fav_area(getM_fav_area());
		vo.setM_fav_field(getM_fav_field());
		vo.setM_date(today.getTime());
		

		
		sqlMapper.insert("two.insertMember", vo);
		
		session.put(M_EMAIL, vo.getM_email());
		session.put(M_NAME, vo.getM_name());
		session.put(M_NO, vo.getM_no());
		
		return "success";
		
	
	}
	@Override
	public void setSession(Map session) {
		this.session = session;
	}

}
