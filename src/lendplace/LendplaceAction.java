package lendplace;

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

public class LendplaceAction implements SessionAware, ServletRequestAware, ServletResponseAware{
	private List<LendplaceModel> list;
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
	private String search_people;
	private String search_area;
	private String search_payment;
	
	public LendplaceAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute(){
		TepUtils.savePageURI(request, session);
		listAll();
		return "success";
	}
	
	public String search(){
		try {
			cookieValues();
			
			list = sqlMapper.queryForList("jin.lendplace_search", query);
			totalCount = list.size();
			page = new PagingCalculator("lsearch", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			list = list.subList(page.getStartCount(), lastCount);
		} catch (Exception e) {
			System.out.println("search lendplace error : "+e.getMessage());
		}
		return "success";
	}
	
	private void listAll(){
		try {
			list = sqlMapper.queryForList("lendplace_select_all");
			totalCount = list.size();
			page = new PagingCalculator("lendplace", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			list = list.subList(page.getStartCount(), lastCount);
		} catch (Exception e) {
			System.out.println("lendplace list all error : "+e.getMessage());
		}
	}
	
	private void cookieValues(){
		
		if(searchWord != null){
			TepUtils.setCookie(response, TepConstants.SAVE_WORD, searchWord);
		} else {
			searchWord = TepUtils.getCookies(request, TepConstants.SAVE_WORD);
		}
		
		if(search_people != null){
			TepUtils.setCookie(response, TepConstants.SAVE_PEOPLE, search_people);
		} else {
			search_people = TepUtils.getCookies(request, TepConstants.SAVE_PEOPLE);
		}
		
		if(search_area != null){
			TepUtils.setCookie(response, TepConstants.SAVE_AREA, search_area);
		} else {
			search_area = TepUtils.getCookies(request, TepConstants.SAVE_AREA);
		}
		
		if(search_payment != null){
			TepUtils.setCookie(response, TepConstants.SAVE_PAYMENT, search_payment);
		} else {
			search_payment = TepUtils.getCookies(request, TepConstants.SAVE_PAYMENT);
		}
		
		if(searchWord != null && search_people != null && search_area != null && search_payment != null){ //모두 낫널
			query = "(l_subject like '%"+searchWord+"%' or l_content like '%"+searchWord+"%') and ";
			query += createPeopleQuery(search_people)+" and "; // people
			query += "REGEXP_LIKE(l_addr,'"+search_area+"') and "; //area
			query += createPaymentQuery(search_payment); // payment
		}
		if(searchWord != null && search_people == null && search_area != null && search_payment != null){ // people is null
			query = "(l_subject like '%"+searchWord+"%' or l_content like '%"+searchWord+"%') and ";
			query += "REGEXP_LIKE(l_addr,'"+search_area+"') and "; //area
			query += createPaymentQuery(search_payment); // payment
		}
		if(searchWord != null && search_people != null && search_area == null && search_payment != null){ // area is null
			query = "(l_subject like '%"+searchWord+"%' or l_content like '%"+searchWord+"%') and ";
			query += createPeopleQuery(search_people)+" and "; // people
			query += createPaymentQuery(search_payment); // payment
		}
		if(searchWord != null && search_people != null && search_area != null && search_payment == null){ // payment is null
			query = "(l_subject like '%"+searchWord+"%' or l_content like '%"+searchWord+"%') and ";
			query += createPeopleQuery(search_people)+" and "; // people
			query += "REGEXP_LIKE(l_addr,'"+search_area+"')"; //area
		}
		if(searchWord != null && search_people == null && search_area == null && search_payment != null){ // people,area is null
			query = "(l_subject like '%"+searchWord+"%' or l_content like '%"+searchWord+"%') and ";
			query += createPaymentQuery(search_payment); // payment
		}
		if(searchWord != null && search_people == null && search_area != null && search_payment == null){ // people,payment is null
			query = "(l_subject like '%"+searchWord+"%' or l_content like '%"+searchWord+"%') and ";
			query += "REGEXP_LIKE(l_addr,'"+search_area+"')"; //area
		}
		if(searchWord != null && search_people != null && search_area == null && search_payment == null){ // area,payment is null
			query = "(l_subject like '%"+searchWord+"%' or l_content like '%"+searchWord+"%') and ";
			query += createPeopleQuery(search_people); // people
		}
		if(searchWord != null && search_people == null && search_area == null && search_payment == null){ // people,area,payment is null
			query = "(l_subject like '%"+searchWord+"%' or l_content like '%"+searchWord+"%')";
		}
		/*System.out.println("5");
		System.out.println("query : "+query);*/
	}
	
	private String createPeopleQuery(String search_people) {
		// l_pnum between 0 and 20
		if (search_people.equals("0")) {
			return "l_pnum between 0 and 20";
		} else if (search_people.equals("2")) {
			return "l_pnum between 20 and 50";
		} else if (search_people.equals("5")) {
			return "l_pnum between 50 and 100";
		} else if (search_people.equals("1")) {
			return "l_pnum > 100";
		}

		return null;
	}

	private String createPaymentQuery(String search_payment){
		if(search_payment.equals("유료")){
			return "l_payment > 0";
		} else if(search_payment.equals("무료")){
			return "l_payment <= 0";
		}
		return null;
	}
	
	public List<LendplaceModel> getList() {
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

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public void setSearch_people(String search_people) {
		this.search_people = search_people;
	}

	public void setSearch_area(String search_area) {
		this.search_area = search_area;
	}

	public void setSearch_payment(String search_payment) {
		this.search_payment = search_payment;
	}
	
}
