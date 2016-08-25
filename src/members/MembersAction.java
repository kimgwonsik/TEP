package members;
import members.MembersModel;
import com.ibatis.sqlmap.client.SqlMapClient;
import java.util.Date;
import java.util.*;
import config.SqlMapper;
import java.sql.*;
public class MembersAction {

	private MembersModel vo = new MembersModel();
	private SqlMapClient sqlMapper;
	
	private String m_email;
	private String m_name;
	private String m_nickname;
	private String m_password;
	private String m_phone;
	private String m_fav_area;
	private String m_fav_field;
	private Date m_date;
	
	public MembersAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String Insert() throws Exception{
		
		vo.setM_email(m_email);
		vo.setM_name(m_name);
		vo.setM_nickname(m_nickname);
		vo.setM_password(m_password);
		vo.setM_phone(m_phone);
		vo.setM_fav_area(m_fav_area);
		vo.setM_fav_field(m_fav_field);
		vo.setM_date(m_date);
		
		
		sqlMapper.insert("insertMember", vo);
		
		return "success";
		
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

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	
	
	
}
