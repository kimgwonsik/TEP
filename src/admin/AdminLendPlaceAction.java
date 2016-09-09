package admin;

import java.io.File;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import lendplace.LendplaceModel;
import util.FileUploadService;
import util.TepConstants;

public class AdminLendPlaceAction extends LendplaceModel implements SessionAware{
	
	private SqlMapClient sqlMapper;
	private Map session;

	private File upload; //업로드할 실제파일
	private String uploadFileName; //업로드할 로컬 파일명
	private String uploadContentType; //업로드할 파일의 컨텐츠 타입
	private String serverFullPath; //저장할 실제 파일의 전체 경로
	
	public AdminLendPlaceAction(){
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
		
		
		return "success";
	}
	
	
	@Override
	public void setSession(Map session) {
		this.session = session;
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
