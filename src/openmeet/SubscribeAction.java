package openmeet;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.TepUtils;

public class SubscribeAction implements SessionAware{
	private Map session;
	private SqlMapClient sqlMapper;
	
	private MembersModel mData;
	private OpenmeetModel detailData;
	
	private int o_no;
	private boolean update_meminfo = false;
	
	public SubscribeAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		
		try {
			detailData = (OpenmeetModel) sqlMapper.queryForObject("jin.openmeet_select_one", o_no);
			detailData.setO_meetdate(TepUtils.dateFormat(detailData.getO_m_sdate(), detailData.getO_m_edate()));
			detailData.setO_registerdate(TepUtils.dateFormat(detailData.getO_r_sdate(), detailData.getO_r_edate()));
			detailData.setO_permit_pnum(detailData.getO_total_pnum()-detailData.getO_current_pnum());
			
			mData = (MembersModel) sqlMapper.queryForObject("jin.members_select_one_where_m_no",session.get("session_m_no"));
		} catch (SQLException e) {
			System.out.println("subscribe select e : "+e.getMessage());
		}
		return "success";
	}
	
	public String insert(){
		
		return "success";
	}
	
	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public OpenmeetModel getDetailData() {
		return detailData;
	}

	public MembersModel getmData() {
		return mData;
	}

	public void setUpdate_meminfo(boolean update_meminfo) {
		System.out.println("udate : "+update_meminfo);
		this.update_meminfo = update_meminfo;
	}

}
