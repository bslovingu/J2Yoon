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
import org.springframework.ui.ModelMap;
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
import poly.util.FilterUtil;

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

	@RequestMapping(value="admin/NoticeReg")
	public String ANoticeReg(HttpServletRequest request, ModelMap model) throws Exception{
		return "/admin/notice/NoticeReg";
	}
	@RequestMapping(value="admin/NoticeModify")
	public String ANoticeModify(HttpServletRequest request, ModelMap model) throws Exception{
		String nseq = request.getParameter("nseq");
		NoticeDTO ndto = new NoticeDTO();
		ndto.setNotice_seq(nseq);
		Map<String, Object> nmap = noticeService.getNoticeDetail(ndto);
		FilterUtil.NoticeFilter((NoticeDTO)nmap.get("ndetail"));
		ndto = (NoticeDTO) nmap.get("ndetail");
		model.addAttribute("updateform", ndto);
		return "/admin/notice/NoticeModify";
	}
	@RequestMapping(value="admin/NoticeDetail")
	public String ANoticeDetail(HttpServletRequest request, ModelMap model) throws Exception{
		String nseq = request.getParameter("nseq");
		NoticeDTO ndto = new NoticeDTO();
		ndto.setNotice_seq(nseq);
		Map<String, Object> nmap = noticeService.getNoticeDetail(ndto);
		FilterUtil.NoticeFilter((NoticeDTO)nmap.get("ndetail"));
		model.addAttribute("ndetail", (NoticeDTO) nmap.get("ndetail"));
		return "/admin/notice/NoticeDetail";
	}
	@RequestMapping(value="admin/NoticeList")
	public String ANoticeList(HttpServletRequest request, ModelMap model) throws Exception{
		log.info(this.getClass().getName()+".adminnotice start!");

		int NPgNum = 0;
		if (request.getParameter("NPgNum") == null) {
			NPgNum = 1;
		} else {
			NPgNum = Integer.parseInt(request.getParameter("NPgNum"));
		}
		// 전체 게시글 갯수 조회
		int Ntotal = noticeService.getNoticeTotal();
		
		NoticeDTO pnDTO = new NoticeDTO();
		pnDTO.setNstartNum((NPgNum - 1) * 10 + 1);
		pnDTO.setNendNum(NPgNum * 10);
		
		List<NoticeDTO> nList=new ArrayList<NoticeDTO>();
		nList = noticeService.getNoticeList(pnDTO);
		if (nList == null) {
			nList = new ArrayList<NoticeDTO>();
		} else {
			for (int i = 0; i < nList.size(); i++) {
				nList.get(i).setNotice_uploadname(EncryptUtil.decAES128CBC(nList.get(i).getNotice_uploadname()));
				FilterUtil.NoticeFilter(nList.get(i));
			}
		}
		model.addAttribute("nlist",nList);
		model.addAttribute("Ntotal", Ntotal);
		model.addAttribute("NPgNum", NPgNum);
		return "/admin/notice/NoticeList";
	}
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

			return "/admin/notice/NoticeList";
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

		return "/admin/notice/NoticeList";
	}

	@RequestMapping(value = "/admin/NoticeRegProc")
	public String NoticeRegProc(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		log.info(this.getClass().getName() + "noticereg start!");

		String uploadname = (String) request.getSession().getAttribute("SS_USER_EMAIL");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		log.info("uploadname" + uploadname);
		log.info("title" + title);
		log.info("content" + content);
		content = content.replaceAll("\r\n", "<br>");
		NoticeDTO ndto = new NoticeDTO(title, uploadname, content);
		Map<String, Object> nmap = noticeService.insertNotice(ndto);
		model.addAttribute("msg","공지사항이 등록되었습니다.");
		model.addAttribute("url","/admin/NoticeList.do");
		log.info(this.getClass().getName() + "noticereg end!");
		return "/redirect";
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

		return "/admin/notice/NoticeList";
	}

	@RequestMapping(value = "/notice/updatenoticedetail")
	public String updateNoticeDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		log.info(this.getClass().getName() + "updatenoticedetail start!");
		String nseq = request.getParameter("nseq");
		log.info("nseq : " + nseq);
		NoticeDTO ndto = new NoticeDTO();
		ndto.setNotice_seq(nseq);
	

		String content = request.getParameter("content");
		log.info("content : " + content);
		content = content.replaceAll("\r\n", "<br>");
		String title = request.getParameter("title");
		ndto.setNotice_content(content);
		ndto.setNotice_title(title);

		Map<String, Object> nmap = noticeService.updateNoticeDetail(ndto);

		model.addAttribute("msg", "공지사항이 수정되었습니다.");
		model.addAttribute("url", "/admin/NoticeList.do");
		
		log.info(this.getClass().getName() + "updatenoticedetail start!");
		return "/redirect";
	}

	@RequestMapping("/notice/deletenotice")
	public String deleteNotice(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		log.info(this.getClass().getName() + " deleteNotice start!");
		
		String nseq = request.getParameter("nseq");
		NoticeDTO ndto = new NoticeDTO();
		ndto.setNotice_seq(nseq);

		Map<String, Object> nmap = noticeService.deleteNotice(ndto);
		model.addAttribute("msg","공지사항이 삭제되었습니다.");
		model.addAttribute("url","/admin/NoticeList.do");
		log.info(this.getClass().getName() + " deleteNotice end!");

		return "/redirect";
	}

}
