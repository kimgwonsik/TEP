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
	private int update = -1;
	
	public BoardhelpWriteAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String form(){
		return "success";
	}
	
	/*public String insert(){
		int m_no = (int) session.get("session_m_no");
		try {
			MembersModel meminfo = (MembersModel)sqlMapper.queryForObject("jin.members_select_one_where_m_no",m_no);
			
			setB_name(meminfo.getM_name());
			setB_email(meminfo.getM_email());
			setB_company(meminfo.getM_company());
			setB_date(Calendar.getInstance().getTime());
			setM_no(m_no);
			if(update == -1){
				setB_readcount(0);
				sqlMapper.insert("jin.board_insert",this);
			} else if(update == 1){
				
			}
		} catch (Exception e) {
			System.out.println("BoardWriteAction insert ex : "+e.getMessage());
		}
		return "success";
	}
	*/
	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public void setUpdate(int update) {
		this.update = update;
	}
}
