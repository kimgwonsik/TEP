package lendplace;
import java.sql.SQLException;
import java.io.File;
import java.util.Calendar;
import java.util.Map;


import com.ibatis.sqlmap.client.SqlMapClient;

import board.BoardModel;
import config.SqlMapper;

import util.TepUtils;
import util.FileUploadService;

public class LendplaceFormAction extends LendplaceModel {
	private SqlMapClient sqlMapper;
	
	private File upload; //업로드할 실제파일
	private String uploadFileName; //업로드할 로컬 파일명
	private String uploadContentType; //업로드할 파일의 컨텐츠 타입
	private String serverFullPath; //저장할 실제 파일의 전체 경로

	
	public LendplaceFormAction(){
		sqlMapper=SqlMapper.getMapper();
	}
	
	public String execute(){
		return "success";
	}
	
	
	public String insert() throws Exception{
		
		String basePath = FileUploadService.UPLOAD_TEMP_PATH;
		FileUploadService fs = new FileUploadService();
		try {
			uploadFileName = System.currentTimeMillis()+"_"+uploadFileName;
			serverFullPath = fs.saveFile(upload, basePath, uploadFileName);
		} catch (Exception e) {
			System.out.println("file upload error : "+e.getMessage());
		}
		
		
		LendplaceModel li = new LendplaceModel();
		try {
			
			li.setL_subject(getL_subject());
			li.setL_addr(getL_addr());
			li.setL_pnum(getL_pnum());
			li.setL_sdate(TepUtils.dateParse(getL_t_sdate()));
			li.setL_edate(TepUtils.dateParse(getL_t_edate()));
			li.setL_payment(getL_payment());
			li.setL_content(getL_content());
			li.setL_rep_img(serverFullPath);
			li.setL_date(Calendar.getInstance().getTime());
			
			sqlMapper.insert("lendplace_insert",li);
			
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
	
}
