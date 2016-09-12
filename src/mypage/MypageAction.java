package mypage;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;

public class MypageAction extends MembersModel implements SessionAware {
	private SqlMapClient sqlMapper;
	private Map session;

	private MembersModel resultClass;
	
	public MypageAction() {
		sqlMapper = SqlMapper.getMapper();
	}

	public String execute() throws Exception {
		if (session.get("session_m_email") == null) {
			return "sessionError";
		}
		
		resultClass = (MembersModel) sqlMapper.queryForObject("two.selectOneMember", session.get("session_m_email"));
		return "success";
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public MembersModel getResultClass() {
		return resultClass;
	}
}
