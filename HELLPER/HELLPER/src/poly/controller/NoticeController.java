package poly.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.EventDTO;
import poly.dto.NoticeDTO;
import poly.dto.QnADTO;
import poly.service.IEventService;
import poly.service.INoticeService;
import poly.service.IQnAService;
import poly.service.ISpofacService;
import poly.util.EncryptUtil;

@Controller
public class NoticeController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "NoticeService")
	private INoticeService noticeService;

	@Resource(name = "EventService")
	private IEventService eventService;

	@Resource(name = "SpofacService")
	private ISpofacService spofacService;

	@Resource(name = "QnAService")
	private IQnAService qnaService;

	@RequestMapping("/notice/admincommunity")
	public String community(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		log.info(this.getClass().getName() + "admincommunity start!");
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
		Map<String, Object> nmap = noticeService.getAllList();
		Map<String, Object> emap = eventService.eventRegForm();
		List<NoticeDTO> nlist = (List<NoticeDTO>) emap.get("nlist");
		List<QnADTO> qlist = (List<QnADTO>) emap.get("qlist");
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

		String flag = request.getParameter("flag");
		if (flag == null) {
			flag = "0";
		}
		log.info("flag : " + flag);
		if (flag.equals("1")) {
			model.addAttribute("elist", (List<EventDTO>) nmap.get("elist"));

			model.addAttribute("qlist", (List<QnADTO>) nmap.get("qlist"));

			return "/notice/admincommunity";
		}

		model.addAttribute("nlist", nlist);
		model.addAttribute("elist", (List<EventDTO>) nmap.get("elist"));
		model.addAttribute("qlist", qlist);
		model.addAttribute("Ntotal", Ntotal);
		model.addAttribute("NPgNum", NPgNum);
		model.addAttribute("Ftotal", Ftotal);
		model.addAttribute("FPgNum", FPgNum);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);

		log.info(this.getClass().getName() + "admincommuntiy end!");

		return "/notice/admincommunity";
	}

	@RequestMapping(value = "/notice/noticereg", method = RequestMethod.POST)
	public String noticeReg(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		log.info(this.getClass().getName() + "noticereg start!");

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
		String uploadname = (String) request.getSession().getAttribute("SS_USER_EMAIL");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		log.info("uploadname" + uploadname);
		log.info("title" + title);
		log.info("content" + content);
		content = content.replaceAll("\r\n", "<br>");
		NoticeDTO ndto = new NoticeDTO(title, uploadname, content);
		Map<String, Object> nmap = noticeService.insertNotice(ndto);

		List<NoticeDTO> nlist = noticeService.getAllNotice();
		if (nlist == null) {
			nlist = new ArrayList<NoticeDTO>();
		} else {
			for (int i = 0; i < nlist.size(); i++) {
				nlist.get(i).setNotice_uploadname(EncryptUtil.decAES128CBC(nlist.get(i).getNotice_uploadname()));
			}
		}
		model.addAttribute("nlist", nlist);
		model.addAttribute("elist", (List<EventDTO>) nmap.get("elist"));
		model.addAttribute("qlist", (List<QnADTO>) nmap.get("qlist"));
		model.addAttribute("Ntotal", Ntotal);
		model.addAttribute("NPgNum", NPgNum);
		model.addAttribute("Ftotal", Ftotal);
		model.addAttribute("FPgNum", FPgNum);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);
		log.info(this.getClass().getName() + "noticereg end!");
		return "/notice/admincommunity";
	}

	@RequestMapping("/notice/noticeredirect")
	public String noticeRedirect(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {

		log.info(this.getClass().getName() + "noticeredirect start!");

		log.info(this.getClass().getName() + "noticeredriect end!");
		return "/notice/noticeredirect";
	}

	@RequestMapping("/notice/noticedetail")
	public String getNoitceDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		log.info(this.getClass().getName() + "getnoticedetail start!");
		// 공지사항 갯수 조회
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
		String nseq = request.getParameter("nseq");
		NoticeDTO ndto = new NoticeDTO();
		ndto.setNotice_seq(nseq);

		Map<String, Object> nmap = noticeService.getNoticeDetail(ndto);

		model.addAttribute("elist", (List<EventDTO>) nmap.get("elist"));
		model.addAttribute("ndetail", (NoticeDTO) nmap.get("ndetail"));
		model.addAttribute("qlist", (List<QnADTO>) nmap.get("qlist"));
		model.addAttribute("Ntotal", Ntotal);
		model.addAttribute("NPgNum", NPgNum);
		model.addAttribute("Ftotal", Ftotal);
		model.addAttribute("FPgNum", FPgNum);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);
		log.info(this.getClass().getName() + "getnoticedetail end!");

		return "/notice/admincommunity";
	}

	@RequestMapping(value = "/notice/updatenoticedetail", method = RequestMethod.POST)
	public String updateNoticeDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		log.info(this.getClass().getName() + "updatenoticedetail start!");
		String nflag = request.getParameter("nflag");
		log.info("nflag : " + nflag);
		String nseq = request.getParameter("nseq");
		log.info("nseq : " + nseq);
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
		NoticeDTO ndto = new NoticeDTO();
		ndto.setNotice_seq(nseq);
		if (nflag != null) {

			Map<String, Object> nmap = noticeService.getNoticeDetail(ndto);

			List<EventDTO> elist = (List<EventDTO>) nmap.get("elist");
			List<QnADTO> qlist = (List<QnADTO>) nmap.get("qlist");
			if (elist == null) {
				elist = new ArrayList<EventDTO>();
			}
			if (qlist == null) {
				qlist = new ArrayList<QnADTO>();
			}
			ndto = (NoticeDTO) nmap.get("ndetail");
			ndto.setNotice_content(ndto.getNotice_content().replaceAll("<br>", "\r\n"));
			model.addAttribute("updateform", ndto);
			model.addAttribute("Ntotal", Ntotal);
			model.addAttribute("NPgNum", NPgNum);
			model.addAttribute("Ftotal", Ftotal);
			model.addAttribute("FPgNum", FPgNum);
			model.addAttribute("total", total);
			model.addAttribute("PgNum", PgNum);
			return "/notice/admincommunity";
		}

		String content = request.getParameter("content");
		log.info("content : " + content);
		content = content.replaceAll("\r\n", "<br>");
		String title = request.getParameter("title");
		ndto.setNotice_content(content);
		ndto.setNotice_title(title);

		Map<String, Object> nmap = noticeService.updateNoticeDetail(ndto);

		List<NoticeDTO> nlist = (List<NoticeDTO>) nmap.get("nlist");
		List<EventDTO> elist = (List<EventDTO>) nmap.get("elist");
		List<QnADTO> qlist = (List<QnADTO>) nmap.get("qlist");
		if (nlist == null) {
			nlist = new ArrayList<NoticeDTO>();
		} else {
			for (int i = 0; i < nlist.size(); i++) {
				nlist.get(i).setNotice_uploadname(EncryptUtil.decAES128CBC(nlist.get(i).getNotice_uploadname()));
			}
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
		model.addAttribute("Ntotal", Ntotal);
		model.addAttribute("NPgNum", NPgNum);
		model.addAttribute("Ftotal", Ftotal);
		model.addAttribute("FPgNum", FPgNum);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);
		
		log.info(this.getClass().getName() + "updatenoticedetail start!");
		return "/notice/admincommunity";
	}

	@RequestMapping("/notice/deletenotice")
	public String deleteNotice(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		log.info(this.getClass().getName() + " deleteNotice start!");
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
		String nseq = request.getParameter("nseq");
		NoticeDTO ndto = new NoticeDTO();
		ndto.setNotice_seq(nseq);

		Map<String, Object> nmap = noticeService.deleteNotice(ndto);

		List<NoticeDTO> nlist = (List<NoticeDTO>) nmap.get("nlist");
		List<EventDTO> elist = (List<EventDTO>) nmap.get("elist");
		List<QnADTO> qlist = (List<QnADTO>) nmap.get("qlist");
		if (nlist == null) {
			nlist = new ArrayList<NoticeDTO>();
		} else {
			for (int i = 0; i < nlist.size(); i++) {
				nlist.get(i).setNotice_uploadname(EncryptUtil.decAES128CBC(nlist.get(i).getNotice_uploadname()));
			}
		}

		model.addAttribute("nlist", nlist);
		model.addAttribute("Ntotal", Ntotal);
		model.addAttribute("NPgNum", NPgNum);
		model.addAttribute("Ftotal", Ftotal);
		model.addAttribute("FPgNum", FPgNum);
		model.addAttribute("total", total);
		model.addAttribute("PgNum", PgNum);

		log.info(this.getClass().getName() + " deleteNotice end!");

		return "/notice/admincommunity";
	}

}
