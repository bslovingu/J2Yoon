package poly.dto;

public class MemberDTO {
	String mem_seq;
	String name;
	String email;
	String password;
	String phone;
	String temp_password;
	String status;
	
	int MstartNum;
	int MendNum;
	
	public MemberDTO(){}
	
	public MemberDTO(String name, String email, String password, String phone){
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;

	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getMstartNum() {
		return MstartNum;
	}

	public void setMstartNum(int mstartNum) {
		MstartNum = mstartNum;
	}

	public int getMendNum() {
		return MendNum;
	}

	public void setMendNum(int mendNum) {
		MendNum = mendNum;
	}

	public String getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(String mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getTemp_password() {
		return temp_password;
	}

	public void setTemp_password(String temp_password) {
		this.temp_password = temp_password;
	}
	
	
	
}
