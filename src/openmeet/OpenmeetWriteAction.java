package openmeet;

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

public class OpenmeetWriteAction extends OpenmeetModel implements SessionAware, ServletRequestAware{
	private SqlMapClient sqlMapper;
	private Map session;

	private File upload; //업로드할 실제파일
	private String uploadFileName; //업로드할 로컬 파일명
	private String uploadContentType; //업로드할 파일의 컨텐츠 타입
	private String serverFullPath; //저장할 실제 파일의 전체 경로
	
	private HttpServletRequest request;
	
	public OpenmeetWriteAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String form(){
		return "success";
	}
	
	public String write(){
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
			setO_email(mdata.getM_email());
			setO_name(mdata.getM_name());
			setO_phone(mdata.getM_phone());
			setO_company(mdata.getM_company());
			setO_rep_img(serverFullPath);
			String content_img = TepUtils.getCookies(request, TepConstants.CKIMG_PATH);
			if(content_img != null){
				setO_content_img(content_img);
			}
			setO_m_sdate(TepUtils.dateParse(getO_msdate()));
			setO_m_edate(TepUtils.dateParse(getO_medate()));
			setO_r_sdate(TepUtils.dateParse(getO_rsdate()));
			setO_r_edate(TepUtils.dateParse(getO_redate()));
			setO_current_pnum(0);
			setO_date(Calendar.getInstance().getTime());
			setO_readcount(0);
			setM_no(m_no);
			
			sqlMapper.insert("jin.openmeet_insert",this);
		} catch (Exception e) {
			System.out.println("openmeet insert error : "+e.getMessage());
		}
		
		return "success";
	}
	
	@Override
	public void setSession(Map session) {
		this.session = session;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
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

}
