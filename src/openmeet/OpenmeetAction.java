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
	private String search_category;
	private String search_area;
	
	public OpenmeetAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() {
		TepUtils.savePageURI(request, session);
		listAll();
		return "success";
	}

	public String search(){
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
		return "success";
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
		if(searchWord != null){
			TepUtils.setCookie(response, TepConstants.SAVE_WORD, searchWord);
		} else {
			searchWord = TepUtils.getCookies(request, TepConstants.SAVE_WORD);
		}
		
		if(search_category != null){
			TepUtils.setCookie(response, TepConstants.SAVE_CATEGORY, search_category);
		} else {
			search_category = TepUtils.getCookies(request, TepConstants.SAVE_CATEGORY);
		}
		
		if(search_area != null){
			TepUtils.setCookie(response, TepConstants.SAVE_AREA, search_area);
		} else {
			search_area = TepUtils.getCookies(request, TepConstants.SAVE_AREA);
		}
		
		
		if(searchWord != null && search_category != null && search_area != null){
			query = "(o_subject like '%"+searchWord+"%' or o_content like '%"+searchWord+"%') and REGEXP_LIKE(o_category,'"+search_category+"') and REGEXP_LIKE(o_addr,'"+search_area+"')";
		}
		
		if(searchWord != null && search_category == null && search_area != null){
			query = "(o_subject like '%"+searchWord+"%' or o_content like '%"+searchWord+"%') and REGEXP_LIKE(o_addr,'"+search_area+"')";
		}
		
		if(searchWord != null && search_category != null && search_area == null){
			query = "(o_subject like '%"+searchWord+"%' or o_content like '%"+searchWord+"%') and REGEXP_LIKE(o_category,'"+search_category+"')";
		}
		
		if(searchWord != null && search_category == null && search_area == null){
			query = "(o_subject like '%"+searchWord+"%' or o_content like '%"+searchWord+"%')";
		}
		
	}
	
	public List<OpenmeetModel> getList() {
		return list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public void setSearch_category(String search_category) {
		this.search_category = search_category;
	}

	public void setSearch_area(String search_area) {
		this.search_area = search_area;
	}

}
