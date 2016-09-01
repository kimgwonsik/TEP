package board;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;

public class BoardDetailAction implements SessionAware{
	private SqlMapClient sqlMapper;
	private BoardModel data;
	private int b_no;
	private Map session;
	
	public BoardDetailAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		try {
			sqlMapper.update("jin.board_update_readcount",b_no);
			data = (BoardModel)sqlMapper.queryForObject("jin.board_select_one",b_no);
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
		} catch (Exception e) {
			System.out.println("Board delete SQL error : "+e.getMessage());
		}
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
}
