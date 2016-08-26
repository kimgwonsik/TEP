package members;
import members.MembersModel;
import com.ibatis.sqlmap.client.SqlMapClient;
import java.util.Date;
import java.util.*;
import config.SqlMapper;
import java.sql.*;
public class MembersAction extends MembersModel{
	private SqlMapClient sqlMapper;
	
	Calendar today = Calendar.getInstance();
	
	public MembersAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String MemberForm(){
		return "success";
	}
	public String Insert() throws Exception{
		MembersModel vo = new MembersModel();
		
		vo.setM_email(getM_email());
		vo.setM_name(getM_name());
		vo.setM_nickname(getM_nickname());
		vo.setM_password(getM_password());
		vo.setM_phone(getM_phone());
		vo.setM_fav_area(getM_fav_area());
		vo.setM_fav_field(getM_fav_field());
		vo.setM_date(today.getTime());
		

		
		sqlMapper.insert("two.insertMember", vo);
		
		return "success";
		
	
	}
	
}
