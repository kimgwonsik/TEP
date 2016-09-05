package mypage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import board.BoardModel;
import comments.CommentsModel;
import openmeet.OpenmeetModel;

import config.SqlMapper;
import util.PagingCalculator;

public class MypageWriteHistoryAction implements SessionAware{

	private SqlMapClient sqlMapper;
	
	private List<BoardModel> Blist= new ArrayList<>();
	private List<CommentsModel> Clist= new ArrayList<>();
	private List<OpenmeetModel> Olist= new ArrayList<>();
	
	// 검색스트링과 멤버 회원번호담을 객체변수(m_no는 int니까, string이랑 int 둘다 담기위하여)
	private BoardModel boardModel;
	private OpenmeetModel openmeetModel;
	
	
	
	private static final int SEARCHKEYB_SUBEJCT = 0;
	private static final int SEARCHKEYB_SUBJECT_CONTENT = 1;
	private static final int SEARCHKEYB_NAME = 2;
	
	private int SearchKeyB = -1;
	private String SearchWordB = "";

	
	
	

	
	private static final int SEARCHKEYC_SUBEJCT = 0;
	private static final int SEARCHKEYC_SUBJECT_CONTENT = 1;
	private static final int SEARCHKEYC_NAME = 2;
	
	private int SearchKeyC = -1;
	private String SearchWordC = "";

	
	
	
	
	private static final int SEARCHKEYO_SUBEJCT = 0;
	private static final int SEARCHKEYO_SUBJECT_CONTENT = 1;
	private static final int SEARCHKEYO_NAME = 2;
	
	private int SearchKeyO = -1;
	private String SearchWordO = "";

	

	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingCalculator page;
	private Map session;
	
	
	
	
	
	
	public MypageWriteHistoryAction(){
		sqlMapper=SqlMapper.getMapper();
	}

	@SuppressWarnings("unchecked")
	public String writeHistoryBoard(){
		/*System.out.println(session.get("session_m_no"));*/
		try {
		
			if(SearchKeyB != -1 && SearchWordB.length() > 0){
				searchB();
			} else {
					Blist= sqlMapper.queryForList("two.writeHistoryBoard", session.get("session_m_no"));
			}
			totalCount = Blist.size();
			System.out.println(totalCount);
			page = new PagingCalculator("writeHistoryBoard", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			Blist = Blist.subList(page.getStartCount(), lastCount);
			/*System.out.println(Blist.size()+"aaa");*/
		} catch (SQLException e) {
			System.out.println("lahee : "+e.getMessage());
		}
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	private void searchB() throws SQLException {
		int m_no = (int) session.get("session_m_no"); //m_no가져올라고
		boardModel = new BoardModel(); //객체생성
		boardModel.setM_no(m_no);
		boardModel.setB_subject(getSearchWordB());
		boardModel.setB_content(getSearchWordB());
		switch (getSearchKeyB()) {
		case SEARCHKEYB_SUBEJCT:
			Blist = sqlMapper.queryForList("two.board_search_b_subject_select_all",boardModel);
			break;
		case SEARCHKEYB_SUBJECT_CONTENT:
			Blist = sqlMapper.queryForList("two.board_search_b_subject_content_select_all", boardModel);
			break;
		
		/*case SEARCHKEY_NAME:
			Blist = sqlMapper.queryForList("two.board_search_b_name_select_all", getSearchWordB());
			break;      getSearchWordB라고 하면 안되고 int값인 m_no와, 서치워드인 String을 모두 담아내기 위하여 boardModel로 바꿔준다.
	*/
		}
	}
	
		
	
	
	
	
	public String writeHistoryCmt(){
		
		try {
			if(SearchKeyC!= -1 && SearchWordC.length() > 0){
				SearchC();
			} else {
			Clist= sqlMapper.queryForList("two.writeHistoryCmt", session.get("session_m_no"));
			}
			totalCount = Clist.size();
			
			page = new PagingCalculator("writeHistoryCmt", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			Clist = Clist.subList(page.getStartCount(), lastCount);
			
			} catch (SQLException e) {
			System.out.println("lahee : "+e.getMessage());
		}
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	private void SearchC() throws SQLException {
		
			Clist = sqlMapper.queryForList("two.comments_search_c_content_select_all", getSearchWordC());
		
		}
	//COMMENTS 테이블에는 c_subject라는 컬럼이 없다.  따라서 제목별 검색은 불가. 내용별 검색만 가능
	
	

	
	
	
	
	
	
	
	@SuppressWarnings("unchecked")
	public String writeHistoryOmeet(){
		
		try {
			if(SearchKeyO!= -1 && SearchWordO.length() > 0){
				searchO();
			} else {
			
			Olist= sqlMapper.queryForList("two.writeHistoryOmeet", session.get("session_m_no"));
			}
			totalCount = Olist.size();
			
			page = new PagingCalculator("writeHistoryOmeet", currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount){
				lastCount = page.getEndCount()+1;
			}
			
			Olist = Olist.subList(page.getStartCount(), lastCount);
		} catch (SQLException e) {
			System.out.println("lahee : "+e.getMessage());
		}
		return "success";
	}


	@SuppressWarnings("unchecked")
	private void searchO() throws SQLException {
		int m_no = (int) session.get("session_m_no"); //m_no가져올라고
		openmeetModel = new OpenmeetModel(); //객체생성
		openmeetModel.setM_no(m_no);
		openmeetModel.setO_subject(getSearchWordO());
		openmeetModel.setO_content(getSearchWordO());
		switch (getSearchKeyO()) {
		case SEARCHKEYO_SUBEJCT:
			Olist = sqlMapper.queryForList("two.openmeet_search_o_subject_select_all",openmeetModel);
			break;
		case SEARCHKEYO_SUBJECT_CONTENT:
			Olist = sqlMapper.queryForList("two.openmeet_search_o_subject_content_select_all",openmeetModel);
			break;
			
			/*case SEARCHKEY_NAME:
			Olist = sqlMapper.queryForList("two.openmeet_search_o_name_select_all", getSearchWordB());
			break;      getSearchWordO라고 하면 안되고 int값인 m_no와, 서치워드인 String을 모두 담아내기 위하여 openmeetModel로 바꿔준다.
	*/
		}
	}
	
		



	public List<BoardModel> getBlist() {
		return Blist;
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


	public void setSession(Map session) {
		this.session = session;
	}


	public List<CommentsModel> getClist() {
		return Clist;
	}


	public void setClist(List<CommentsModel> clist) {
		Clist = clist;
	}


	public List<OpenmeetModel> getOlist() {
		return Olist;
	}


	public void setOlist(List<OpenmeetModel> olist) {
		Olist = olist;
	}

	
	
	

	

	public void setSearchKeyB(int searchKeyB) {
		SearchKeyB = searchKeyB;
	}

	public void setSearchWordB(String searchWordB) {
		SearchWordB = searchWordB;
	}

	public int getSearchKeyB() {
		return SearchKeyB;
	}

	public String getSearchWordB() {
		return SearchWordB;
	}

	
	
	
	
	
	public int getSearchKeyC() {
		return SearchKeyC;
	}

	public void setSearchKeyC(int searchKeyC) {
		SearchKeyC = searchKeyC;
	}

	public String getSearchWordC() {
		return SearchWordC;
	}

	public void setSearchWordC(String searchWordC) {
		SearchWordC = searchWordC;
	}

	
	
	
	
	
	public int getSearchKeyO() {
		return SearchKeyO;
	}

	public void setSearchKeyO(int searchKeyO) {
		SearchKeyO = searchKeyO;
	}

	public String getSearchWordO() {
		return SearchWordO;
	}

	public void setSearchWordO(String searchWordO) {
		SearchWordO = searchWordO;
	}
	
	

	
	


	

}
		

