package openmeet;

import java.io.File;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapper;
import util.FileUploadService;
import util.TepUtils;

public class OpenmeetModifyAction extends OpenmeetModel implements SessionAware{
	private SqlMapClient sqlMapper;
	private Map session;
	
	private File upload; //업로드할 실제파일
	private String uploadFileName; //업로드할 로컬 파일명
	private String uploadContentType; //업로드할 파일의 컨텐츠 타입
	
	public OpenmeetModifyAction(){
		sqlMapper = SqlMapper.getMapper();
	}
	
	public String view(){
		try {
			CopyData((OpenmeetModel) sqlMapper.queryForObject("jin.openmeet_select_one",getO_no()));
			setO_msdate(TepUtils.dateParseFormat(getO_m_sdate()));
			setO_medate(TepUtils.dateParseFormat(getO_m_edate()));
			setO_rsdate(TepUtils.dateParseFormat(getO_r_sdate()));
			setO_redate(TepUtils.dateParseFormat(getO_r_edate()));
		} catch (Exception e) {
			System.out.println("openmeet modify view error : "+e.getMessage());
		}
		return "success";
	}
	
	//대표이미지 업로드
	private String fileUpload(){
		String basePath = FileUploadService.UPLOAD_TEMP_PATH;
		FileUploadService fs = new FileUploadService();
		try {
			uploadFileName = System.currentTimeMillis()+"_"+uploadFileName;
			return fs.saveFile(upload, basePath, uploadFileName);
		} catch (Exception e) {
			System.out.println("file upload error : "+e.getMessage());
		}
		return null;
	}
	
	public String modify(){
		try {
			int m_no = (int) session.get("session_m_no");
			OpenmeetModel data = (OpenmeetModel) sqlMapper.queryForObject("jin.openmeet_select_one",getO_no());
			if(upload != null && session.get("o_content_img"+m_no) != null){
				deleteFileImage(data.getO_rep_img(), data.getO_content_img());
			} else if(upload != null && session.get("o_content_img"+m_no) == null){
				deleteFileImage(data.getO_rep_img(),null);
			} else if(upload == null && session.get("o_content_img"+m_no) != null){
				deleteFileImage(null, data.getO_content_img());
			}
			
			setO_rep_img(fileUpload()==null?data.getO_rep_img():fileUpload());
			if(session.get("o_content_img"+m_no) != null){
				setO_content_img(session.get("o_content_img"+m_no).toString());
			} else {
				setO_content_img(data.getO_content_img());
			}
			setO_m_sdate(TepUtils.dateParse(getO_msdate()));
			setO_m_edate(TepUtils.dateParse(getO_medate()));
			setO_r_sdate(TepUtils.dateParse(getO_rsdate()));
			setO_r_edate(TepUtils.dateParse(getO_redate()));
			setO_date(Calendar.getInstance().getTime());
			
			sqlMapper.insert("jin.openmeet_update",this);
			
			if(session.get("o_content_img"+m_no) != null){
				session.remove("o_content_img"+m_no);
			}
		} catch (Exception e) {
			System.out.println("openmeet modify error : "+e.getMessage());
		}
		return "success";
	}
	
	public String delete(){
		try {
			CopyData((OpenmeetModel) sqlMapper.queryForObject("jin.openmeet_select_one",getO_no()));
			deleteFileImage(getO_rep_img(),getO_content_img());
			sqlMapper.delete("jin.openmeet_delete",getO_no());
			sqlMapper.delete("jin.comments_delete_all_openmeet",getO_no());
		} catch (Exception e) {
			System.out.println("openmeet delete error : "+e.getMessage());
		}
		return "success";
	}
	
	private void deleteFileImage(String rep_img, String content_img){
		if(rep_img != null){
			File f_rep = new File(rep_img);
			if(f_rep != null && f_rep.exists()){
				f_rep.delete();
			}
		}
		if(content_img != null){
			File f_content = new File(content_img);
			if(f_content != null && f_content.exists()){
				f_content.delete();
			}
		}
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

}
