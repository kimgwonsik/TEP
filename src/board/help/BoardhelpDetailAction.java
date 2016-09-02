package board.help;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import board.help.BoardhelpModel;
import config.SqlMapper;

public class BoardhelpDetailAction implements SessionAware{
	private SqlMapClient sqlMapper;
	private BoardhelpModel data;
	private int bh_no;
	private Map session;
	
	public BoardhelpDetailAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		try {
			data = (BoardhelpModel)sqlMapper.queryForObject("two.selectBoardHelpOne",bh_no);
			
		} catch (Exception e) {
			System.out.println("BoardHelpDetail SQL error : "+e.getMessage());
		}
		return "success";
	}

	public BoardhelpModel getData() {
		return data;
	}

	public void setData(BoardhelpModel data) {
		this.data = data;
	}

	public int getBh_no() {
		return bh_no;
	}

	public void setBh_no(int bh_no) {
		this.bh_no = bh_no;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
	
	
}
