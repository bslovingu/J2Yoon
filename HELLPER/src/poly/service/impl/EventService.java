package poly.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.EventDTO;
import poly.persistance.mapper.EventMapper;
import poly.persistance.mapper.MemberMapper;
import poly.persistance.mapper.NoticeMapper;
import poly.persistance.mapper.QnAMapper;
import poly.service.IEventService;
@Service("EventService")
public class EventService implements IEventService{

	@Resource(name="MemberMapper")
	private MemberMapper MemberMapper;
	
	@Resource(name="QnAMapper")
	private QnAMapper qnaMapper;
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;
	
	@Resource(name="EventMapper")
	private EventMapper eventMapper;
	
	@Override
	public List<EventDTO> getAllEvent() throws Exception {
		return eventMapper.getAllEvent();
	}

	@Override
	public Map<String, Object> getEventDetail(EventDTO edto) throws Exception {
		EventDTO edto1 = eventMapper.getEventDetail(edto);
		eventMapper.updateEventCnt(edto);
		Map<String, Object> emap = new HashMap<String, Object>();
		emap.put("nlist", noticeMapper.getAllNotice());
		emap.put("qlist", qnaMapper.getAllQna());
		emap.put("edto", edto1);
		return emap;
	}

	@Override
	public Map<String, Object> insertEvent(EventDTO edto) throws Exception {
		eventMapper.insertEvent(edto);
		Map<String, Object> emap = new HashMap<String, Object>();
		emap.put("nlist", noticeMapper.getAllNotice());
		emap.put("qlist", qnaMapper.getAllQna());
		emap.put("elist", eventMapper.getAllEvent());
		
		return emap;
	}

	@Override
	public Map<String, Object> updateEvent(EventDTO edto) throws Exception {
		eventMapper.updateEvent(edto);
		
		Map<String, Object> emap = new HashMap<String, Object>();
		emap.put("nlist", noticeMapper.getAllNotice());
		emap.put("qlist", qnaMapper.getAllQna());
		emap.put("elist", eventMapper.getAllEvent());
		
		
		return emap;
	}

	@Override
	public Map<String, Object> deleteEvetn(EventDTO edto) throws Exception {
		eventMapper.deleteEvent(edto);
		
		Map<String, Object> emap = new HashMap<String, Object>();
		emap.put("nlist", noticeMapper.getAllNotice());
		emap.put("qlist", qnaMapper.getAllQna());
		emap.put("elist", eventMapper.getAllEvent());
		
		
		return emap;
	}

	@Override
	public Map<String, Object> eventRegForm() throws Exception {
		Map<String, Object> emap = new HashMap<String, Object>();
		emap.put("nlist", noticeMapper.getAllNotice());
		emap.put("qlist", qnaMapper.getAllQna());
		return emap;
	}

	

}
