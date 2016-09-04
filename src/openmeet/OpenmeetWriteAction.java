package openmeet;

import java.io.File;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;

public class OpenmeetWriteAction extends OpenmeetModel implements SessionAware{
	private SqlMapClient sqlMapper;
	private Map session;

	private File upload; //업로드할 실제파일
	private String uploadFileName; //업로드할 로컬 파일명
	private String uploadContentType; //업로드할 파일의 컨텐츠 타입
	private String serverFullPath; //저장할 실제 파일의 전체 경로
	
	public OpenmeetWriteAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String form(){
		return "success";
	}
	
	public String write(){
		System.out.println("1 : "+getO_addr());
		System.out.println("2 : "+getO_category());
//		System.out.println(getO_company());
		System.out.println("3 : "+getO_content());
//		System.out.println(getO_content_img());
//		System.out.println(getO_email());
//		System.out.println(getO_meetdate());
//		System.out.println(getO_name());
		System.out.println("4 : "+getO_payment());
//		System.out.println(getO_phone());
//		System.out.println(getO_registerdate());
//		System.out.println(getO_rep_img()); //대표이미지
		System.out.println("5 : "+getO_subject());
		System.out.println("6 : "+getO_title());
//		System.out.println(getO_current_pnum());
//		System.out.println(getO_date());
		System.out.println("7 : "+getO_medate());
		System.out.println("8 : "+getO_msdate());
//		System.out.println(getO_no());
//		System.out.println(getO_permit_pnum());
		System.out.println("9 : "+getO_redate());
		System.out.println("10 : "+getO_rsdate());
		System.out.println("11 : "+getO_total_pnum());
		/*String basePath = FileUploadService.UPLOAD_TEMP_PATH;
		FileUploadService fs = new FileUploadService();
		try {
			uploadFileName = System.currentTimeMillis()+"_"+uploadFileName;
			serverFullPath = fs.saveFile(upload, basePath, uploadFileName);
		} catch (Exception e) {
			System.out.println("file upload error : "+e.getMessage());
		}*/
		
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
