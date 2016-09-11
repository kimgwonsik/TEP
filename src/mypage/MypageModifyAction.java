package mypage;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.TepConstants;

public class MypageModifyAction extends MembersModel implements SessionAware{
	private SqlMapClient sqlMapper;
	private Map session;
	
	private MembersModel mData;
	
	public MypageModifyAction() {
		sqlMapper=SqlMapper.getMapper();
	}
	public String modifyPwChk(){
		return "success";
	}
	
	public String form() throws Exception{
		if(session.get(TepConstants.M_EMAIL) == null){
			return "sessionError";
		}
		
		mData = (MembersModel)sqlMapper.queryForObject("two.selectOneMember", session.get(TepConstants.M_EMAIL));
		if(getM_password().equals(mData.getM_password())){
			return "success";
		}
		
		return "error";
	}

	public String execute() throws Exception{
		if(session.get("session_m_no") == null){
			return "sessionError";
		}
		
		setM_no((int)session.get("session_m_no"));
		sqlMapper.update("two.modifyMember", this);

		return "success";
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}
	
	public MembersModel getmData() {
		return mData;
	}
	
}
