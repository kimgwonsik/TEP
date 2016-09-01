package login;
import members.MembersModel;
import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.sqlmap.client.SqlMapClient;
import config.SqlMapper;
import java.util.*;
import java.io.IOException;

public class FindIdPasswordAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMapper;
	private MembersModel paramClass;
	private MembersModel resultClass;
	private List<MembersModel> list = new ArrayList<MembersModel>();
	//list필요없음 수정하기.
	private String m_email;
	private String m_name;
	private String m_phone;
		
	public FindIdPasswordAction() throws IOException{
		sqlMapper = SqlMapper.getMapper();
	}
	public String form() throws Exception{
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	public String execute() throws Exception{
		
		paramClass=new MembersModel();
		resultClass=new MembersModel();
		
		paramClass.setM_name(getM_name());
		paramClass.setM_phone(getM_phone());
	
		list=sqlMapper.queryForList("two.findId",paramClass);
		return "success";
	}
	public String findPassword() throws Exception{
		
		paramClass=new MembersModel();
		resultClass=new MembersModel();
		
		paramClass.setM_email(getM_email());
		paramClass.setM_name(getM_name());
		paramClass.setM_phone(getM_phone());
		
		resultClass=(MembersModel)sqlMapper.queryForObject("two.findPassword",paramClass);
		if(resultClass != null){
			sqlMapper.update("two.setPassword1111",paramClass.getM_email());
		}
		return "success";
	}
	
	public MembersModel getParamClass() {
		return paramClass;
	}
	public void setParamClass(MembersModel paramClass) {
		this.paramClass = paramClass;
	}
	public MembersModel getResultClass() {
		return resultClass;
	}
	public void setResultClass(MembersModel resultClass) {
		this.resultClass = resultClass;
	}
	public List<MembersModel> getList() {
		return list;
	}
	public void setList(List<MembersModel> list) {
		this.list = list;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	
	

}
