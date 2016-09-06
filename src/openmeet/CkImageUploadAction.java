package openmeet;

import java.io.File;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import util.FileUploadService;

public class CkImageUploadAction implements SessionAware{
	private int CKEditorFuncNum; //ckeditor image upload 고유넘버
	private File upload; //ckimage 업로더에서 전달받은 file 객체
	private String uploadFileName; //업로드할 로컬 파일명
	private String uploadContentType; //업로드할 파일의 컨텐츠 타입
	private String serverFullPath; //저장할 실제 파일의 전체 경로

	private Map session;
	private int o_no;
	
	public String execute(){
		String basePath = FileUploadService.UPLOAD_TEMP_PATH;
		FileUploadService fs = new FileUploadService();
		try {
			uploadFileName = System.currentTimeMillis()+"_"+uploadFileName;
			serverFullPath = fs.saveFile(upload, basePath, uploadFileName);
			int m_no = (int) session.get("session_m_no");
			session.put("o_content_img"+m_no, serverFullPath);
		} catch (Exception e) {
			System.out.println("ck image upload error : "+e.getMessage());
		}
		return "success";
	}
	
	public String modify(){
		
		
		return "success";
	}

	public void setCKEditorFuncNum(int cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}

	public int getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
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

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

}
