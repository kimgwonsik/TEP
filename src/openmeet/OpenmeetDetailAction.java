package openmeet;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import util.TepUtils;

public class OpenmeetDetailAction {
	private OpenmeetModel detailData = new OpenmeetModel();
	private SqlMapClient sqlMapper;
	private int currentPage;
	private int o_no;
	
	public OpenmeetDetailAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		try {
			detailData = (OpenmeetModel) sqlMapper.queryForObject("openmeet_select_one", getO_no());
			detailData.setO_meetdate(TepUtils.dateFormat(detailData.getO_m_sdate(), detailData.getO_m_edate()));
			detailData.setO_registerdate(TepUtils.dateFormat(detailData.getO_r_sdate(), detailData.getO_r_edate()));
			detailData.setO_permit_pnum(detailData.getO_total_pnum()-detailData.getO_current_pnum());
		} catch (SQLException e) {
			System.out.println("openmeet_select_one EX : "+e.getMessage());
		}
		return "success";
	}

	public OpenmeetModel getDetailData() {
		return detailData;
	}

	public void setDetailData(OpenmeetModel detailData) {
		this.detailData = detailData;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
}
