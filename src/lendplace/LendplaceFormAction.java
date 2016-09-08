package lendplace;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Map;


import com.ibatis.sqlmap.client.SqlMapClient;

import board.BoardModel;
import config.SqlMapper;

import members.*;
import util.TepUtils;

public class LendplaceFormAction extends LendplaceModel {
	private SqlMapClient sqlMapper;

	
	public LendplaceFormAction(){
		sqlMapper=SqlMapper.getMapper();
	}
	
	public String execute(){
		return "success";
	}
	
	
	public String insert() throws Exception{
		LendplaceModel li = new LendplaceModel();
		try {
			System.out.println(getL_subject());
			System.out.println(getL_addr());
			System.out.println(getL_pnum());
			System.out.println(getL_t_sdate());
			System.out.println(getL_t_edate());
			System.out.println(getL_payment());
			System.out.println(getL_content());
			System.out.println(Calendar.getInstance().getTime());
			System.out.println(getL_rep_img());
			
			
			li.setL_subject(getL_subject());
			li.setL_addr(getL_addr());
			li.setL_pnum(getL_pnum());
			li.setL_sdate(TepUtils.dateParse(getL_t_sdate()));
			li.setL_edate(TepUtils.dateParse(getL_t_edate()));
			li.setL_payment(getL_payment());
			li.setL_content(getL_content());
			li.setL_rep_img(getL_rep_img());
			li.setL_date(Calendar.getInstance().getTime());
			
			sqlMapper.insert("lendplace_insert",li);
			
		} catch (Exception e) {
			System.out.println("LendplaceFormAction insert ex : "+e.getMessage());
		}
		return "success";
	}
	
}
