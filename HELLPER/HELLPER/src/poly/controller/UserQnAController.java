package poly.controller;

import java.util.ArrayList;
import java.util.List;

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
import poly.dto.QnADTO;
import poly.service.ICommentService;
import poly.service.IQnAService;
import poly.util.EncryptUtil;

@Controller
public class UserQnAController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "QnAService")
	private IQnAService qnaService;
	
	@Resource(name="CommentService")
	private ICommentService commentService;

	@RequestMapping("userqna/userqnalist")
	public String userQnAList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		log.info(this.getClass().getName() + ".userQnAList start!");
		// 현재 페이지 받음
		int PgNum = 0;
		if (request.getParameter("PgNum") == null) {
			PgNum = 1;
		} else {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
		}
		// 전체 게시글 갯수 조회
		int total = qnaService.getQnaTotal();
		QnADTO pDTO = new QnADTO();
		pDTO.setStartNum((PgNum - 1) * 10 + 1);
		pDTO.setEndNum(PgNum * 10);
		List<QnADTO> qlist = qnaService.getQnaList(pDTO);
		if (qlist == null) {
			qlist = new ArrayList<QnADTO>();
		} else {
			for (int i = 0; i < qlist.size(); i++) {
				qlist.get(i).setQna_uploadname(EncryptUtil.decAES128CBC(qlist.get(i).getQna_uploadname()));
			}
		}
		model.addAttribute("qlist", qlist);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);
		log.info(this.getClass().getName() + ".userQnAList end!");
		return "/user/userqna";
	}

	@RequestMapping("userqna/userqnadetail")
	public String userQnADetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		log.info(this.getClass().getName() + ".userQnADetail start!");
		String qseq = request.getParameter("qseq");
		log.info("qseq : " + qseq);

		QnADTO qdto = new QnADTO();
		// 댓글 페이지 받음
		int CPgNum = 0;
		if (request.getParameter("CPgNum") == null) {
			CPgNum = 1;
		} else {
			CPgNum = Integer.parseInt(request.getParameter("CPgNum"));
		}
		// 전체 댓글 갯수 조회
		int Ctotal = commentService.getCommentTotal(qseq);
		
		qdto.setQna_seq(qseq);
		qdto.setStartNum((CPgNum - 1) * 10 + 1);
		qdto.setEndNum(CPgNum * 10);
		qdto = qnaService.getUserQnADetail(qdto);

		model.addAttribute("qdto", qdto);
		model.addAttribute("CPgNum",CPgNum);
		model.addAttribute("Ctotal",Ctotal);

		log.info(this.getClass().getName() + ".userQnADetail end!");
		return "/user/userqnadetail";
	}

	@RequestMapping("userqna/userqnaregform")
	public String userQnARegFrom(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		log.info(this.getClass().getName() + ".userQnARegFrom start!");

		log.info(this.getClass().getName() + ".userQnARegFrom end!");
		return "/user/userqnaregform";
	}

	@RequestMapping(value = "userqna/userqnareg", method = RequestMethod.POST)
	public String userQnAReg(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session)
			throws Exception {
		log.info(this.getClass().getName() + ".userQnAReg start!");
		String title = request.getParameter("title");
		log.info("title : " + title);
		String content = request.getParameter("content");
		log.info("content : " + content);
		content = content.replaceAll("\r\n", "<br>");
		String user_email = (String) session.getAttribute("SS_USER_EMAIL");
		log.info("user_email : " + user_email);

		QnADTO qdto = new QnADTO();
		qdto.setQna_title(title);
		qdto.setQna_content(content);
		qdto.setQna_uploadname(user_email);

		int i = 0;
		i = qnaService.insertUserQnA(qdto);
		System.out.println(i);
		if (i > 0) {
			model.addAttribute("qnaup", "success");
		} else {
			model.addAttribute("qnaup", "fail");
		}

		log.info(this.getClass().getName() + ".userQnAReg end!");
		return "/user/userqnaredirect";
	}

	@RequestMapping("userqna/deleteuserqna")
	public String deleteUserQnA(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".deleteUserQnA start!");
		String qseq = request.getParameter("qseq");
		log.info("qseq : " + qseq);
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);

		int i = 0;
		i = qnaService.deleteUserQnA(qdto);

		if (i > 0) {
			model.addAttribute("qnadelete", "success");
		} else {
			model.addAttribute("qnadelete", "fail");
		}

		log.info(this.getClass().getName() + ".deleteUserQnA end!");
		return "/user/userqnaredirect";
	}

	@RequestMapping("userqna/updateuserqnaform")
	public String updateUserQnAForm(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".updateUserQnAForm start!");
		String qseq = request.getParameter("qseq");
		log.info("qseq : " + qseq);

		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);

		qdto = qnaService.getUserQnADetail(qdto);
		qdto.setQna_content(qdto.getQna_content().replaceAll("<br>", "\r\n"));
		model.addAttribute("qdto", qdto);
		log.info(this.getClass().getName() + ".updateUserQnAForm end!");
		return "/user/qnaupdateform";
	}

	@RequestMapping("userqna/updateuserqna")
	public String updateUserQnA(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		log.info(this.getClass().getName() + ".updateUserQnA end!");
		String qseq = request.getParameter("qseq");
		log.info("qseq : " + qseq);
		String title = request.getParameter("title");
		log.info("title : " + title);
		String content = request.getParameter("content");
		log.info("content : " + content);
		content = content.replaceAll("\r\n", "<br>");
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);
		qdto.setQna_title(title);
		qdto.setQna_content(content);

		int i = 0;
		i = qnaService.updateUserQnA(qdto);
		if (i > 0) {
			model.addAttribute("qnaupdate", "success");
		} else {
			model.addAttribute("qnaupdate", "fail");
		}

		log.info(this.getClass().getName() + ".updateUserQnA end!");
		return "/user/userqnaredirect";
	}

}
