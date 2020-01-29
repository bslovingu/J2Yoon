package poly.dto;

import java.sql.Date;

public class NoticeDTO {
	String notice_seq;
	String notice_title;
	String notice_content;
	String notice_uploadname;
	String notice_cnt;
	Date notice_upday;
	int NstartNum;
	int NendNum;
	
	public NoticeDTO(){}
	public NoticeDTO(String title, String uploadname, String content){
		this.notice_title = title;
		this.notice_uploadname = uploadname;
		this.notice_content = content;
	}
	
	public String getNotice_seq() {
		return notice_seq;
	}
	public void setNotice_seq(String notice_seq) {
		this.notice_seq = notice_seq;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_uploadname() {
		return notice_uploadname;
	}
	public void setNotice_uploadname(String notice_uploadname) {
		this.notice_uploadname = notice_uploadname;
	}
	public String getNotice_cnt() {
		return notice_cnt;
	}
	public void setNotice_cnt(String notice_cnt) {
		this.notice_cnt = notice_cnt;
	}
	public Date getNotice_upday() {
		return notice_upday;
	}
	public void setNotice_upday(Date notice_upday) {
		this.notice_upday = notice_upday;
	}
	public int getNstartNum() {
		return NstartNum;
	}
	public void setNstartNum(int NstartNum) {
		this.NstartNum = NstartNum;
	}
	public int getNendNum() {
		return NendNum;
	}
	public void setNendNum(int NendNum) {
		this.NendNum = NendNum;
	}
	
}	
