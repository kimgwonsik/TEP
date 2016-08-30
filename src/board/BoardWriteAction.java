package board;

import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;

public class BoardWriteAction extends BoardModel implements SessionAware{
	private SqlMapClient sqlMapper;
	private Map session;
	
	public BoardWriteAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String view(){
		return "success";
	}
	
	public String insert(){
		String sid = getSession().get("session_m_email").toString();
		try {
			MembersModel meminfo = (MembersModel)sqlMapper.queryForObject("jin.members_select_one_where_m_email",sid);
			setB_name(meminfo.getM_name());
			setB_email(meminfo.getM_email());
			setB_company(meminfo.getM_company());
			setB_date(Calendar.getInstance().getTime());
			setB_readcount(0);
			
			sqlMapper.insert("jin.board_insert",this);
		} catch (Exception e) {
			System.out.println("BoardWriteAction insert ex : "+e.getMessage());
		}
		return "success";
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}
	
}
