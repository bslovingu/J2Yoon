package poly.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.ReservDetailDTO;
import poly.dto.ReservationDTO;
import poly.dto.SPOFACDTO;
import poly.service.IReservDetailService;
import poly.service.IReservationService;
import poly.service.ISpofacService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

@Controller
public class UserReservationController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "ReservationService")
	private IReservationService reservationService;

	@Resource(name = "ReservDetailService")
	private IReservDetailService reservdetailService;

	@Resource(name = "SpofacService")
	private ISpofacService spofacService;

	// 참여인원수 쿼리
	@RequestMapping("userreservation/userreservationlist")
	public String userReservationList(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".userReservationList start!");
		String fseq = CmmUtil.nvl((String) request.getParameter("fseq"));
		String user_email = CmmUtil.nvl((String) session.getAttribute("SS_USER_EMAIL"));
		log.info(user_email);
		ReservationDTO rDTO = new ReservationDTO();

		rDTO.setFac_seq(fseq);

		List<ReservationDTO> rlist = reservationService.getAllReservation(rDTO);

		if (rlist == null) {
			rlist = new ArrayList<ReservationDTO>();
		} else {
			for (int i = 0; i < rlist.size(); i++) {
				rlist.get(i).setReserv_uploadname(EncryptUtil.decAES128CBC(rlist.get(i).getReserv_uploadname()));
				rlist.get(i).setFlag("0");
				int res = reservdetailService.getReservMemberTotal(rlist.get(i).getReserv_seq());
				if (res > 0) {
					List<ReservDetailDTO> relist = reservdetailService.getReservList(rlist.get(i).getReserv_seq());
					for (int k = 0; k < relist.size(); k++) {
						log.info(k + "번" + relist.get(k).getReserv_member());
						if (relist.get(k).getReserv_member().equals(user_email)) {
							rlist.get(i).setFlag("1");
						}
					}
				}
				rlist.get(i).setReserv_member(res);
			}
		}

		model.addAttribute("rlist", rlist);
		model.addAttribute("fseq", fseq);

		return "/user/userreservation";

	}

	@RequestMapping("userreservation/userreservationreg")
	public String userreservationreg(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		log.info(this.getClass().getName() + ".userReservationList start!");
		String fseq = CmmUtil.nvl((String) request.getParameter("fseq"));

		SPOFACDTO fDTO = new SPOFACDTO();
		fDTO = spofacService.getSpofacInfo(fseq);
		if (fDTO == null) {
			fDTO = new SPOFACDTO();
		}

		model.addAttribute("fseq", fseq);
		model.addAttribute("fDTO", fDTO);

		return "/user/userreservationregform";

	}

	// 등록자는 자동적으로 예약이 돼야함
	@RequestMapping("userreservation/userreservationregproc")
	public String userreservationregproc(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".userreservationregproc start!");
		String fseq = CmmUtil.nvl((String) request.getParameter("fseq"));
		String stime = CmmUtil.nvl((String) request.getParameter("stime"));
		String usetime = CmmUtil.nvl((String) request.getParameter("usetime"));
		String maxmember = CmmUtil.nvl((String) request.getParameter("maxmember"));
		String reserv_uploadname = CmmUtil.nvl((String) session.getAttribute("SS_USER_EMAIL"));
		
		
		
		if (reserv_uploadname.equals("")) {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
			model.addAttribute("url", "/index.do");
			return "/redirect";
		}

		int etime = 0;
		if (!stime.equals("") && !usetime.equals("")) {
			etime = Integer.parseInt(stime) + Integer.parseInt(usetime);
		}
		if (etime == 0) {
			model.addAttribute("msg", "오류가 발생하였습니다. 다시 시도해 주세요.");
			model.addAttribute("url", "/userreservation/userreservationreg.do?fseq=" + fseq);
			return "/redirect";
		}
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yy-MM-dd");
		Date time = new Date();				
		String time1 = format1.format(time);
		
		ReservationDTO rDTO = new ReservationDTO();

		rDTO.setFac_seq(fseq);
		rDTO.setDate(time1);
		int st = Integer.parseInt(stime);
		int et = st + Integer.parseInt(usetime);
		

		List<ReservationDTO> rlist = reservationService.getTodayReservInfo(rDTO);
		if (rlist == null) {
			rlist = new ArrayList<ReservationDTO>();
		} else {
			for (int i = 0; i < rlist.size(); i++) {
				int st2 = Integer.parseInt(rlist.get(i).getStime().substring(9, 11));
				int et2 = Integer.parseInt(rlist.get(i).getEtime().substring(9, 11));
				if (st == st2) {
					model.addAttribute("msg", "예약하실 수 없는 시간입니다.");
					model.addAttribute("url", "/userreservation/userreservationreg.do?fseq=" + fseq);
					return "/redirect";
				}
				if (st> st2&&st<et2) {
					model.addAttribute("msg", "예약하실 수 없는 시간입니다.");
					model.addAttribute("url", "/userreservation/userreservationreg.do?fseq=" + fseq);
					return "/redirect";
				}
				if(et==et2) {
					model.addAttribute("msg", "예약하실 수 없는 시간입니다.");
					model.addAttribute("url", "/userreservation/userreservationreg.do?fseq=" + fseq);
					return "/redirect";
				}
				if(et>st2&&et<et2) {
					model.addAttribute("msg", "예약하실 수 없는 시간입니다.");
					model.addAttribute("url", "/userreservation/userreservationreg.do?fseq=" + fseq);
					return "/redirect";
				}
			}
		}
		if (stime.length() == 1) {
			stime = time1+" 0" + stime + ":00";
		} else {
			stime = time1+" "+stime + ":00";
		}
		rDTO.setMax_member(maxmember);
		rDTO.setStime(stime);
		if (etime < 10) {
			rDTO.setEtime(time1+" 0" + Integer.toString(etime) + ":00");
		} else {
			rDTO.setEtime(time1+" "+Integer.toString(etime) + ":00");
		}
		rDTO.setReserv_uploadname(reserv_uploadname);

		int res = reservationService.insertReservInfo(rDTO);
		if (res > 0) {
			String reserv_seq = reservationService.getReservationInfo();
			ReservDetailDTO rdDTO = new ReservDetailDTO();
			rdDTO.setReserv_seq(reserv_seq);
			rdDTO.setReserv_member(reserv_uploadname);
			res = reservdetailService.insertReservDetailInfo(rdDTO);
			model.addAttribute("msg", "예약 등록 되었습니다.");
			model.addAttribute("url", "/userreservation/userreservationlist.do?fseq=" + fseq);
		} else {
			model.addAttribute("msg", "예약 등록 실패하였습니다.");
			model.addAttribute("url", "/userreservation/userreservationlist.do?fseq=" + fseq);

		}

		return "/redirect";

	}

	@RequestMapping("userreservation/userreservationjoinproc")
	public String userreservationjoinproc(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".userReservationjoinproc start!");
		String fseq = CmmUtil.nvl((String) request.getParameter("fseq"));
		String reserv_seq = CmmUtil.nvl((String) request.getParameter("rseq"));
		String reserv_member = CmmUtil.nvl((String) session.getAttribute("SS_USER_EMAIL"));

		ReservDetailDTO rdDTO = new ReservDetailDTO();
		rdDTO.setReserv_seq(reserv_seq);
		rdDTO.setReserv_member(reserv_member);

		int res = reservdetailService.insertReservDetailInfo(rdDTO);

		model.addAttribute("msg", "참여 하였습니다.");
		model.addAttribute("url", "/userreservation/userreservationlist.do?fseq=" + fseq);

		return "/redirect";

	}

	@RequestMapping("userreservation/userreservationcancelproc")
	public String userreservationcancelproc(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".userReservationjoinproc start!");
		String fseq = CmmUtil.nvl((String) request.getParameter("fseq"));
		String reserv_seq = CmmUtil.nvl((String) request.getParameter("rseq"));
		String reserv_member = CmmUtil.nvl((String) session.getAttribute("SS_USER_EMAIL"));

		ReservDetailDTO rdDTO = new ReservDetailDTO();
		rdDTO.setReserv_seq(reserv_seq);
		rdDTO.setReserv_member(reserv_member);

		int res = reservdetailService.deleteReservDetailInfo(rdDTO);

		model.addAttribute("msg", "취소 하였습니다.");
		model.addAttribute("url", "/userreservation/userreservationlist.do?fseq=" + fseq);

		return "/redirect";

	}
}
