package poly.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.CommentDTO;
import poly.dto.EventDTO;
import poly.dto.NoticeDTO;
import poly.dto.QnADTO;
import poly.service.ICommentService;
import poly.service.IQnAService;
import poly.util.CmmUtil;

@Controller
public class CommentController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CommentService")
	private ICommentService commentService;
	
	@RequestMapping(value="/Comment/QnAcomminsert", method=RequestMethod.POST)
	public String qnACommInsert(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + "qnACommInsert start!");
		
		String qseq = CmmUtil.nvl(request.getParameter("qseq"));
		log.info("qseq : " + qseq);
		String comment = CmmUtil.nvl(request.getParameter("comment"));
		log.info("comment : " + comment);
		String user_email = CmmUtil.nvl(request.getParameter("user_email"));
		log.info("user_email : "  + user_email);
		CommentDTO cdto = new CommentDTO();
		cdto.setComm_uploadname(user_email);
		cdto.setComm_content(comment);
		cdto.setQna_seq(qseq);
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);
		Map<String , Object> cmap = commentService.insertComment(cdto, qdto);
		
		List<NoticeDTO> nlist = (List<NoticeDTO>)cmap.get("nlist");
		List<EventDTO> elist = (List<EventDTO>)cmap.get("elist");
		qdto = (QnADTO)cmap.get("qnadetail");
		
		if(nlist == null){
			nlist = new ArrayList<NoticeDTO>();
		}
		if(elist == null){
			elist = new ArrayList<EventDTO>();
		}
		if(qdto == null){
			qdto = new QnADTO();
		}
		System.out.println("댓글 길이 " + qdto.getClist().size());
		model.addAttribute("nlist", nlist);
		model.addAttribute("elist", elist);
		model.addAttribute("qnadetail", qdto);
		log.info(this.getClass().getName() + "qnACommInsert end!");
		return "/notice/admincommunity";
	}
	
	@RequestMapping("/Comment/deletecomment")
	public String deleteComment(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + "deletecomment start!");
		String cseq = request.getParameter("cseq");
		log.info("cseq : " + cseq);
		String qseq = request.getParameter("qseq");
		log.info("qseq : " + qseq);
		
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);
		
		CommentDTO cdto = new CommentDTO();
		cdto.setComm_seq(cseq);
		
		Map<String, Object> cmap = commentService.deleteComment(cdto, qdto);
		List<NoticeDTO> nlist = (List<NoticeDTO>)cmap.get("nlist");
		List<EventDTO> elist = (List<EventDTO>)cmap.get("elist");
		qdto = (QnADTO)cmap.get("qnadetail");
		
		if(nlist == null){
			nlist = new ArrayList<NoticeDTO>();
		}
		if(elist == null){
			elist = new ArrayList<EventDTO>();
		}
		if(qdto == null){
			qdto = new QnADTO();
		}
		
		model.addAttribute("nlist", nlist);
		model.addAttribute("elist", elist);
		model.addAttribute("qnadetail", qdto);
		log.info(this.getClass().getName() + "deletecomment end!");
		return "/notice/admincommunity";
	}
	
	@RequestMapping("/Comment/updatecommform")
	public String updateCommForm(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + "updateCommForm start!");
		String cseq = request.getParameter("cseq");
		log.info("cseq : " + cseq);
		String qseq = request.getParameter("qseq");
		log.info("qseq : " + qseq);
		
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);
		
		CommentDTO cdto = new CommentDTO();
		cdto.setComm_seq(cseq);
		
		Map<String, Object> cmap = commentService.updateCommForm(cdto, qdto);
		List<NoticeDTO> nlist = (List<NoticeDTO>)cmap.get("nlist");
		List<EventDTO> elist = (List<EventDTO>)cmap.get("elist");
		qdto = (QnADTO)cmap.get("qnadetail");
		cdto = (CommentDTO)cmap.get("commupdateform");
		if(nlist == null){
			nlist = new ArrayList<NoticeDTO>();
		}
		if(elist == null){
			elist = new ArrayList<EventDTO>();
		}
		if(qdto == null){
			qdto = new QnADTO();
		}
		if(cdto == null){
			cdto = new CommentDTO();
		}
		
		model.addAttribute("nlist", nlist);
		model.addAttribute("elist", elist);
		model.addAttribute("qnadetail", qdto);
		model.addAttribute("commupdateform", cdto);
		log.info(this.getClass().getName() + "updateCommForm end!");
		return "/notice/admincommunity";
	}
	
	
	@RequestMapping(value="/Comment/updatecomm", method=RequestMethod.POST)
	public String updatComm(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + "updateComm start!");
		String cseq = request.getParameter("cseq");
		log.info("cseq :" + cseq);
		String comment = request.getParameter("comment");
		log.info("comment : " + comment);
		String qseq = request.getParameter("qseq");
		
		CommentDTO cdto = new CommentDTO();
		cdto.setComm_seq(cseq);
		cdto.setComm_content(comment);
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);
		
		Map<String, Object> cmap = commentService.updateComm(cdto, qdto);
		List<NoticeDTO> nlist = (List<NoticeDTO>)cmap.get("nlist");
		List<EventDTO> elist = (List<EventDTO>)cmap.get("elist");
		qdto = (QnADTO)cmap.get("qnadetail");
		
		if(nlist == null){
			nlist = new ArrayList<NoticeDTO>();
		}
		if(elist == null){
			elist = new ArrayList<EventDTO>();
		}
		if(qdto == null){
			qdto = new QnADTO();
		}
		
		model.addAttribute("nlist", nlist);
		model.addAttribute("elist", elist);
		model.addAttribute("qnadetail", qdto);
		
		
		
		log.info(this.getClass().getName() + "updateComm end!");
		return "/notice/admincommunity";
	}
	
}
























