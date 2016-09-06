package footer;

import com.ibatis.sqlmap.client.SqlMapClient;
import config.SqlMapper;


public class footerAction {

	
	public void footerActionA(){
		SqlMapClient sqlMapper = SqlMapper.getMapper();
	}
	public String execute() throws Exception{
		
		return "success";
}
	
	
	
	
	
	
	public void footerActionB(){
		SqlMapClient sqlMapper = SqlMapper.getMapper();
	}
	public String executeB() throws Exception{
		
		return "success";
}
	
	
	
	
	public void footerActionC(){
		SqlMapClient sqlMapper = SqlMapper.getMapper();
	}
	public String executeC() throws Exception{
		
		return "success";
}
	
}



