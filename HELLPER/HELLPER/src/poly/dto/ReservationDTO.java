package poly.dto;

public class ReservationDTO {

	String fac_seq;
	String reserv_seq;
	String stime;
	String etime;
	int reserv_member;
	String max_member;
	String reserv_uploadname;
	String flag;
	String date;
	
	public String getReserv_uploadname() {
		return reserv_uploadname;
	}
	public void setReserv_uploadname(String reserv_uploadname) {
		this.reserv_uploadname = reserv_uploadname;
	}
	public String getFac_seq() {
		return fac_seq;
	}
	public void setFac_seq(String fac_seq) {
		this.fac_seq = fac_seq;
	}
	public String getReserv_seq() {
		return reserv_seq;
	}
	public void setReserv_seq(String reserv_seq) {
		this.reserv_seq = reserv_seq;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public String getMax_member() {
		return max_member;
	}
	public void setMax_member(String max_member) {
		this.max_member = max_member;
	}
	public int getReserv_member() {
		return reserv_member;
	}
	public void setReserv_member(int reserv_member) {
		this.reserv_member = reserv_member;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	

}
