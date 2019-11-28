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
import poly.service.ICommentService;

@Service("CommentService")
public class CommentService implements ICommentService{
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
	public Map<String, Object> insertComment(CommentDTO cdto, QnADTO qdto) throws Exception {
		
		commentMapper.insertComment(cdto);
		
		Map<String, Object> cmap = new HashMap<String, Object>();
		List<NoticeDTO> nlist = noticeMapper.getAllNotice();
		List<EventDTO> elist = eventMapper.getAllEvent();
		QnADTO qdto1 = qnaMapper.getQnADetail(qdto);
		qdto1.setClist(commentMapper.getComment(qdto1));
		cmap.put("nlist", nlist);
		cmap.put("elist", elist);
		cmap.put("qnadetail", qdto1);
		
		return cmap;
		
	}
	@Override
	public Map<String, Object> deleteComment(CommentDTO cdto, QnADTO qdto) throws Exception {
		
		commentMapper.deleteComment(cdto);
		Map<String, Object> cmap = new HashMap<String, Object>();
		List<NoticeDTO> nlist = noticeMapper.getAllNotice();
		List<EventDTO> elist = eventMapper.getAllEvent();
		QnADTO qdto1 = qnaMapper.getQnADetail(qdto);
		qdto1.setClist(commentMapper.getComment(qdto1));
		
		cmap.put("nlist", nlist);
		cmap.put("elist", elist);
		cmap.put("qnadetail", qdto1);
		
		return cmap;
	}
	@Override
	public Map<String, Object> updateCommForm(CommentDTO cdto, QnADTO qdto) throws Exception {
		CommentDTO cdto1 = commentMapper.getOneComment(cdto);
		
		Map<String, Object> cmap = new HashMap<String, Object>();
		List<NoticeDTO> nlist = noticeMapper.getAllNotice();
		List<EventDTO> elist = eventMapper.getAllEvent();
		QnADTO qdto1 = qnaMapper.getQnADetail(qdto);
		qdto1.setClist(commentMapper.getComment(qdto1));
		
		cmap.put("nlist", nlist);
		cmap.put("elist", elist);
		cmap.put("qnadetail", qdto1);
		cmap.put("commupdateform", cdto1);
		return cmap;
	}
	@Override
	public Map<String, Object> updateComm(CommentDTO cdto, QnADTO qdto) throws Exception {
		commentMapper.updateComment(cdto);
		
		Map<String, Object> cmap = new HashMap<String, Object>();
		List<NoticeDTO> nlist = noticeMapper.getAllNotice();
		List<EventDTO> elist = eventMapper.getAllEvent();
		QnADTO qdto1 = qnaMapper.getQnADetail(qdto);
		qdto1.setClist(commentMapper.getComment(qdto1));
		
		cmap.put("nlist", nlist);
		cmap.put("elist", elist);
		cmap.put("qnadetail", qdto1);
		
		return cmap;
	}
	@Override
	public QnADTO insertUserComment(CommentDTO cdto, QnADTO qdto) throws Exception {
		System.out.println(cdto.getComm_content());
		commentMapper.insertComment(cdto);
		QnADTO qdto1 = qnaMapper.getQnADetail(qdto);
		qdto1.setClist(commentMapper.getCommentList(qdto));
		
		return qdto1;
	}
	@Override
	public QnADTO deleteUserComment(CommentDTO cdto, QnADTO qdto) throws Exception {

		commentMapper.deleteComment(cdto);
		List<CommentDTO> clist = commentMapper.getComment(qdto);
		QnADTO qdto1 = qnaMapper.getQnADetail(qdto);
		qdto1.setClist(clist);
		
		return qdto1;
	}
	@Override
	public Map<String, Object> updateUserCommentForm(CommentDTO cdto, QnADTO qdto) throws Exception {

		Map<String , Object> cmap = new HashMap<String, Object>();
		
		QnADTO qdto1 = qnaMapper.getQnADetail(qdto);
		CommentDTO cdto1 = commentMapper.getOneComment(cdto);
		List<CommentDTO> clist = commentMapper.getComment(qdto1);
		qdto1.setClist(clist);
		cmap.put("qdto", qdto1);
		cmap.put("cdto", cdto1);
		return cmap;
	}
	@Override
	public QnADTO updateUserComment(CommentDTO cdto, QnADTO qdto) throws Exception {

		commentMapper.updateComment(cdto);
		List<CommentDTO> clist = commentMapper.getComment(qdto);
		QnADTO qdto1 = qnaMapper.getQnADetail(qdto);
		qdto1.setClist(clist);
		
		return qdto1;
	}
	@Override
	public int getCommentTotal(String qseq) throws Exception {
		// TODO Auto-generated method stub
		return commentMapper.getCommentTotal(qseq);
	}
	@Override
	public List<CommentDTO> getCommentList(CommentDTO pcDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
