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

import poly.dto.EventDTO;
import poly.dto.NoticeDTO;
import poly.dto.QnADTO;
import poly.service.ICommentService;
import poly.service.IEventService;
import poly.service.INoticeService;
import poly.service.IQnAService;
import poly.service.ISpofacService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

@Controller
public class QnAController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "NoticeService")
	private INoticeService noticeService;

	@Resource(name = "EventService")
	private IEventService eventService;

	@Resource(name = "SpofacService")
	private ISpofacService spofacService;

	@Resource(name = "QnAService")
	private IQnAService qnaService;

	@Resource(name = "CommentService")
	private ICommentService commentService;

	@RequestMapping("/QnA/QnAregform")
	public String qnaReg(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session)
			throws Exception {
		log.info(this.getClass().getName() + "qnareg start!");
		// 공지사항 갯수 조회
		int NPgNum = 0;
		if (request.getParameter("NPgNum") == null) {
			NPgNum = 1;
		} else {
			NPgNum = Integer.parseInt(request.getParameter("NPgNum"));
		}
		// 전체 게시글 갯수 조회
		int Ntotal = noticeService.getNoticeTotal();

		// 체육시설 갯수 조회
		int FPgNum = 0;
		if (request.getParameter("FPgNum") == null) {
			FPgNum = 1;
		} else {
			FPgNum = Integer.parseInt(request.getParameter("FPgNum"));
		}
		// 전체 체육시설 갯수 조회
		int Ftotal = spofacService.getFacTotal();
		// 신고게시글 조회
		int PgNum = 0;
		if (request.getParameter("PgNum") == null) {
			PgNum = 1;
		} else {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
		}
		// 전체 신고게시글 갯수 조회
		int total = qnaService.getQnaTotal();

		/**
		 * 이곳에 예약 페이지 및 갯수 조회해야함
		 */

		NoticeDTO pnDTO = new NoticeDTO();
		pnDTO.setNstartNum((NPgNum - 1) * 10 + 1);
		pnDTO.setNendNum(NPgNum * 10);
		QnADTO pDTO = new QnADTO();
		pDTO.setStartNum((PgNum - 1) * 10 + 1);
		pDTO.setEndNum(PgNum * 10);
		Map<String, Object> listMap = qnaService.getAllList();
		Map<String, Object> emap = eventService.eventRegForm();
		List<NoticeDTO> nlist = (List<NoticeDTO>) emap.get("nlist");
		List<QnADTO> qlist = (List<QnADTO>) emap.get("qlist");
		List<EventDTO> elist = (List<EventDTO>) emap.get("elist");
		if (nlist == null) {
			nlist = new ArrayList<NoticeDTO>();
		} else {
			for (int i = 0; i < nlist.size(); i++) {
				nlist.get(i).setNotice_uploadname(EncryptUtil.decAES128CBC(nlist.get(i).getNotice_uploadname()));
			}
		}
		if (qlist == null) {
			qlist = new ArrayList<QnADTO>();
		} else {
			for (int i = 0; i < qlist.size(); i++) {
				qlist.get(i).setQna_uploadname(EncryptUtil.decAES128CBC(qlist.get(i).getQna_uploadname()));
			}
		}
		if (elist == null) {
			elist = new ArrayList<EventDTO>();
		} else {
			for (int i = 0; i < elist.size(); i++) {
				elist.get(i).setEvent_uploadname(EncryptUtil.decAES128CBC(elist.get(i).getEvent_uploadname()));
			}
		}
		model.addAttribute("nlist", nlist);
		model.addAttribute("elist", elist);
		model.addAttribute("qlist", qlist);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);
		log.info(this.getClass().getName() + "qnareg end!");

		return "/notice/admincommunity";
	}

	@RequestMapping(value = "/QnA/QnAregproc", method = RequestMethod.POST)
	public String qnaRegProc(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session)
			throws Exception {
		log.info(this.getClass().getName() + "qnaregproc start!");
		// 공지사항 갯수 조회
		int NPgNum = 0;
		if (request.getParameter("NPgNum") == null) {
			NPgNum = 1;
		} else {
			NPgNum = Integer.parseInt(request.getParameter("NPgNum"));
		}
		// 전체 게시글 갯수 조회
		int Ntotal = noticeService.getNoticeTotal();

		// 체육시설 갯수 조회
		int FPgNum = 0;
		if (request.getParameter("FPgNum") == null) {
			FPgNum = 1;
		} else {
			FPgNum = Integer.parseInt(request.getParameter("FPgNum"));
		}
		// 전체 체육시설 갯수 조회
		int Ftotal = spofacService.getFacTotal();
		// 신고게시글 조회
		int PgNum = 0;
		if (request.getParameter("PgNum") == null) {
			PgNum = 1;
		} else {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
		}
		// 전체 신고게시글 갯수 조회
		int total = qnaService.getQnaTotal();

		/**
		 * 이곳에 예약 페이지 및 갯수 조회해야함
		 */

		NoticeDTO pnDTO = new NoticeDTO();
		pnDTO.setNstartNum((NPgNum - 1) * 10 + 1);
		pnDTO.setNendNum(NPgNum * 10);
		QnADTO pDTO = new QnADTO();
		pDTO.setStartNum((PgNum - 1) * 10 + 1);
		pDTO.setEndNum(PgNum * 10);
		String user_email = EncryptUtil.decAES128CBC((String) session.getAttribute("SS_USER_EMAIL"));
		log.info("user_email : " + user_email);
		String title = CmmUtil.nvl(request.getParameter("title"));
		log.info("title : " + title);
		String content = CmmUtil.nvl(request.getParameter("content"));
		log.info("content : " + content);
		content = content.replaceAll("\r\n", "<br>");
		QnADTO qdto = new QnADTO();
		qdto.setQna_content(content);
		qdto.setQna_title(title);
		qdto.setQna_uploadname(user_email);

		Map<String, Object> qmap = qnaService.insertQnA(qdto);

		List<NoticeDTO> nlist = (List<NoticeDTO>) qmap.get("nlist");
		List<EventDTO> elist = (List<EventDTO>) qmap.get("elist");
		List<QnADTO> qlist = (List<QnADTO>) qmap.get("qlist");
		if (nlist == null) {
			nlist = new ArrayList<NoticeDTO>();
		}
		if (elist == null) {
			elist = new ArrayList<EventDTO>();
		}
		if (qlist == null) {
			qlist = new ArrayList<QnADTO>();
		}

		model.addAttribute("elist", elist);
		model.addAttribute("nlist", nlist);
		model.addAttribute("qlist", qlist);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);
		log.info(this.getClass().getName() + "qnaregproc end!");
		return "/notice/admincommunity";
	}

	@RequestMapping("/QnA/QnADetail")
	public String qnADetail(HttpServletResponse response, HttpServletRequest request, Model model, HttpSession session)
			throws Exception {
		// 공지사항 갯수 조회
		int NPgNum = 0;
		if (request.getParameter("NPgNum") == null) {
			NPgNum = 1;
		} else {
			NPgNum = Integer.parseInt(request.getParameter("NPgNum"));
		}
		// 전체 게시글 갯수 조회
		int Ntotal = noticeService.getNoticeTotal();

		// 체육시설 갯수 조회
		int FPgNum = 0;
		if (request.getParameter("FPgNum") == null) {
			FPgNum = 1;
		} else {
			FPgNum = Integer.parseInt(request.getParameter("FPgNum"));
		}
		// 전체 체육시설 갯수 조회
		int Ftotal = spofacService.getFacTotal();
		// 신고게시글 조회
		int PgNum = 0;
		if (request.getParameter("PgNum") == null) {
			PgNum = 1;
		} else {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
		}
		// 전체 신고게시글 갯수 조회
		int total = qnaService.getQnaTotal();

		/**
		 * 이곳에 예약 페이지 및 갯수 조회해야함
		 */

		NoticeDTO pnDTO = new NoticeDTO();
		pnDTO.setNstartNum((NPgNum - 1) * 10 + 1);
		pnDTO.setNendNum(NPgNum * 10);
		QnADTO pDTO = new QnADTO();
		pDTO.setStartNum((PgNum - 1) * 10 + 1);
		pDTO.setEndNum(PgNum * 10);
		String qseq = CmmUtil.nvl(request.getParameter("qseq"));
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);
		Map<String, Object> qmap = qnaService.getQnADetail(qdto);
		List<NoticeDTO> nlist = (List<NoticeDTO>) qmap.get("nlist");
		List<EventDTO> elist = (List<EventDTO>) qmap.get("elist");
		qdto = (QnADTO) qmap.get("qnadetail");

		if (nlist == null) {
			nlist = new ArrayList<NoticeDTO>();
		}

		if (elist == null) {
			elist = new ArrayList<EventDTO>();
		}

		model.addAttribute("nlist", nlist);
		model.addAttribute("elist", elist);
		model.addAttribute("Ntotal", Ntotal);
		model.addAttribute("NPgNum", NPgNum);
		model.addAttribute("Ftotal", Ftotal);
		model.addAttribute("FPgNum", FPgNum);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);
		model.addAttribute("qnadetail", qdto);

		return "/notice/admincommunity";
	}

	@RequestMapping("/QnA/qnadelete")
	public String qnaDelete(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session)
			throws Exception {
		// 공지사항 갯수 조회
		int NPgNum = 0;
		if (request.getParameter("NPgNum") == null) {
			NPgNum = 1;
		} else {
			NPgNum = Integer.parseInt(request.getParameter("NPgNum"));
		}
		// 전체 게시글 갯수 조회
		int Ntotal = noticeService.getNoticeTotal();

		// 체육시설 갯수 조회
		int FPgNum = 0;
		if (request.getParameter("FPgNum") == null) {
			FPgNum = 1;
		} else {
			FPgNum = Integer.parseInt(request.getParameter("FPgNum"));
		}
		// 전체 체육시설 갯수 조회
		int Ftotal = spofacService.getFacTotal();
		// 신고게시글 조회
		int PgNum = 0;
		if (request.getParameter("PgNum") == null) {
			PgNum = 1;
		} else {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
		}
		// 전체 신고게시글 갯수 조회
		int total = qnaService.getQnaTotal();

		/**
		 * 이곳에 예약 페이지 및 갯수 조회해야함
		 */

		NoticeDTO pnDTO = new NoticeDTO();
		pnDTO.setNstartNum((NPgNum - 1) * 10 + 1);
		pnDTO.setNendNum(NPgNum * 10);
		QnADTO pDTO = new QnADTO();
		pDTO.setStartNum((PgNum - 1) * 10 + 1);
		pDTO.setEndNum(PgNum * 10);
		String qseq = CmmUtil.nvl(request.getParameter("qseq"));
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);
		Map<String, Object> qmap = qnaService.deleteQnA(qdto);
		List<NoticeDTO> nlist = (List<NoticeDTO>) qmap.get("nlist");
		List<EventDTO> elist = (List<EventDTO>) qmap.get("elist");
		List<QnADTO> qlist = (List<QnADTO>) qmap.get("qlist");
		if (nlist == null) {
			nlist = new ArrayList<NoticeDTO>();
		}
		if (elist == null) {
			elist = new ArrayList<EventDTO>();
		}
		if (qlist == null) {
			qlist = new ArrayList<QnADTO>();
		}

		model.addAttribute("nlist", nlist);
		model.addAttribute("qlist", qlist);
		model.addAttribute("elist", elist);
		model.addAttribute("Ntotal", Ntotal);
		model.addAttribute("NPgNum", NPgNum);
		model.addAttribute("Ftotal", Ftotal);
		model.addAttribute("FPgNum", FPgNum);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);

		return "/notice/admincommunity";
	}

	@RequestMapping("/QnA/qnaupdateform")
	public String qnAUpdateForm(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {

		String qseq = request.getParameter("qseq");
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);
		// 공지사항 갯수 조회
		int NPgNum = 0;
		if (request.getParameter("NPgNum") == null) {
			NPgNum = 1;
		} else {
			NPgNum = Integer.parseInt(request.getParameter("NPgNum"));
		}
		// 전체 게시글 갯수 조회
		int Ntotal = noticeService.getNoticeTotal();

		// 체육시설 갯수 조회
		int FPgNum = 0;
		if (request.getParameter("FPgNum") == null) {
			FPgNum = 1;
		} else {
			FPgNum = Integer.parseInt(request.getParameter("FPgNum"));
		}
		// 전체 체육시설 갯수 조회
		int Ftotal = spofacService.getFacTotal();
		// 신고게시글 조회
		int PgNum = 0;
		if (request.getParameter("PgNum") == null) {
			PgNum = 1;
		} else {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
		}
		// 전체 신고게시글 갯수 조회
		int total = qnaService.getQnaTotal();
		// 댓글 조회
		int CPgNum = 0;
		if (request.getParameter("CPgNum") == null) {
			CPgNum = 1;
		} else {
			CPgNum = Integer.parseInt(request.getParameter("CPgNum"));
		}
		// 전체 신고게시글 갯수 조회
		int Ctotal = commentService.getCommentTotal(qseq);
		/**
		 * 이곳에 예약 페이지 및 갯수 조회해야함
		 */

		NoticeDTO pnDTO = new NoticeDTO();
		pnDTO.setNstartNum((NPgNum - 1) * 10 + 1);
		pnDTO.setNendNum(NPgNum * 10);
		QnADTO pDTO = new QnADTO();
		pDTO.setStartNum((PgNum - 1) * 10 + 1);
		pDTO.setEndNum(PgNum * 10);

		Map<String, Object> qmap = qnaService.qnAUpdateForm(qdto);
		List<NoticeDTO> nlist = (List<NoticeDTO>) qmap.get("nlist");
		List<EventDTO> elist = (List<EventDTO>) qmap.get("elist");
		qdto = (QnADTO) qmap.get("qnaupdateform");
		qdto.setQna_content(qdto.getQna_content().replaceAll("<br>", "\r\n"));
		if (nlist == null) {
			nlist = new ArrayList<NoticeDTO>();
		}
		if (elist == null) {
			elist = new ArrayList<EventDTO>();
		}

		model.addAttribute("nlist", nlist);
		model.addAttribute("elist", elist);
		model.addAttribute("Ntotal", Ntotal);
		model.addAttribute("NPgNum", NPgNum);
		model.addAttribute("Ftotal", Ftotal);
		model.addAttribute("FPgNum", FPgNum);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);
		model.addAttribute("qnaupdateform", qdto);
		return "/notice/admincommunity";
	}

	@RequestMapping(value = "/QnA/QnAUpdateProc", method = RequestMethod.POST)
	public String qnAUpdateProc(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {
		// 공지사항 갯수 조회
		int NPgNum = 0;
		if (request.getParameter("NPgNum") == null) {
			NPgNum = 1;
		} else {
			NPgNum = Integer.parseInt(request.getParameter("NPgNum"));
		}
		// 전체 게시글 갯수 조회
		int Ntotal = noticeService.getNoticeTotal();

		// 체육시설 갯수 조회
		int FPgNum = 0;
		if (request.getParameter("FPgNum") == null) {
			FPgNum = 1;
		} else {
			FPgNum = Integer.parseInt(request.getParameter("FPgNum"));
		}
		// 전체 체육시설 갯수 조회
		int Ftotal = spofacService.getFacTotal();
		// 신고게시글 조회
		int PgNum = 0;
		if (request.getParameter("PgNum") == null) {
			PgNum = 1;
		} else {
			PgNum = Integer.parseInt(request.getParameter("PgNum"));
		}
		// 전체 신고게시글 갯수 조회
		int total = qnaService.getQnaTotal();

		/**
		 * 이곳에 예약 페이지 및 갯수 조회해야함
		 */

		NoticeDTO pnDTO = new NoticeDTO();
		pnDTO.setNstartNum((NPgNum - 1) * 10 + 1);
		pnDTO.setNendNum(NPgNum * 10);
		QnADTO pDTO = new QnADTO();
		pDTO.setStartNum((PgNum - 1) * 10 + 1);
		pDTO.setEndNum(PgNum * 10);
		String qseq = CmmUtil.nvl(request.getParameter("qseq"));
		QnADTO qdto = new QnADTO();
		qdto.setQna_seq(qseq);
		String title = CmmUtil.nvl(request.getParameter("title"));
		log.info("title : " + title);
		String content = CmmUtil.nvl(request.getParameter("content"));
		log.info("content : " + content);
		content = content.replaceAll("\r\n", "<br>");
		qdto.setQna_title(title);
		qdto.setQna_content(content);
		Map<String, Object> qmap = qnaService.updateQnA(qdto);
		List<NoticeDTO> nlist = (List<NoticeDTO>) qmap.get("nlist");
		List<EventDTO> elist = (List<EventDTO>) qmap.get("elist");
		List<QnADTO> qlist = (List<QnADTO>) qmap.get("qlist");
		if (nlist == null) {
			nlist = new ArrayList<NoticeDTO>();
		}
		if (elist == null) {
			elist = new ArrayList<EventDTO>();
		}
		if (qlist == null) {
			qlist = new ArrayList<QnADTO>();
		}
		model.addAttribute("nlist", nlist);
		model.addAttribute("elist", elist);
		model.addAttribute("qlist", qlist);
		model.addAttribute("Ntotal", Ntotal);
		model.addAttribute("NPgNum", NPgNum);
		model.addAttribute("Ftotal", Ftotal);
		model.addAttribute("FPgNum", FPgNum);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);
		return "/notice/admincommunity";
	}
}
