package board;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;

public class BoardDetailAction{
	private SqlMapClient sqlMapper;
	private BoardModel data;
	private int b_no;
	
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

	public BoardModel getData() {
		return data;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public int getB_no() {
		return b_no;
	}
}
