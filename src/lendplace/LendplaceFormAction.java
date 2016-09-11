package lendplace;
import java.io.File;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import members.MembersModel;
import util.FileUploadService;
import util.TepConstants;
import util.TepUtils;

public class LendplaceFormAction extends LendplaceModel implements SessionAware, ServletRequestAware{
	private SqlMapClient sqlMapper;
	
	private File upload; //업로드할 실제파일
	private String uploadFileName; //업로드할 로컬 파일명
	private String uploadContentType; //업로드할 파일의 컨텐츠 타입
	private String serverFullPath; //저장할 실제 파일의 전체 경로

	private Map session;
	private HttpServletRequest request;
	
	public LendplaceFormAction(){
		sqlMapper=SqlMapper.getMapper();
	}
	
	public String execute(){
		return "success";
	}
	
	
	public String insert() throws Exception{
		
		String basePath = TepConstants.UPLOAD_TEMP_PATH;
		FileUploadService fs = new FileUploadService();
		try {
			uploadFileName = System.currentTimeMillis()+"_"+uploadFileName;
			serverFullPath = fs.saveFile(upload, basePath, uploadFileName);
		} catch (Exception e) {
			System.out.println("file upload error : "+e.getMessage());
		}
		
		try {
			int m_no = (int) session.get("session_m_no");
			MembersModel mdata = (MembersModel) sqlMapper.queryForObject("jin.members_select_one_where_m_no",m_no);
			setL_email(mdata.getM_email());
			setL_name(mdata.getM_name());
			setL_phone(mdata.getM_phone());
			setL_company(mdata.getM_company());
			setL_sdate(TepUtils.dateParse(getL_t_sdate()));
			setL_edate(TepUtils.dateParse(getL_t_edate()));
			setL_rep_img(serverFullPath);
			setL_use_num(0);
			setL_date(Calendar.getInstance().getTime());
			setM_no(m_no);
			
			sqlMapper.insert("lendplace_insert",this);
			
		} catch (Exception e) {
			System.out.println("LendplaceFormAction insert ex : "+e.getMessage());
		}
		return "success";
	}
	
	
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getServerFullPath() {
		return serverFullPath;
	}

	public void setServerFullPath(String serverFullPath) {
		this.serverFullPath = serverFullPath;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
}
