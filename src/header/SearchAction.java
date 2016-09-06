package header;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import board.BoardModel;
import config.SqlMapper;
import openmeet.OpenmeetModel;

public class SearchAction{
	private SqlMapClient sqlMapper;
	private List<BoardModel> boList;
	private List<OpenmeetModel> omList;
	
	private String keyword;
	
	public SearchAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		
		return "success";
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
}
