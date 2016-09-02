package board.help;

import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;

public class BoardhelpModifyAction extends BoardhelpModel implements SessionAware{
	private SqlMapClient sqlMapper;
	private Map session;
	private int update = -1;
	
	public BoardhelpModifyAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String UpdateForm(){
		return "success";
	}
	
	public String update(){
		int m_no = (int) session.get("session_m_no");
		try {
			MembersModel meminfo = (MembersModel)sqlMapper.queryForObject("two.selectOneMember_m_no",m_no);
			setBh_name(meminfo.getM_name());
			setBh_email(meminfo.getM_email());
			setBh_phone(meminfo.getM_phone());
			setBh_date(Calendar.getInstance().getTime());
			setM_no(m_no);
		
			sqlMapper.update("two.boardHelpUpdate",this);
		} catch (Exception e) {
			System.out.println("BoardHelpUpdateAction insert ex : "+e.getMessage());
		}
		return "success";
	}
	
	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public void setUpdate(int update) {
		this.update = update;
	}
}
