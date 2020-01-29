package poly.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.CommentDTO;
import poly.dto.EventDTO;
import poly.dto.NoticeDTO;
import poly.dto.QnADTO;
import poly.persistance.mapper.CommentMapper;
import poly.persistance.mapper.EventMapper;
import poly.persistance.mapper.MemberMapper;
import poly.persistance.mapper.NoticeMapper;
import poly.persistance.mapper.QnAMapper;
import poly.service.IQnAService;

@Service("QnAService")
public class QnAService implements IQnAService{
	
	@Resource(name="MemberMapper")
	private MemberMapper MemberMapper;
	
	@Resource(name="QnAMapper")
	private QnAMapper qnaMapper;
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;
	
	@Resource(name="EventMapper")
	private EventMapper eventMapper;
	
	@Resource(name="CommentMapper")
	private CommentMapper commentMapper;
	
	
	@Override
	public List<QnADTO> getAllQna() throws Exception {
		return qnaMapper.getAllQna();
	}


	@Override
	public Map<String, Object> insertQnA(QnADTO qdto) throws Exception {
		qnaMapper.insertQnA(qdto);
		Map<String, Object> allMap = new HashMap<String, Object>();
		List<NoticeDTO> nlist = noticeMapper.getAllNotice();
		List<QnADTO> qlist = qnaMapper.getAllQna();
		List<EventDTO> elist = eventMapper.getAllEvent();
		
		allMap.put("nlist", nlist);
		allMap.put("qlist", qlist);
		allMap.put("elist", elist);
		
		return allMap;
	}


	@Override
	public Map<String, Object> getAllList() throws Exception {
		Map<String, Object> allMap = new HashMap<String, Object>();
		List<NoticeDTO> nlist = noticeMapper.getAllNotice();
		List<QnADTO> qlist = qnaMapper.getAllQna();
		List<EventDTO> elist = eventMapper.getAllEvent();
		
		allMap.put("nlist", nlist);
		allMap.put("qlist", qlist);
		allMap.put("elist", elist);
		
		return allMap;
	}


	@Override
	public Map<String, Object> getQnADetail(QnADTO qdto) throws Exception {
		qnaMapper.updateQnACnt(qdto);
		QnADTO qdto1 = qnaMapper.getQnADetail(qdto);
		Map<String, Object> qmap = new HashMap<String, Object>();
		List<NoticeDTO> nlist = noticeMapper.getAllNotice();
		List<EventDTO> elist = eventMapper.getAllEvent();
		List<CommentDTO> clist = commentMapper.getComment(qdto);
		qdto1.setClist(clist);
		qmap.put("nlist", nlist);
		qmap.put("elist", elist);
		qmap.put("qnadetail", qdto1);
		
		return qmap;
	}


	@Override
	public Map<String, Object> deleteQnA(QnADTO qdto) throws Exception {
		qnaMapper.deleteQnA(qdto);
		Map<String, Object> qmap = new HashMap<String, Object>();
		List<NoticeDTO> nlist = noticeMapper.getAllNotice();
		List<EventDTO> elist = eventMapper.getAllEvent();
		List<QnADTO> qlist = qnaMapper.getAllQna();
		qmap.put("nlist", nlist);
		qmap.put("elist", elist);
		qmap.put("qlist", qlist);
		return qmap;
	}


	@Override
	public Map<String, Object> qnAUpdateForm(QnADTO qdto) throws Exception {
		QnADTO qdto1 = new QnADTO();
		qdto1 = qnaMapper.getQnADetail(qdto);
		Map<String, Object> qmap = new HashMap<String, Object>();
		List<NoticeDTO> nlist = noticeMapper.getAllNotice();
		List<EventDTO> elist = eventMapper.getAllEvent();
		qmap.put("nlist", nlist);
		qmap.put("elist", elist);
		qmap.put("qnaupdateform", qdto1);
		return qmap;
	}


	@Override
	public Map<String, Object> updateQnA(QnADTO qdto) throws Exception {
		qnaMapper.updateQnA(qdto);
		Map<String, Object> qmap = new HashMap<String, Object>();
		List<NoticeDTO> nlist = noticeMapper.getAllNotice();
		List<EventDTO> elist = eventMapper.getAllEvent();
		List<QnADTO> qlist = qnaMapper.getAllQna();
		qmap.put("nlist", nlist);
		qmap.put("elist", elist);
		qmap.put("qlist", qlist);
		
		return qmap;
	}


	@Override
	public QnADTO getUserQnADetail(QnADTO qdto) throws Exception {
		qnaMapper.updateQnACnt(qdto);
		QnADTO qdto1 = qnaMapper.getQnADetail(qdto);
		qdto1.setClist(commentMapper.getCommentList(qdto));
		return qdto1;
	}


	@Override
	public int insertUserQnA(QnADTO qdto) throws Exception {
		return qnaMapper.insertUserQnA(qdto);
	}


	@Override
	public int deleteUserQnA(QnADTO qdto) throws Exception {
		return qnaMapper.deleteUserQnA(qdto);
	}


	@Override
	public int updateUserQnA(QnADTO qdto) throws Exception {
		return qnaMapper.updateUserQnA(qdto);
	}


	@Override
	public int getQnaTotal() throws Exception {
		// TODO Auto-generated method stub
		return qnaMapper.getQnaTotal();
	}


	@Override
	public List<QnADTO> getQnaList(QnADTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaMapper.getQnaList(pDTO);
	}
	
	

}
