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

import poly.dto.EventDTO;
import poly.dto.SPOFACDTO;
import poly.service.IEventService;
import poly.service.ISpofacService;
import poly.util.CmmUtil;

@Controller
public class UserEventController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "EventService")
	private IEventService eventService;

	@Resource(name = "SpofacService")
	private ISpofacService spofacService;

	@RequestMapping("userevent/usereventlist")
	public String eventRegForm(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Model model) throws Exception {
		log.info(this.getClass().getName() + "usereventlist start!");
		String session_name = (String) session.getAttribute("SS_USER_NAME");

		if (session_name == null || session_name.equals("")) {

			log.info(this.getClass().getName() + "nousereventlist start!");
			log.info(this.getClass().getName() + "nousereventlist end!");

			return "/logout";
		} else {
			// 체육시설 갯수 조회
			int FPgNum = 0;
			if (request.getParameter("FPgNum") == null) {
				FPgNum = 1;
			} else {
				FPgNum = Integer.parseInt(request.getParameter("FPgNum"));
			}

			// 전체 체육시설 갯수 조회
			int Ftotal = spofacService.getFacTotal();
			if (FPgNum > ((Ftotal - 1) / 10) + 1) {
				FPgNum = 1;
			}
			log.info(this.getClass().getName() + "usereventlist start!");
			int startNum = ((FPgNum - 1) * 10) + 1;
			int endNum = FPgNum * 10;

			List<SPOFACDTO> elist = spofacService.getFacilityList(startNum, endNum);
			if (elist == null) {
				elist = new ArrayList<SPOFACDTO>();
			}

			model.addAttribute("elist", elist);
			model.addAttribute("FPgNum", FPgNum);
			model.addAttribute("Ftotal", Ftotal);

			log.info(this.getClass().getName() + "usereventlist end!");

			return "/user/usereventlist";

		}
	}

	@RequestMapping("userevent/usereventSearch")
	public String usereventSearch(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Model model) throws Exception {
		log.info(this.getClass().getName() + "usereventlist start!");
		String session_name = (String) session.getAttribute("SS_USER_NAME");

		if (session_name == null || session_name.equals("")) {

			log.info(this.getClass().getName() + "nousereventlist start!");
			log.info(this.getClass().getName() + "nousereventlist end!");

			return "/logout";
		} else {
			String gu = CmmUtil.nvl(request.getParameter("gu"));
			String type = CmmUtil.nvl(request.getParameter("type"));
			log.info(gu);
			log.info(type);
			int FPgNum = 0;
			if (request.getParameter("FPgNum") == null) {
				FPgNum = 1;
			} else {
				FPgNum = Integer.parseInt(request.getParameter("FPgNum"));
			}
			log.info(FPgNum);

			log.info(this.getClass().getName() + "usereventlist start!");
			int startNum = ((FPgNum - 1) * 10) + 1;
			int endNum = FPgNum * 10;
			SPOFACDTO pDTO = new SPOFACDTO();
			pDTO.setGu(gu);
			pDTO.setType(type);
			pDTO.setStartNum(startNum);
			pDTO.setEndNum(endNum);
			// 전체 체육시설 갯수 조회
			int Ftotal = spofacService.getFacCount(pDTO);
			log.info(Ftotal);
			if (FPgNum > ((Ftotal - 1) / 10) + 1) {
				FPgNum = 1;
			}
			List<SPOFACDTO> elist = spofacService.getFacilitySearchList(pDTO);
			if (elist == null) {
				elist = new ArrayList<SPOFACDTO>();
			}

			model.addAttribute("elist", elist);
			model.addAttribute("FPgNum", FPgNum);
			model.addAttribute("Ftotal", Ftotal);
			model.addAttribute("gu", gu);
			model.addAttribute("type", type);
			log.info(this.getClass().getName() + "usereventlist end!");

			return "/user/usereventSearch";

		}
	}

	@RequestMapping("/userevent/usereventdetail")
	public String eventDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Model model) throws Exception {
		String session_name = (String) session.getAttribute("SS_USER_NAME");
		log.info(this.getClass().getName() + "usereventdetail start!");

		if (session_name == null || session_name.equals("")) {

			log.info(this.getClass().getName() + "nousereventdetail start!");
			log.info(this.getClass().getName() + "nousereventdetail end!");

			return "/logout";
		} else {

			log.info(this.getClass().getName() + "usereventdetail start!");
			String eseq = request.getParameter("eseq");

			EventDTO edto = new EventDTO();
			edto.setEvent_seq(eseq);
			Map<String, Object> emap = eventService.getEventDetail(edto);

			model.addAttribute("eventdetail", (EventDTO) emap.get("edto"));

			log.info(this.getClass().getName() + "usereventdetail end!");

			return "/user/usereventdetail";
		}
	}

}
