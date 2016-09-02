package mypage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import board.BoardModel;
import config.SqlMapper;
import util.PagingCalculator;

public class MypageHelpHistoryAction implements SessionAware{
	private static final int SEARCHKEY_SUBEJCT = 0;
	private static final int SEARCHKEY_SUBJECT_CONTENT = 1;
	private static final int SEARCHKEY_NAME = 2;
	
	private List<BoardModel> list = new ArrayList<BoardModel>();
	private SqlMapClient sqlMapper;
	
	private int m_no;
	private Map session;
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingCalculator page;
	
	private int searchKey = -1;
	private String searchWord = "";
	
	
	public MypageHelpHistoryAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		try {
			if(searchKey != -1 && searchWord.length() > 0){
				search();
			} else {
				list = sqlMapper.queryForList("two.writeBoardList", m_no);
			}
			
			totalCount = list.size();
			page = new PagingCalculator("board", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			list = list.subList(page.getStartCount(), lastCount);
		} catch (Exception e) {
			System.out.println("BoardHelp SelectALL Ex: "+e.getMessage());
		}
		
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	private void search() throws SQLException {
		switch (getSearchKey()) {
		case SEARCHKEY_SUBEJCT:
			list = sqlMapper.queryForList("two.search_b_subject_select_all", getSearchWord());
			break;
		case SEARCHKEY_SUBJECT_CONTENT:
			list = sqlMapper.queryForList("two.search_b_subject_content_select_all", getSearchWord());
			break;
		case SEARCHKEY_NAME:
			list = sqlMapper.queryForList("two.search_b_name_select_all", getSearchWord());
			break;
		}
	}
	
	
	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public List<BoardModel> getList() {
		return list;
	}

	public void setList(List<BoardModel> list) {
		this.list = list;
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

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public PagingCalculator getPage() {
		return page;
	}

	public void setPage(PagingCalculator page) {
		this.page = page;
	}

	public int getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(int searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public Map getSession() {
		return session;
	}

	@Override
	public void setSession(Map arg0) {
		// TODO Auto-generated method stub
		
	}
}
