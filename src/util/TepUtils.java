package util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class TepUtils {
	/**
	 * @param date
	 * @return 8월 30일 (화) 9시 00분
	 */
	public static String dateFormat(Date date){
		SimpleDateFormat f = new SimpleDateFormat("MM월 dd일 (EEE) HH시 mm분",Locale.KOREAN);
		return f.format(date);
	}
	
	/**
	 * @param start ; 모임시작일시
	 * @param end ; 모임종료일시
	 * @return 8월 30일 (화) 9시 00분 ~ 2017년 2월 22일 (수) 18시 30분
	 */
	public static String dateFormat(Date start, Date end){
		SimpleDateFormat sf = new SimpleDateFormat("MM월 dd일 (EEE) HH시 mm분",Locale.KOREAN);
		SimpleDateFormat ef = new SimpleDateFormat("yyyy년 MM월 dd일 (EEE) HH시 mm분",Locale.KOREAN);
		return sf.format(start)+" ~ "+ef.format(end);
	}
	
}