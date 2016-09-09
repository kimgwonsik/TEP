package mypage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import openmeet.SubscribeModel;
import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import openmeet.OpenmeetModel;
import util.PagingCalculator;

public class MypageMeetHistoryAction extends OpenmeetModel implements SessionAware{
	private List<OpenmeetModel> list = new ArrayList<>();
	private List<SubscribeModel> list2 = new ArrayList<>();
	private List<List<SubscribeModel>> list3;
	private Integer t;
	private SqlMapClient sqlMapper;
	private Map session;
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingCalculator page;
	
	public MypageMeetHistoryAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	@SuppressWarnings("unchecked")
	public String execute(){
		try {
			///list2 = sqlMapper.queryForList("two.subscribe_select_all", session.get("session_m_no"));
			for(SubscribeModel data : list2){
				list2 = sqlMapper.queryForList("two.subscribe_select_all", session.get("session_m_no"));
				list3.add(list2);
			}
		/*	sublist = sqlMapper.queryForList("two.subscribe_select_all",m_no);
	         
	         for(SubscribeModel data : sublist){
	            olist.add((OpenmeetModel) sqlMapper.queryForObject("two.openmeetHistory_select_all",data.getO_no()));
	         }*/
			list = sqlMapper.queryForList("two.openmeetHistory_select_all", list3);
			totalCount = list.size();
			page = new PagingCalculator("openmeetHistory", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			list = list.subList(page.getStartCount(), lastCount);
		} catch (Exception e) {
			System.out.println("openmeetHistory Ex : "+e.getMessage());
		}
		return "success";
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
	public Map getSession() {
		return session;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
		// TODO Auto-generated method stub
		
	}
}
