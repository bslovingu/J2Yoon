package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.CommentDTO;
import poly.dto.QnADTO;
import poly.service.ICommentService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;
import poly.util.FilterUtil;

@Controller
public class UserCommentController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "CommentService")
	private ICommentService commentService;

	@RequestMapping(value = "/usercomment/userqnacomminsert")
	public String userQnACommInsert(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		log.info(this.getClass().getName() + ".userQnACommInsert start!");
		String qseq = CmmUtil.nvl(request.getParameter("qseq"));
		log.info("qseq : " + qseq);
		String user_email = CmmUtil.nvl(request.getParameter("user_email"));
		log.info("user_email : " + user_email);
		String content = CmmUtil.nvl(request.getParameter("comment"));
		log.info("comment : " + content);
		CommentDTO cdto = new CommentDTO();
		cdto.setComm_content(content);
		cdto.setQna_seq(qseq);
		cdto.setComm_uploadname(user_email);

		QnADTO qdto = new QnADTO();
		// 댓글 페이지 받음
		int CPgNum = 1;
		// 전체 댓글 갯수 조회
		int Ctotal = commentService.getCommentTotal(qseq);
		log.info(Ctotal);
		qdto.setQna_seq(qseq);
		qdto.setStartNum((CPgNum - 1) * 10 + 1);
		qdto.setEndNum(CPgNum * 10);

		qdto = commentService.insertUserComment(cdto, qdto);
		qdto = FilterUtil.QnAFilter(qdto);

		List<CommentDTO> clist = qdto.getClist();
		
		// 리스트, 해쉬맵 다 가져오는거 Iterator사용 (얘는 무조건 while문)
		Iterator<CommentDTO> it = clist.iterator();
		
		clist = null;
		clist = new ArrayList<CommentDTO>();
		
		FilterUtil fu = new FilterUtil();
		while(it.hasNext()) {
			clist.add(fu.CommentFilter(it.next()));
		}
			
		qdto.setClist(clist);
		
		model.addAttribute("qdto", qdto);
		model.addAttribute("CPgNum",CPgNum);
		model.addAttribute("Ctotal",Ctotal);

		qdto = null;
		cdto = null;
		log.info(this.getClass().getName() + ".userQnACommInsert end!");
		return "/user/userqnadetail";
	}

	@RequestMapping("/usercomment/deleteusercomment")
	public String deleteUserComment(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		log.info(this.getClass().getName() + ".deleteUserComment start!");

		String cseq = CmmUtil.nvl(request.getParameter("cseq"));
		log.info("cseq : " + cseq);
		String qseq = CmmUtil.nvl(request.getParameter("qseq"));
		log.info("qseq : " + qseq);

		CommentDTO cdto = new CommentDTO();
		cdto.setComm_seq(cseq);
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);

		qdto = commentService.deleteUserComment(cdto, qdto);

		model.addAttribute("qdto", qdto);

		log.info(this.getClass().getName() + ".deleteUserComment end!");
		return "/user/userqnadetail";
	}

	@RequestMapping("/usercomment/updateusercommform")
	public String updateUserCommForm(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		log.info(this.getClass().getName() + ".updateUserCommForm start!");
		String cseq = CmmUtil.nvl(request.getParameter("cseq"));
		log.info("cseq : " + cseq);
		String qseq = CmmUtil.nvl(request.getParameter("qseq"));
		log.info("qseq : " + qseq);

		CommentDTO cdto = new CommentDTO();
		cdto.setComm_seq(cseq);
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);

		Map<String, Object> cmap = new HashMap<String, Object>();
		cmap = commentService.updateUserCommentForm(cdto, qdto);

		cdto = (CommentDTO) cmap.get("cdto");
		qdto = (QnADTO) cmap.get("qdto");
		cdto.setComm_content(cdto.getComm_content().replaceAll("<br>", "\r\n"));
		model.addAttribute("qdto", qdto);
		model.addAttribute("commupdateform", cdto);
		log.info(this.getClass().getName() + ".updateUserCommForm end!");
		return "/user/userqnadetail";
	}

	@RequestMapping(value = "/usercomment/updateusercomm")
	public String updateUserComm(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		log.info(this.getClass().getName() + ".updateUserComm end!");
		String cseq = CmmUtil.nvl(request.getParameter("cseq"));
		log.info("cseq : " + cseq);
		String qseq = CmmUtil.nvl(request.getParameter("qseq"));
		log.info("qseq : " + qseq);
		String content = CmmUtil.nvl(request.getParameter("comment"));
		log.info("content : " + content);
		String user_email = CmmUtil.nvl(request.getParameter("user_email"));
		log.info("user_email : " + user_email);
		content = content.replaceAll("\r\n", "<br>");
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);
		CommentDTO cdto = new CommentDTO();
		cdto.setComm_seq(cseq);
		cdto.setComm_content(content);
		cdto.setComm_uploadname(user_email);

		qdto = commentService.updateUserComment(cdto, qdto);

		model.addAttribute("qdto", qdto);

		qdto = null;
		cdto = null;
		log.info(this.getClass().getName() + ".updateUserComm end!");
		return "/user/userqnadetail";
	}
}
