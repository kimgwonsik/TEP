package openmeet;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import config.SqlMapper;
import util.PagingCalculator;
import util.TepUtils;

public class OpenmeetAction implements SessionAware, ServletRequestAware, ServletResponseAware, Preparable, ModelDriven<OpenmeetSearchModel>{
	private List<OpenmeetModel> list;
	private SqlMapClient sqlMapper;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 6;
	private int blockPage = 3;
	private String pagingHtml;
	
	private Map session;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private OpenmeetSearchModel sModel;
	
	public OpenmeetAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() {
		TepUtils.savePageURI(request, session);
		try {
			list = sqlMapper.queryForList("jin.openmeet_select_all");
			totalCount = list.size();
			PagingCalculator page = new PagingCalculator("openmeet", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			list = list.subList(page.getStartCount(), lastCount);
		} catch (Exception e) {
			System.out.println("openmeet listAll error : "+e.getMessage());
		}
		return "success";
	}
	
	public String search(){
		try {
			String query = createQuery();
			if(query.length() > 0){
				list = sqlMapper.queryForList("jin.openmeet_search", query);
			} else {
				execute();
			}
			
		} catch (Exception e) {
			System.out.println("search openmeet error : "+e.getMessage());
		}
		return "success";
	}
	

	private String createQuery(){
		List<String> queryList = new ArrayList<String>();
		
		if(sModel.getSearchWord() != null && sModel.getSearchWord().length() > 0){
			queryList.add("(o_subject like '%"+sModel.getSearchWord()+"%' or o_content like '%"+sModel.getSearchWord()+"%')");
		}
		
		if(sModel.getSearchCategory() != null && sModel.getSearchCategory().length() > 0){
			queryList.add("REGEXP_LIKE(o_category,'"+sModel.getSearchCategory()+"')");
		}
		
		if(sModel.getSearchAddr() != null && sModel.getSearchAddr().length() > 0){
			queryList.add("REGEXP_LIKE(o_addr,'"+sModel.getSearchAddr()+"')");
		}
		
		if(sModel.getSearchPay() != null){
			if(sModel.getSearchPay() == 0){
				queryList.add("o_payment = 0");
			} else {
				queryList.add("o_payment >= "+sModel.getSearchPay());
			}
		}
		
		if((sModel.getSearchMStart() != null && sModel.getSearchMStart().length() > 0) && (sModel.getSearchMEnd() != null && sModel.getSearchMEnd().length() > 0)){
			queryList.add("(o_m_sdate > '"+sModel.getSearchMStart()+"' and o_m_edate > '"+sModel.getSearchMEnd()+"')");
		}
		
		String query = "";
		if(queryList.size() > 1){
			for (int i = 0; i < queryList.size(); i++) {
				query += queryList.get(i);
				if(queryList.size()-1 == i){
					continue;
				}
				query += " and ";
			}
		} else if(queryList.size() == 1){
			query = queryList.get(0);
		}
//		System.out.println(query);
		return query;
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

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	@Override
	public OpenmeetSearchModel getModel() {
		return sModel;
	}

	@Override
	public void prepare() throws Exception {
		sModel = new OpenmeetSearchModel();
	}

}
