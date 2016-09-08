package openmeet;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import util.PagingCalculator;
import util.TepConstants;
import util.TepUtils;

public class OpenmeetAction implements SessionAware, ServletRequestAware, ServletResponseAware{
	private List<OpenmeetModel> list;
	private SqlMapClient sqlMapper;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 6;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingCalculator page;
	
	private Map session;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private String searchWord;
	private String query;
	
	public OpenmeetAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
//		TepUtils.savePageURI(request, session);
		search();
		return "success";
	}
	
	private void search(){
		try {
			cookieValues();
			
			list = sqlMapper.queryForList("jin.openmeet_search", query);
			totalCount = list.size();
			PagingCalculator page = new PagingCalculator("search", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			list = list.subList(page.getStartCount(), lastCount);
		} catch (Exception e) {
			System.out.println("search openmeet error : "+e.getMessage());
		}
	}
	
	private void listAll(){
		try {
			list = sqlMapper.queryForList("jin.openmeet_select_all");
			totalCount = list.size();
			page = new PagingCalculator("openmeet", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			list = list.subList(page.getStartCount(), lastCount);
		} catch (Exception e) {
			System.out.println("openmeet listAll error : "+e.getMessage());
		}
	}

	private void cookieValues(){
		if(searchWord != null && searchWord.length() > 0){
			TepUtils.setCookie(response, TepConstants.SAVEWORD, searchWord);
		} else {
			searchWord = TepUtils.getCookies(request, TepConstants.SAVEWORD);
		}
		
		query = "o_subject like '%"+searchWord+"%' or o_content like '%"+searchWord+"%'";
	}
	
	public List<OpenmeetModel> getList() {
		return list;
	}

	public void setList(List<OpenmeetModel> list) {
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

	public String getPagingHtml() {
		return pagingHtml;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchWord() {
		return searchWord;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

}
