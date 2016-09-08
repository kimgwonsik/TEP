package mypage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import openmeet.OpenmeetModel;
import openmeet.SubscribeModel;
import util.PagingCalculator;
import util.TepConstants;

public class MypageMeetHistoryAction extends OpenmeetModel implements SessionAware{
	private List<SubscribeModel> sublist;
	private List<OpenmeetModel> list = new ArrayList<>();
	
	private SqlMapClient sqlMapper;
	private Map session;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 3;
	private String pagingHtml;
	
	public MypageMeetHistoryAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	@SuppressWarnings("unchecked")
	public String execute(){
		try {
			int m_no = (int) session.get(TepConstants.M_NO);
			sublist = sqlMapper.queryForList("two.subscribe_select_all",m_no);
			for(SubscribeModel data : sublist){
				list.add((OpenmeetModel) sqlMapper.queryForObject("two.openmeetHistory_select_all",data.getO_no()));
			}
			
			totalCount = list.size();
			PagingCalculator page = new PagingCalculator("openmeetHistory", currentPage, totalCount, blockCount, blockPage);
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
	public void setSession(Map session) {
		this.session = session;
	}
}
