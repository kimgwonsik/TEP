package mypage;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.TepConstants;
public class MypageDeleteAction implements SessionAware{
	private SqlMapClient sqlMapper;
	private Map session;
	
	private String password;
	
	public MypageDeleteAction() {
		sqlMapper=SqlMapper.getMapper();
	}
	
	public String deleteForm() {
		return "success";
	}
	
	public String execute() {
		try {
			if(session.get(TepConstants.M_EMAIL) == null){
				return "sessionError";
			}
			
			String email = session.get(TepConstants.M_EMAIL).toString();
			MembersModel m = (MembersModel)sqlMapper.queryForObject("two.selectOneMember", email);
			if(m.getM_password().equals(password)){
				
				sqlMapper.delete("jin.mem_delete_openmeet",m.getM_no());
				sqlMapper.delete("jin.mem_delete_subscribe",m.getM_no());
				sqlMapper.delete("jin.mem_delete_board",m.getM_no());
				sqlMapper.delete("jin.mem_delete_board_help",m.getM_no());
				sqlMapper.delete("jin.mem_delete_comments",m.getM_no());
				sqlMapper.delete("jin.mem_delete_lendplacebook",m.getM_no());
				sqlMapper.delete("jin.mem_delete_members",m.getM_no());
				
				if(session.get(TepConstants.M_EMAIL) != null){
					session.remove(TepConstants.M_EMAIL);
				}
				if(session.get(TepConstants.M_NAME) != null){
					session.remove(TepConstants.M_NAME);
				}
				if(session.get(TepConstants.M_NO) != null){
					session.remove(TepConstants.M_NO);
				}
				
				return "success";
			} else {
				return "pwWrong";
			}
			
		} catch (Exception e) {
			System.out.println("mypage delete error : "+e.getMessage());
		}
		
		return "error";
	}
	
	@Override
	public void setSession(Map session) {
		this.session = session;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
}