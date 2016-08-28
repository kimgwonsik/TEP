package login;
import members.MembersModel;
import com.ibatis.sqlmap.client.SqlMapClient;
import config.SqlMapper;

public class EmailCheckAction {
	private SqlMapClient sqlMapper;
	
	private MembersModel vo;
	private String m_email;
	private int chkId;
	
	public EmailCheckAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String execute() throws Exception{
		vo = (MembersModel)sqlMapper.queryForObject("two.idCheck", getM_email());
		
		if(vo == null){
			chkId=0;
		}else{
			chkId=1;
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

	
	
}
