package openmeet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import comments.CommentsModel;
import config.SqlMapper;
import util.TepUtils;

public class OpenmeetDetailAction implements SessionAware{
	private OpenmeetModel detailData;
	private List<CommentsModel> cmtData = new ArrayList<CommentsModel>();
	private SqlMapClient sqlMapper;
	private int o_no;
	private int c_no;
	private String c_content;
	private Map session;
	
	public OpenmeetDetailAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	@SuppressWarnings("unchecked")
	public String execute(){
		try {
			detailData = (OpenmeetModel) sqlMapper.queryForObject("jin.openmeet_select_one", getO_no());
			detailData.setO_meetdate(TepUtils.dateFormat(detailData.getO_m_sdate(), detailData.getO_m_edate()));
			detailData.setO_registerdate(TepUtils.dateFormat(detailData.getO_r_sdate(), detailData.getO_r_edate()));
			detailData.setO_permit_pnum(detailData.getO_total_pnum()-detailData.getO_current_pnum());
			
			cmtData = sqlMapper.queryForList("jin.comments_select_all_o_no", getO_no());
		} catch (SQLException e) {
			System.out.println("openmeet detail e : "+e.getMessage());
		}
		return "success";
	}
	
	public String insertComments(){
		try {
			CommentsModel data = new CommentsModel();
			data.setC_name(session.get("session_m_name").toString());
			data.setC_content(getC_content());
			data.setC_date(Calendar.getInstance().getTime());
			data.setO_no(getO_no());
			data.setM_no((Integer) session.get("session_m_no"));
			sqlMapper.insert("jin.comments_insert", data);
		} catch (Exception e) {
			System.out.println("omd insert cmt e : "+e.getMessage());
		}
		
		execute();
		return "success";
	}
	
	public String deleteComments(){
		try {
			CommentsModel data = new CommentsModel();
			data.setC_no(c_no);
			data.setM_no((Integer) session.get("session_m_no"));
			sqlMapper.delete("jin.comments_delete", data);
		} catch (Exception e) {
			System.out.println("omd delete cmt e : "+e.getMessage());
		}
		execute();
		return "success";
	}

	public OpenmeetModel getDetailData() {
		return detailData;
	}

	public void setDetailData(OpenmeetModel detailData) {
		this.detailData = detailData;
	}

	public List<CommentsModel> getCmtData() {
		return cmtData;
	}

	public void setCmtData(List<CommentsModel> cmtData) {
		this.cmtData = cmtData;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}
	
}
