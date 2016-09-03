package openmeet;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.TepUtils;

public class SubscribeAction extends SubscribeModel implements SessionAware{
	private Map session;
	private SqlMapClient sqlMapper;
	
	private MembersModel mData;
	private OpenmeetModel detailData;
	
	private int o_current_pnum;
	private boolean update_meminfo = false;
	
	public SubscribeAction() {
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		
		try {
			detailData = (OpenmeetModel) sqlMapper.queryForObject("jin.openmeet_select_one", getO_no());
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
		// 신청가능인원 업데이트
		detailData = new OpenmeetModel();
		detailData.setO_no(getO_no());
		detailData.setO_current_pnum(o_current_pnum);
		try {
			sqlMapper.update("jin.openmeet_update_current_pnum", detailData);
		} catch (Exception e) {
			System.out.println("current pnum update e : "+e.getMessage());
		};
		
		// 신청자정보 등록 및 기존회원정보 업데이트(true일 경우)
		setS_snum(o_current_pnum);
		setO_no(getO_no());
		setM_no((Integer) session.get("session_m_no"));
		try {
			sqlMapper.insert("jin.sub_insert", this);
		} catch (Exception e) {
			System.out.println("subscribe insert e : "+e.getMessage());
		}
		
		if(update_meminfo){
			System.out.println("update in");
			mData = new MembersModel();
			mData.setM_company(getS_company());
			mData.setM_name(getS_name());
			mData.setM_phone(getS_phone());
			mData.setM_no((Integer) session.get("session_m_no"));
			try {
				sqlMapper.update("jin.members_update_subinfo",mData);
			} catch (Exception e) {
				System.out.println("subscribe update meminfo e : "+e.getMessage());
			}
		}
		return "success";
	}
	
	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public OpenmeetModel getDetailData() {
		return detailData;
	}

	public MembersModel getmData() {
		return mData;
	}

	public void setUpdate_meminfo(boolean update_meminfo) {
		this.update_meminfo = update_meminfo;
	}

	public void setO_current_pnum(int o_current_pnum) {
		this.o_current_pnum = o_current_pnum;
	}

}
