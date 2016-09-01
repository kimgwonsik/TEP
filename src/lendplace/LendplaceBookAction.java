package lendplace;
import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;

public class LendplaceBookAction {
	private LendplaceModel detailData = new LendplaceModel();
	private SqlMapClient sqlMapper;
	private int currentPage;
	private int l_no;
	
	public LendplaceBookAction(){
		sqlMapper=SqlMapper.getMapper();
	}
	public String execute(){
		try {
			detailData = (LendplaceModel) sqlMapper.queryForObject("lendplace_select_one", getL_no());
		} catch (SQLException e) {
			System.out.println("lendplace_select_one EX : "+e.getMessage());
		}
		return "success";
	}
	public LendplaceModel getDetailData() {
		return detailData;
	}

	public void setDetailData(LendplaceModel detailData) {
		this.detailData = detailData;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getL_no() {
		return l_no;
	}

	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
}
