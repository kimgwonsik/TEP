package board;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import comments.CommentsModel;
import config.SqlMapper;

public class BoardDetailAction implements SessionAware{
	private SqlMapClient sqlMapper;
	private BoardModel data;
	private List<CommentsModel> cmtData = new ArrayList<>();
	private int b_no;
	private int c_no;
	private String c_content;
	private Map session;
	
	public BoardDetailAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		try {
			sqlMapper.update("jin.board_update_readcount",b_no);
			data = (BoardModel)sqlMapper.queryForObject("jin.board_select_one",b_no);
			
			cmtData = sqlMapper.queryForList("jin.comments_select_all_b_no",b_no);
		} catch (Exception e) {
			System.out.println("BoardDetail SQL error : "+e.getMessage());
		}
		return "success";
	}
	
	public String modify(){
		try {
			data = (BoardModel)sqlMapper.queryForObject("jin.board_select_one",b_no);
		} catch (Exception e) {
			System.out.println("Board modify SQL error : "+e.getMessage());
		}
		return "success";
	}
	
	public String delete(){
		BoardModel data = new BoardModel();
		data.setB_no(b_no);
		data.setM_no((Integer) session.get("session_m_no"));
		try {
			sqlMapper.delete("jin.board_delete",data);
			sqlMapper.delete("jin.comments_delete_all_board",b_no);
		} catch (Exception e) {
			System.out.println("Board delete SQL error : "+e.getMessage());
		}
		return "success";
	}

	public String insertComments(){
		try {
			CommentsModel data = new CommentsModel();
			data.setC_name(session.get("session_m_name").toString());
			data.setC_content(c_content);
			data.setC_date(Calendar.getInstance().getTime());
			data.setB_no(b_no);
			data.setM_no((Integer) session.get("session_m_no"));
			sqlMapper.insert("jin.comments_insert", data);
		} catch (Exception e) {
			System.out.println("board insert cmt e : "+e.getMessage());
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
			System.out.println("board delete cmt e : "+e.getMessage());
		}
		execute();
		return "success";
	}
	
	public BoardModel getData() {
		return data;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public int getB_no() {
		return b_no;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public List<CommentsModel> getCmtData() {
		return cmtData;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

}
