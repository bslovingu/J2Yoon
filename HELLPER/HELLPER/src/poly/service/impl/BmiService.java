package poly.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BmiDTO;
import poly.dto.MemberDTO;
import poly.persistance.mapper.BmiMapper;
import poly.persistance.mapper.EventMapper;
import poly.persistance.mapper.MemberMapper;
import poly.persistance.mapper.NoticeMapper;
import poly.persistance.mapper.QnAMapper;
import poly.service.IBmiService;
@Service("BmiService")
public class BmiService implements IBmiService{
	
	@Resource(name="BmiMapper")
	private BmiMapper bmiMapper;
	
	@Resource(name="MemberMapper")
	private MemberMapper MemberMapper;
	
	@Resource(name="QnAMapper")
	private QnAMapper qnaMapper;
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;
	
	@Resource(name="EventMapper")
	private EventMapper eventMapper;

	@Override
	public Map<String, Object> insertBmi(BmiDTO bdto) throws Exception {
		bmiMapper.insertBmi(bdto);
		Map<String, Object> bmap = new HashMap<String, Object>();
		List<BmiDTO> blist = bmiMapper.getBmi(bdto);
		List<MemberDTO> mlist = MemberMapper.getAllMemberInfo();
		
		bmap.put("blist", blist);
		bmap.put("mlist", mlist);
		
		return bmap;
	}

	@Override
	public List<BmiDTO> userInsertBmi(BmiDTO bdto) throws Exception {
		bmiMapper.insertBmi(bdto);
		List<BmiDTO> blist = bmiMapper.getBmi(bdto);
		
		return blist;
	}

}
