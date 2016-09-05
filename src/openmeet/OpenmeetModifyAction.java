package openmeet;

import java.io.File;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;

public class OpenmeetModifyAction extends OpenmeetModel implements SessionAware{
	private SqlMapClient sqlMapper;
	private Map session;
	
	public OpenmeetModifyAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String view(){
		return "success";
	}
	
	public String modify(){
		return "success";
	}
	
	public String delete(){
		System.out.println("123 : "+getO_no());
		try {
			OpenmeetModel odata = (OpenmeetModel) sqlMapper.queryForObject("jin.openmeet_select_one",getO_no());
			File rep_img = new File(odata.getO_rep_img());
			File content_img = new File(odata.getO_content_img());
			if(rep_img != null && rep_img.exists()){
				rep_img.delete();
			}
			if(content_img != null && content_img.exists()){
				content_img.delete();
			}
			sqlMapper.delete("jin.openmeet_delete",getO_no());
		} catch (Exception e) {
			System.out.println("openmeet delete error : "+e.getMessage());
		}
		return "success";
	}
	
	@Override
	public void setSession(Map session) {
		this.session = session;
	}

}
