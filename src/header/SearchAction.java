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
	
	private String searchWord;
	
	public SearchAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		try {
			boList = sqlMapper.queryForList("jin.board_search_b_subject_content_select_all", searchWord);
			omList = sqlMapper.queryForList("jin.", searchWord);
		} catch (Exception e) {
			System.out.println("search error : "+e.getMessage());
		}
		return "success";
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

}
