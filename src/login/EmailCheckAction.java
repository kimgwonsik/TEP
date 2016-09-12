package login;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.TepConstants;

public class EmailCheckAction implements SessionAware{
	private SqlMapClient sqlMapper;
	
	private MembersModel vo;
	private String m_email;
	private int chkId;
	private Map session;
	
	public EmailCheckAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		vo = (MembersModel)sqlMapper.queryForObject("two.idCheck", getM_email());
		
		if(vo == null){
			chkId=0;
			session.put(TepConstants.REG_ID_CHECK, "allow");
		}else{
			chkId=1;
			session.put(TepConstants.REG_ID_CHECK, "reject");
		}
		return "success";
	}

	public MembersModel getVo() {
		return vo;
	}

	public void setVo(MembersModel vo) {
		this.vo = vo;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public int getChkId() {
		return chkId;
	}

	public void setChkId(int chkId) {
		this.chkId = chkId;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}
	
}
