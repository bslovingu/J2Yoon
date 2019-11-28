package poly.service;


import java.util.List;
import java.util.Map;

import poly.dto.MemberDTO;

public interface IMemberService {
	
	public int insertMember(MemberDTO mdto) throws Exception;
	
	public Map<String, Object> getLogin(MemberDTO mdto) throws Exception;
	
	
	
	public MemberDTO getIdCheck(MemberDTO mdto) throws Exception;
	
	public MemberDTO getIdSearch(MemberDTO mdto) throws Exception;
	
	public MemberDTO getPasswordSearch(MemberDTO mdto) throws Exception;
	
	public List<MemberDTO> getAllMemberInfo() throws Exception;
	
	public Map<String, Object> getMemberDetail(MemberDTO mdto, String login_seq) throws Exception;
	
	public Map<String, Object> updateMemberDetail(MemberDTO mdto, String login_seq) throws Exception;
	
	public Map<String, Object> deleteMember(MemberDTO mdto, String login_seq) throws Exception;
	
	public MemberDTO getMemberSeq(MemberDTO mdto) throws Exception;

	public List<MemberDTO> getMemberList() throws Exception;

	public void updateUserMemberDetail(MemberDTO mdto) throws Exception;
	
	public List<MemberDTO> updatePassword(MemberDTO mdto) throws Exception;
	
	public int updateUserPassword(MemberDTO mdto) throws Exception;

	public int getMembertotal() throws Exception;

	public List<MemberDTO> getMemberInfo(MemberDTO mdto) throws Exception;
	
}
