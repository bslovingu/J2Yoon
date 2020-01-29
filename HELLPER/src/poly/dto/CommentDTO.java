package poly.dto;

public class CommentDTO {
	String qna_seq;
	String comm_seq;
	String comm_uploadname;
	String comm_content;
	String comm_upday;
	int cstartNum;
	int cendNum;
	
	
	public int getCstartNum() {
		return cstartNum;
	}
	public void setCstartNum(int cstartNum) {
		this.cstartNum = cstartNum;
	}
	public int getCendNum() {
		return cendNum;
	}
	public void setCendNum(int cendNum) {
		this.cendNum = cendNum;
	}
	public String getQna_seq() {
		return qna_seq;
	}
	public void setQna_seq(String qna_seq) {
		this.qna_seq = qna_seq;
	}
	public String getComm_seq() {
		return comm_seq;
	}
	public void setComm_seq(String comm_seq) {
		this.comm_seq = comm_seq;
	}
	public String getComm_uploadname() {
		return comm_uploadname;
	}
	public void setComm_uploadname(String comm_uploadname) {
		this.comm_uploadname = comm_uploadname;
	}
	public String getComm_content() {
		return comm_content;
	}
	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	public String getComm_upday() {
		return comm_upday;
	}
	public void setComm_upday(String comm_upday) {
		this.comm_upday = comm_upday;
	}
}
