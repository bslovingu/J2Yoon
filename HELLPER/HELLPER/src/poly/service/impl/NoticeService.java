package poly.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.NoticeDTO;
import poly.dto.QnADTO;
import poly.persistance.mapper.EventMapper;
import poly.persistance.mapper.MemberMapper;
import poly.persistance.mapper.NoticeMapper;
import poly.persistance.mapper.QnAMapper;
import poly.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService{

	
	@Resource(name="MemberMapper")
	private MemberMapper MemberMapper;
	
	@Resource(name="QnAMapper")
	private QnAMapper qnaMapper;
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;
	
	@Resource(name="EventMapper")
	private EventMapper eventMapper;
	
	
	@Override
	public List<NoticeDTO> getAllNotice() throws Exception {
		return noticeMapper.getAllNotice();
	}

	@Override
	public Map<String, Object> insertNotice(NoticeDTO ndto) throws Exception {
		noticeMapper.insertNotice(ndto);
		Map<String, Object> nmap = new HashMap<String, Object>();
		nmap.put("elist", eventMapper.getAllEvent());
		nmap.put("nlist", noticeMapper.getAllNotice());
		nmap.put("qlist", qnaMapper.getAllQna());
		
		return nmap;
	}
	
	public Map<String, Object> getNoticeDetail(NoticeDTO ndto) throws Exception{
		NoticeDTO dto = noticeMapper.getNoticeDetail(ndto);
		noticeMapper.updateNoticeCnt(ndto);
		Map<String, Object> nmap = new HashMap<String, Object>();
		nmap.put("elist", eventMapper.getAllEvent());
		nmap.put("nlist", noticeMapper.getAllNotice());
		nmap.put("qlist", qnaMapper.getAllQna());
		nmap.put("ndetail", dto);
		return nmap;
	}

	@Override
	public Map<String, Object> updateNoticeDetail(NoticeDTO ndto) throws Exception {
		noticeMapper.updateNoticeDetail(ndto);
		Map<String, Object> nmap = new HashMap<String, Object>();
		nmap.put("elist", eventMapper.getAllEvent());
		nmap.put("nlist", noticeMapper.getAllNotice());
		nmap.put("qlist", qnaMapper.getAllQna());
		
		return nmap;
	}

	@Override
	public Map<String, Object> deleteNotice(NoticeDTO ndto) throws Exception {
		
		noticeMapper.deleteNotice(ndto);
		Map<String, Object> nmap = new HashMap<String, Object>();
		nmap.put("elist", eventMapper.getAllEvent());
		nmap.put("nlist", noticeMapper.getAllNotice());
		nmap.put("qlist", qnaMapper.getAllQna());
		
		return nmap;
	}

	@Override
	public Map<String, Object> getAllList() throws Exception {
		Map<String, Object> nmap = new HashMap<String, Object>();
		nmap.put("elist", eventMapper.getAllEvent());
		nmap.put("nlist", noticeMapper.getAllNotice());
		nmap.put("qlist", qnaMapper.getAllQna());
		return nmap;
	}
	
	@Override
	public int getNoticeTotal() throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.getNoticeTotal();
	}
	
	@Override
	public List<NoticeDTO> getNoticeList(NoticeDTO pnDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.getNoticeList(pnDTO);
	}
}
