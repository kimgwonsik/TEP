package members;

import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import util.TepConstants;

public class MembersAction extends MembersModel implements SessionAware {

	private SqlMapClient sqlMapper;
	private Map session;

	public MembersAction() {
		sqlMapper = SqlMapper.getMapper();
	}

	public String MemberForm() {
		return "success";
	}

	public String Insert() throws Exception {
		try {
			if(session != null && session.get(TepConstants.REG_ID_CHECK) == null){
				return "reject";
			} else {
				if(session.get(TepConstants.REG_ID_CHECK).equals("reject")){
					return "reject";
				}
			}

			setM_date(Calendar.getInstance().getTime());
			sqlMapper.insert("two.insertMember", this);
			
			MembersModel m = (MembersModel) sqlMapper.queryForObject("two.selectOneMember",getM_email());
			
			if(m != null){
				session.put(TepConstants.M_EMAIL, m.getM_email());
				session.put(TepConstants.M_NAME, m.getM_name());
				session.put(TepConstants.M_NO, m.getM_no());
			}
			
			if(session.get(TepConstants.REG_ID_CHECK) != null){
				session.remove(TepConstants.REG_ID_CHECK);
			}

		} catch (Exception e) {
			System.out.println("member insert error : " + e.getMessage());
		}

		return "success";
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

}
