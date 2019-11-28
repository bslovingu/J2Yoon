package poly.dto;

public class BmiDTO {
	String bmi_seq;
	
	String bmi_result;
	String bmi_mem_seq;
	
	public BmiDTO(){
	}
	
	
	public String getBmi_seq() {
		return bmi_seq;
	}
	public void setBmi_seq(String bmi_seq) {
		this.bmi_seq = bmi_seq;
	}
	public String getBmi_result() {
		return bmi_result;
	}
	public void setBmi_result(String bmi_result) {
		this.bmi_result = bmi_result;
	}
	public String getBmi_mem_seq() {
		return bmi_mem_seq;
	}
	public void setBmi_mem_seq(String bmi_mem_seq) {
		this.bmi_mem_seq = bmi_mem_seq;
	}
}
