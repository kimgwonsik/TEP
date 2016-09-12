package openmeet;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import util.FileUploadService;
import util.TepConstants;
import util.TepUtils;

public class CkImageUploadAction implements ServletResponseAware,ServletRequestAware{
	private int CKEditorFuncNum; //ckeditor image upload 고유넘버
	private File upload; //ckimage 업로더에서 전달받은 file 객체
	private String uploadFileName; //업로드할 로컬 파일명
	private String uploadContentType; //업로드할 파일의 컨텐츠 타입
	private String serverFullPath; //저장할 실제 파일의 전체 경로

	private HttpServletResponse response;
	private HttpServletRequest request;
	
	public String execute(){
		String basePath = TepConstants.UPLOAD_TEMP_PATH;
		System.out.println(basePath);
		FileUploadService fs = new FileUploadService();
		try {
			uploadFileName = System.currentTimeMillis()+"_"+uploadFileName;
			serverFullPath = fs.saveFile(upload, basePath, uploadFileName);
			TepUtils.setCookie(response, TepConstants.CKIMG_PATH, serverFullPath);
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
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
