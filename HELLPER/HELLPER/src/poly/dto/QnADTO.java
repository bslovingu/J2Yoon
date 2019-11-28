package poly.dto;

import java.util.List;

public class QnADTO {
	String qna_seq;
	String qna_title;
	String qna_content;
	String qna_uploadname;
	String qna_cnt;
	String qna_upday;
	List<CommentDTO> clist;
	int startNum;
	int endNum;
	public List<CommentDTO> getClist() {
		return clist;
	}
	public void setClist(List<CommentDTO> clist) {
		this.clist = clist;
	}
	public String getQna_seq() {
		return qna_seq;
	}
	public void setQna_seq(String qna_seq) {
		this.qna_seq = qna_seq;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_uploadname() {
		return qna_uploadname;
	}
	public void setQna_uploadname(String qna_uploadname) {
		this.qna_uploadname = qna_uploadname;
	}
	public String getQna_cnt() {
		return qna_cnt;
	}
	public void setQna_cnt(String qna_cnt) {
		this.qna_cnt = qna_cnt;
	}
	public String getQna_upday() {
		return qna_upday;
	}
	public void setQna_upday(String qna_upday) {
		this.qna_upday = qna_upday;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
	
}
