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
import poly.service.IEventService;
import poly.service.INoticeService;
import poly.service.IQnAService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

@Controller
public class EventController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "EventService")
	private IEventService eventService;
	
	@RequestMapping("/event/eventregform")
	public String eventRegForm(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception{
		log.info(this.getClass().getName() + "eventregform start!");
		Map<String, Object> emap = eventService.eventRegForm();
		List<NoticeDTO> nlist = (List<NoticeDTO>)emap.get("nlist");
		List<QnADTO> qlist= (List<QnADTO>)emap.get("qlist"); 
		if(nlist == null){
			nlist = new ArrayList<NoticeDTO>();
		}else {
			for(int i=0;i<nlist.size();i++) {
				nlist.get(i).setNotice_uploadname(EncryptUtil.decAES128CBC(nlist.get(i).getNotice_uploadname()));
			}
		}
		if(qlist == null){
			qlist = new ArrayList<QnADTO>();
		}else {
			for(int i=0;i<qlist.size();i++) {
				qlist.get(i).setQna_uploadname(EncryptUtil.decAES128CBC(qlist.get(i).getQna_uploadname()));
			}
		}
		model.addAttribute("nlist", nlist);
		model.addAttribute("qlist", qlist);
		model.addAttribute("eventform", "eventform");
		
		log.info(this.getClass().getName() + "eventregform end!");
		
		return "/notice/admincommunity";
	}
	
	@RequestMapping("/event/eventdetail")
	public String eventDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception{
		log.info(this.getClass().getName() + "eventdetail start!");
		String eseq = CmmUtil.nvl(request.getParameter("eseq"));
		
		EventDTO edto = new EventDTO();
		edto.setEvent_seq(eseq);
		Map<String, Object> emap = eventService.getEventDetail(edto);
		
		List<NoticeDTO> nlist = (List<NoticeDTO>)emap.get("nlist");
		List<QnADTO> qlist= (List<QnADTO>)emap.get("qlist"); 
		if(nlist == null){
			nlist = new ArrayList<NoticeDTO>();
		}
		if(qlist == null){
			qlist = new ArrayList<QnADTO>();
		}
		
		model.addAttribute("eventdetail", (EventDTO)emap.get("edto"));
		model.addAttribute("nlist", nlist);
		model.addAttribute("qlist", qlist);
		
		log.info(this.getClass().getName() + "eventdetail end!");
		
		
		return "/notice/admincommunity";
	}
	
	@RequestMapping(value="/event/eventregproc", method=RequestMethod.POST)
	public String eventRegProc(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception{
		log.info(this.getClass().getName() + "eventregproc start!");
		String user_email = EncryptUtil.decAES128CBC((String)session.getAttribute("SS_USER_EMAIL"));
		String title = CmmUtil.nvl(request.getParameter("title"));
		String content = CmmUtil.nvl(request.getParameter("content"));
		log.info("user_email: " + user_email);
		log.info("title : " + title);
		log.info("content : " + content);
		content = content.replaceAll("\r\n", "<br>");
		
		EventDTO edto = new EventDTO();
		edto.setEvent_title(title);
		edto.setEvent_uploadname(user_email);
		edto.setEvent_content(content);
		
		Map<String, Object> emap = eventService.insertEvent(edto);
		
		List<NoticeDTO> nlist = (List<NoticeDTO>)emap.get("nlist");
		List<QnADTO> qlist= (List<QnADTO>)emap.get("qlist");
		List<EventDTO> elist = (List<EventDTO>)emap.get("elist");
		if(qlist == null){
			qlist = new ArrayList<QnADTO>();
		}
		if(nlist == null){
			nlist = new ArrayList<NoticeDTO>();
		}
		if(elist == null){
			elist = new ArrayList<EventDTO>();
		}
		
		model.addAttribute("elist", elist);
		model.addAttribute("nlist", nlist);
		model.addAttribute("qlist", qlist);
		log.info(this.getClass().getName() + "eventregproc end!");
		
		return "/notice/admincommunity";
	}
	
	@RequestMapping(value="/event/updateeventform", method=RequestMethod.POST)
	public String updateEvent(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + " updateeventform start!");
		String eseq = CmmUtil.nvl(request.getParameter("eseq"));
		log.info("eseq : "+ eseq);
		EventDTO edto = new EventDTO();
		edto.setEvent_seq(eseq);
		Map<String, Object> emap = eventService.getEventDetail(edto);
		edto = (EventDTO)emap.get("edto");
		edto.setEvent_content(edto.getEvent_content().replaceAll("<br>", "\r\n"));
		model.addAttribute("upeventform", (EventDTO)emap.get("edto"));
		List<NoticeDTO> nlist = (List<NoticeDTO>)emap.get("nlist");
		List<QnADTO> qlist= (List<QnADTO>)emap.get("qlist");
		if(nlist == null){
			nlist = new ArrayList<NoticeDTO>();
		}
		if(qlist == null){
			qlist = new ArrayList<QnADTO>();
		}
		model.addAttribute("nlist", nlist);
		model.addAttribute("qlist", qlist);
		log.info(this.getClass().getName() + "updateeventform start!");
		
		return "/notice/admincommunity";
	}
	
	@RequestMapping(value="/event/updateeventproc", method=RequestMethod.POST)
	public String updateEventProc(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception{
		log.info(this.getClass().getName() + " updateeventproc start!");
		
		String eseq = CmmUtil.nvl(request.getParameter("eseq"));
		log.info("eseq : " + eseq);
		String user_email = CmmUtil.nvl((String)session.getAttribute("SS_USER_EMAIL"));
		log.info("user_email : " + user_email);
		String title = CmmUtil.nvl(request.getParameter("title"));
		log.info("title : " + title);
		String content = CmmUtil.nvl(request.getParameter("content"));
		log.info("content : " + content);
		content = content.replaceAll("\r\n", "<br>");
	
		EventDTO edto = new EventDTO();
		edto.setEvent_seq(eseq);
		edto.setEvent_title(title);
		edto.setEvent_content(content);
		edto.setEvent_uploadname(user_email);
		
		Map<String, Object> emap = eventService.updateEvent(edto);
		List<NoticeDTO> nlist = (List<NoticeDTO>)emap.get("nlist");
		List<QnADTO> qlist= (List<QnADTO>)emap.get("qlist");
		List<EventDTO> elist = (List<EventDTO>)emap.get("elist");
		if(qlist == null){
			qlist = new ArrayList<QnADTO>();
		}
		if(nlist == null){
			nlist = new ArrayList<NoticeDTO>();
		}
		if(elist == null){
			elist = new ArrayList<EventDTO>();
		}
		
		model.addAttribute("elist", elist);
		model.addAttribute("nlist", nlist);
		model.addAttribute("qlist", qlist);
		log.info(this.getClass().getName() + " updateeventproc end!");
		
		return "/notice/admincommunity";
	}
	
	@RequestMapping("/event/deleteevent")
	public String deleteEvent(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception{
		
		log.info(this.getClass().getName() + " deleteevent end!");
		String eseq = CmmUtil.nvl(request.getParameter("eseq"));
		log.info("eseq: " + eseq);
		EventDTO edto = new EventDTO();
		edto.setEvent_seq(eseq);
		Map<String, Object> emap = eventService.deleteEvetn(edto);
		List<NoticeDTO> nlist = (List<NoticeDTO>)emap.get("nlist");
		List<QnADTO> qlist= (List<QnADTO>)emap.get("qlist");
		List<EventDTO> elist = (List<EventDTO>)emap.get("elist");
		if(qlist == null){
			qlist = new ArrayList<QnADTO>();
		}
		if(nlist == null){
			nlist = new ArrayList<NoticeDTO>();
		}
		if(elist == null){
			elist = new ArrayList<EventDTO>();
		}
		
		model.addAttribute("elist", elist);
		model.addAttribute("nlist", nlist);
		model.addAttribute("qlist", qlist);
		
		
		
		log.info(this.getClass().getName() + " deleteevent end!");
		return "/notice/admincommunity";
	}
	
}
