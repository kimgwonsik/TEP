package board.help;

import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;

public class BoardhelpWriteAction extends BoardhelpModel implements SessionAware{

	private SqlMapClient sqlMapper;
	private Map session;
	
	public BoardhelpWriteAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String form(){
		return "success";
	}
	
	public String insert(){
		int m_no = (int) session.get("session_m_no");
		try {
			MembersModel meminfo = (MembersModel)sqlMapper.queryForObject("two.selectOneMember_m_no",m_no);
			
			setBh_name(meminfo.getM_name());
			setBh_email(meminfo.getM_email());
			setBh_phone(meminfo.getM_phone());
			setBh_date(Calendar.getInstance().getTime());
			setM_no(m_no);
		
			sqlMapper.insert("two.boardHelpInsert",this);
		} catch (Exception e) {
			System.out.println("BoardHelpWriteAction insert ex : "+e.getMessage());
		}
		return "success";
	}
	
	@Override
	public void setSession(Map session) {
		this.session = session;
	}
}
