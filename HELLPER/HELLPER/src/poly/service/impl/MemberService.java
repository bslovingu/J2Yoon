package poly.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.MemberDTO;
import poly.persistance.mapper.EventMapper;
import poly.persistance.mapper.MemberMapper;
import poly.persistance.mapper.NoticeMapper;
import poly.persistance.mapper.QnAMapper;
import poly.service.IMemberService;
import poly.util.EncryptUtil;

@Service("MemberService")
public class MemberService implements IMemberService{
	
	@Resource(name="MemberMapper")
	private MemberMapper MemberMapper;
	
	@Resource(name="QnAMapper")
	private QnAMapper qnaMapper;
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;
	
	@Resource(name="EventMapper")
	private EventMapper eventMapper;
	
	public int insertMember(MemberDTO mdto) throws Exception{
		int returnvalue = -1; 
		MemberDTO check = new MemberDTO();
		check = MemberMapper.getIdCheck(mdto);
		if(check != null){
			 returnvalue = 0;
		}else{
			MemberMapper.insertMember(mdto);
			returnvalue = 1;
		}
		
		return returnvalue;
	}

	@Override
	public Map<String, Object> getLogin(MemberDTO mdto) throws Exception {
		
		Map<String, Object> mmap = new HashMap<String, Object>();
		MemberDTO logindto = MemberMapper.getLogin(mdto);
		if(logindto == null){
			return mmap;
		}
		List<MemberDTO> mlist = MemberMapper.getMemberInfo(mdto);
		
		
		
		mmap.put("mdto", logindto);
		mmap.put("mlist", mlist);
		
		return mmap;
	}
	
	public MemberDTO getIdCheck(MemberDTO mdto) throws Exception{
		return MemberMapper.getIdCheck(mdto);
	}

	@Override
	public MemberDTO getIdSearch(MemberDTO mdto) throws Exception {
		return MemberMapper.getIdSearch(mdto);
	}

	@Override
	public MemberDTO getPasswordSearch(MemberDTO mdto) throws Exception {
		
		MemberDTO dto = null;
		
		dto = MemberMapper.getPasswordSearch(mdto);
		if(dto != null){
			long temp_pass = (long)(Math.random()*9000000000l) + 1000000000l;
			String temp_password = Long.toHexString(temp_pass);
			System.out.println("임시 비번 : " + temp_password);
			MemberDTO tempdto = new MemberDTO();
			tempdto.setName(mdto.getName());
			tempdto.setEmail(mdto.getEmail());
			tempdto.setPhone(mdto.getPhone());
			tempdto.setTemp_password(EncryptUtil.encHashSHA256(temp_password));
			MemberMapper.updateTempPasssword(tempdto);
			dto.setPassword(temp_password);
			return dto;
		}else{
			return null;
		}
		
	}

	@Override
	public List<MemberDTO> getAllMemberInfo() throws Exception {
		return MemberMapper.getAllMemberInfo();
	}

	@Override
	public Map<String, Object> getMemberDetail(MemberDTO mdto, String login_seq) throws Exception {
		System.out.println("test1 : " + mdto.getMem_seq());
		MemberDTO mdto1 =  MemberMapper.getMemberDetail(mdto);
		Map<String, Object> mmap = new HashMap<String, Object>();
		
		mmap.put("mdto", mdto1);
		
		return mmap;
	}

	@Override
	public Map<String, Object> updateMemberDetail(MemberDTO mdto, String login_seq) throws Exception {
		MemberMapper.updateMemberDetail(mdto);
		Map<String, Object> mmap = new HashMap<String, Object>();
		List<MemberDTO> mlist = MemberMapper.getAllMemberInfo();
		
		mmap.put("mlist", mlist);
		
		return mmap;
		
		
	}
	@Override
	public void updateUserMemberDetail(MemberDTO mdto) throws Exception {
		MemberMapper.updateMemberDetail(mdto);

	}
	public Map<String, Object> deleteMember(MemberDTO mdto, String login_seq) throws Exception{
		
		MemberMapper.deleteMember(mdto);
		Map<String, Object> mmap = new HashMap<String, Object>();
		List<MemberDTO> mlist = MemberMapper.getAllMemberInfo();
		
		
		mmap.put("mlist", mlist);
		
		return mmap;
	}

	@Override
	public MemberDTO getMemberSeq(MemberDTO mdto) throws Exception {
		return MemberMapper.getMemberSeq(mdto);
	}

	@Override
	public List<MemberDTO> getMemberList() throws Exception{
		return MemberMapper.getAllMemberInfo();
	}

	@Override
	public List<MemberDTO> updatePassword(MemberDTO mdto) throws Exception {
		
		MemberMapper.updatePassword(mdto);
		List<MemberDTO> mlist = MemberMapper.getAllMemberInfo();
		
		return mlist;
	}

	@Override
	public int updateUserPassword(MemberDTO mdto) throws Exception {
		
		return MemberMapper.updatePassword(mdto);
	}

	@Override
	public int getMembertotal() throws Exception {
		// TODO Auto-generated method stub
		return MemberMapper.getMembertotal();
	}

	@Override
	public List<MemberDTO> getMemberInfo(MemberDTO mdto) throws Exception {
		// TODO Auto-generated method stub
		return MemberMapper.getMemberInfo(mdto);
	}

	
}
