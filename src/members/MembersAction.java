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
			MembersModel vo = (MembersModel) sqlMapper.queryForObject("two.idCheck", getM_email());

			if (vo != null) {
				return "error";
			}

			setM_date(Calendar.getInstance().getTime());
			sqlMapper.insert("two.insertMember", this);

			session.put(TepConstants.M_EMAIL, getM_email());
			session.put(TepConstants.M_NAME, getM_name());
			session.put(TepConstants.M_NO, getM_no());
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
