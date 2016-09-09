package header;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import board.BoardModel;
import config.SqlMapper;
import openmeet.OpenmeetModel;
import util.PagingCalculator;
import util.TepConstants;
import util.TepUtils;

public class SearchAction implements ServletRequestAware, ServletResponseAware{
	private SqlMapClient sqlMapper;
	private List<OpenmeetModel> olist;
	private List<BoardModel> blist;
	
	private String searchWord;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 4;
	private int blockPage = 3;
	private String pagingHtml;
	
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public SearchAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		System.out.println("search execute : "+searchWord);
		try {
			if(searchWord != null && searchWord.length() > 0){
				TepUtils.setCookie(response, TepConstants.SAVE_WORD, searchWord);
			} else {
				searchWord = TepUtils.getCookies(request, TepConstants.SAVE_WORD);
			}
		
			olist = sqlMapper.queryForList("jin.openmeet_search_o_subject_content_select_all", searchWord);
			totalCount = olist.size();
			PagingCalculator page = new PagingCalculator("search", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			olist = olist.subList(page.getStartCount(), lastCount);
		} catch (Exception e) {
			System.out.println("search openmeet error : "+e.getMessage());
		}
		
		
		try {
			blist = sqlMapper.queryForList("jin.board_search_b_subject_content_select_all", searchWord);
		} catch (SQLException e) {
			System.out.println("search board error : "+e.getMessage());
		}
		return "success";
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public List<BoardModel> getBlist() {
		return blist;
	}

	public List<OpenmeetModel> getOlist() {
		return olist;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

}
