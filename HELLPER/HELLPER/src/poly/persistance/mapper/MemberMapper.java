package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.MemberDTO;

@Mapper("MemberMapper")
public interface MemberMapper {
	public void insertMember(MemberDTO mdto) throws Exception;
	
	public MemberDTO getLogin(MemberDTO mdto) throws Exception;
	
	public MemberDTO getIdCheck(MemberDTO mdto) throws Exception;
	
	public MemberDTO getIdSearch(MemberDTO mdto) throws Exception;
	
	public MemberDTO getPasswordSearch(MemberDTO mdto) throws Exception;
	
	public List<MemberDTO> getAllMemberInfo() throws Exception;
	
	public MemberDTO getMemberDetail(MemberDTO mdto) throws Exception; 
	
	public boolean updateMemberDetail(MemberDTO mdto) throws Exception;
	
	public boolean deleteMember(MemberDTO mdto) throws Exception;
	
	public MemberDTO getMemberSeq(MemberDTO mdto) throws Exception;
	
	public void updateTempPasssword(MemberDTO mdto) throws Exception;
	
	public int updatePassword(MemberDTO mdto) throws Exception;

	public List<MemberDTO> getMemberInfo(MemberDTO mdto) throws Exception;

	public int getMembertotal() throws Exception;

	public int setMemberStop(String mem_seq) throws Exception;

	public int setMemberStart(String mem_seq) throws Exception;
	
	
}
