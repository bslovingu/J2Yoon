package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
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

import poly.dto.CountDTO;
import poly.dto.EventDTO;
import poly.dto.MemberDTO;
import poly.dto.ReservationDTO;
import poly.dto.SPOFACDTO;
import poly.service.IMemberService;
import poly.service.IReservDetailService;
import poly.service.IReservationService;
import poly.service.ISpofacService;
import poly.util.CmmUtil;
// import poly.service.ISpofacService;
import poly.util.EncryptUtil;

@Controller
public class UserMemberController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "MemberService")
	private IMemberService memberService;

	@Resource(name = "ReservationService")
	private IReservationService reservationService;

	@Resource(name = "ReservDetailService")
	private IReservDetailService reservdetailService;
	
	@Resource(name = "SpofacService")
	private ISpofacService spofacService;
	
	// 만들고있어요!!
	@RequestMapping(value = "user/usermain", method=RequestMethod.GET)
	public String regProc(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		
		List<EventDTO> sList = new ArrayList<EventDTO>();
		
		/*/ 시설 정보 받아오기
				sList = spofacService.getFacList();
				if(sList==null)
				{
					sList = new ArrayList<EventDTO>();
				}else {
					log.info(sList.get(1).getFac_name());
				}
			*/	
		model.addAttribute("sList",sList);
		CountDTO rDTO = new CountDTO();
		ChartCount(rDTO);
		TypeCount(rDTO);
		model.addAttribute("rDTO",rDTO);
		return "/user/usermain";
	}
	
	@RequestMapping(value="/usermember/getusermemberdetail")
	public String getMemberDetail(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		
		log.info(this.getClass().getName() + "getMemberdetail start!");
		Map<String, Object> mmap;
		String mem_seq = CmmUtil.nvl(request.getParameter("mem_seq"));
		System.out.println(CmmUtil.nvl(request.getParameter("mem_seq")));
		MemberDTO mdto = new MemberDTO();
		mdto.setMem_seq(mem_seq);
		
		mmap = memberService.getMemberDetail(mdto, (String) session.getAttribute("SS_MEM_SEQ"));

		if (mmap == null) {
			mmap = new HashMap<>();
		}
		
		mdto = (MemberDTO)mmap.get("mdto");
		mdto.setEmail(EncryptUtil.decAES128CBC(mdto.getEmail()));
		mdto.setPhone(EncryptUtil.decAES128CBC(mdto.getPhone()));
		

		
		model.addAttribute("memberdetail", mdto);
		
		
		log.info(this.getClass().getName() + "getMemberdetail end!");
		
		return "/user/usermemberdetail";
	}
	@RequestMapping(value="/usermember/userdeletemember")
	public String deleteMember(HttpSession session,  HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		
		log.info(this.getClass().getName() + "userdeletemember start!");
		
		String mem_seq = CmmUtil.nvl(request.getParameter("mem_seq"));
		MemberDTO mdto = new MemberDTO();
		mdto.setMem_seq(mem_seq);
		Map<String, Object> mmap = memberService.deleteMember(mdto, (String)session.getAttribute("SS_MEM_SEQ"));
		
		
		
		
		log.info(this.getClass().getName() + "userdeletemember end!");
		return "/logout";
	}
	
	
	@RequestMapping(value="/usermember/updateusermemberinfo", method=RequestMethod.POST)
	public String updateMemberInfo(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		
		log.info(this.getClass().getName() + "updateusermemberinfo start!");
		
		String mem_seq = CmmUtil.nvl(request.getParameter("mem_seq"));
		String phone = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("phone")));
		String password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("password")));
		String name = CmmUtil.nvl(request.getParameter("name"));
		String email = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("email")));
		
		log.info("name : "+ name);
		log.info("email : "+ email);
		log.info("password : "+ password);
		log.info("phone : "+ phone);
		log.info("mem_seq : " + mem_seq);
		
		MemberDTO mdto = new MemberDTO(name, email, password, phone);
		mdto.setMem_seq(mem_seq);
		
		memberService.updateUserMemberDetail(mdto);
		CountDTO rDTO = new CountDTO();
		ChartCount(rDTO);
		TypeCount(rDTO);
		model.addAttribute("rDTO",rDTO);
		if ("SS_USER_NAME" != mdto.getName()) {
			log.info(this.getClass().getName() + "updateusermemberinfosamename end");
			session.setAttribute("SS_USER_NAME", mdto.getName());
			return "/user/usermain";
		}

		else {
			log.info(this.getClass().getName() + "updateusermemberinfo end");
			return "/user/usermain";

		}
		
		
		
	}
	
	@RequestMapping("/usermember/userchpassword")
	public String userChPassword(HttpServletResponse response, HttpServletRequest request, Model model, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + ".userChPassword start");
		
		
		
		log.info(this.getClass().getName() + ".userChPassword end");
		return "/user/userchpassword";
	}
	
	@RequestMapping(value = "/usermember/chpassword_proc", method=RequestMethod.POST)
	public String chPasswordProc(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception{
		
		log.info(this.getClass().getName() + ".chPasswordProc end!");
		String password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("password1")));
		String user_email = (String)session.getAttribute("SS_USER_EMAIL");
		MemberDTO mdto = new MemberDTO();
		
		mdto.setPassword(password);
		mdto.setMem_seq((String)session.getAttribute("SS_MEM_SEQ"));
		
		
		int i = memberService.updateUserPassword(mdto);
		
		model.addAttribute("chpassword", "" + i);
		if(user_email.equals("sincethe1997@naver.com")){
			model.addAttribute("user_email", user_email);
		}
		
		log.info(this.getClass().getName() + ".chPasswordProc end!");
		return "/user/userchpassword_result";
	}
	
	public CountDTO ChartCount(CountDTO pDTO) throws Exception {
		List<ReservationDTO>rList = reservationService.getAllReservationInfo();
		for(int i = 0; i<rList.size();i++) {
			SPOFACDTO sDTO = spofacService.getSpofacInfo(rList.get(i).getFac_seq());
			if(sDTO.getFac_loc().equals("강남구")) {
				pDTO.setNum0(pDTO.getNum0()+1);
			}else if(sDTO.getLoc_gu().equals("강동구")) {
				pDTO.setNum1(pDTO.getNum1()+1);
			}else if(sDTO.getLoc_gu().equals("강북구")) {
				pDTO.setNum2(pDTO.getNum2()+1);
			}else if(sDTO.getLoc_gu().equals("강서구")) {
				pDTO.setNum3(pDTO.getNum3()+1);
			}else if(sDTO.getLoc_gu().equals("관악구")) {
				pDTO.setNum4(pDTO.getNum4()+1);
			}else if(sDTO.getLoc_gu().equals("광진구")) {
				pDTO.setNum5(pDTO.getNum5()+1);
			}else if(sDTO.getLoc_gu().equals("구로구")) {
				pDTO.setNum6(pDTO.getNum6()+1);
			}else if(sDTO.getLoc_gu().equals("금천구")) {
				pDTO.setNum7(pDTO.getNum7()+1);
			}else if(sDTO.getLoc_gu().equals("노원구")) {
				pDTO.setNum8(pDTO.getNum8()+1);
			}else if(sDTO.getLoc_gu().equals("도봉구")) {
				pDTO.setNum9(pDTO.getNum9()+1);
			}else if(sDTO.getLoc_gu().equals("동대문구")) {
				pDTO.setNum10(pDTO.getNum10()+1);
			}else if(sDTO.getLoc_gu().equals("동작구")) {
				pDTO.setNum11(pDTO.getNum11()+1);
			}else if(sDTO.getLoc_gu().equals("마포구")) {
				pDTO.setNum12(pDTO.getNum12()+1);
			}else if(sDTO.getLoc_gu().equals("서대문구")) {
				pDTO.setNum13(pDTO.getNum13()+1);
			}else if(sDTO.getLoc_gu().equals("서초구")) {
				pDTO.setNum14(pDTO.getNum14()+1);
			}else if(sDTO.getLoc_gu().equals("성동구")) {
				pDTO.setNum15(pDTO.getNum15()+1);
			}else if(sDTO.getLoc_gu().equals("성북구")) {
				pDTO.setNum16(pDTO.getNum16()+1);
			}else if(sDTO.getLoc_gu().equals("송파구")) {
				pDTO.setNum17(pDTO.getNum17()+1);
			}else if(sDTO.getLoc_gu().equals("양천구")) {
				pDTO.setNum18(pDTO.getNum18()+1);
			}else if(sDTO.getLoc_gu().equals("영등포구")) {
				pDTO.setNum19(pDTO.getNum19()+1);
			}else if(sDTO.getLoc_gu().equals("용산구")) {
				pDTO.setNum20(pDTO.getNum20()+1);
			}else if(sDTO.getLoc_gu().equals("은평구")) {
				pDTO.setNum21(pDTO.getNum21()+1);
			}else if(sDTO.getLoc_gu().equals("종로구")) {
				pDTO.setNum22(pDTO.getNum22()+1);
			}else if(sDTO.getLoc_gu().equals("중구")) {
				pDTO.setNum23(pDTO.getNum23()+1);
			}else if(sDTO.getLoc_gu().equals("중랑구")) {
				pDTO.setNum24(pDTO.getNum24()+1);
			} 
		}
		return pDTO;
	}
	
	public CountDTO TypeCount(CountDTO tDTO) throws Exception {
		List<ReservationDTO>rList = reservationService.getAllReservationInfo();
		for(int i = 0; i<rList.size();i++) {
			SPOFACDTO sDTO = spofacService.getSpofacInfo(rList.get(i).getFac_seq());
			if(sDTO.getSpo_kind().equals("X-게임장")) {
				tDTO.setNum0(tDTO.getNum0()+1);
			}else if(sDTO.getSpo_kind().equals("간이운동장")) {
				tDTO.setNum1(tDTO.getNum1()+1);
			}else if(sDTO.getSpo_kind().equals("게이트볼장")) {
				tDTO.setNum2(tDTO.getNum2()+1);
			}else if(sDTO.getSpo_kind().equals("골프연습장")) {
				tDTO.setNum3(tDTO.getNum3()+1);
			}else if(sDTO.getSpo_kind().equals("구기체육관")) {
				tDTO.setNum4(tDTO.getNum4()+1);
			}else if(sDTO.getSpo_kind().equals("국궁장")) {
				tDTO.setNum5(tDTO.getNum5()+1);
			}else if(sDTO.getSpo_kind().equals("농구장")) {
				tDTO.setNum6(tDTO.getNum6()+1);
			}else if(sDTO.getSpo_kind().equals("다목적운동장")) {
				tDTO.setNum7(tDTO.getNum7()+1);
			}else if(sDTO.getSpo_kind().equals("레이싱경기장")) {
				tDTO.setNum8(tDTO.getNum8()+1);
			}else if(sDTO.getSpo_kind().equals("론볼장")) {
				tDTO.setNum9(tDTO.getNum9()+1);
			}else if(sDTO.getSpo_kind().equals("배구장")) {
				tDTO.setNum10(tDTO.getNum10()+1);
			}else if(sDTO.getSpo_kind().equals("배드민턴장")) {
				tDTO.setNum11(tDTO.getNum11()+1);
			}else if(sDTO.getSpo_kind().equals("빙상장")) {
				tDTO.setNum12(tDTO.getNum12()+1);
			}else if(sDTO.getSpo_kind().equals("사격장")) {
				tDTO.setNum13(tDTO.getNum13()+1);
			}else if(sDTO.getSpo_kind().equals("산악자전거체험장")) {
				tDTO.setNum14(tDTO.getNum14()+1);
			}else if(sDTO.getSpo_kind().equals("생활체육관")) {
				tDTO.setNum15(tDTO.getNum15()+1);
			}else if(sDTO.getSpo_kind().equals("수영장")) {
				tDTO.setNum16(tDTO.getNum16()+1);
			}else if(sDTO.getSpo_kind().equals("스크린사격장")) {
				tDTO.setNum17(tDTO.getNum17()+1);
			}else if(sDTO.getSpo_kind().equals("야구장")) {
				tDTO.setNum18(tDTO.getNum18()+1);
			}else if(sDTO.getSpo_kind().equals("양궁장")) {
				tDTO.setNum19(tDTO.getNum19()+1);
			}else if(sDTO.getSpo_kind().equals("육상경기장")) {
				tDTO.setNum20(tDTO.getNum20()+1);
			}else if(sDTO.getSpo_kind().equals("인라인스케이트장")) {
				tDTO.setNum21(tDTO.getNum21()+1);
			}else if(sDTO.getSpo_kind().equals("족구장")) {
				tDTO.setNum22(tDTO.getNum22()+1);
			}else if(sDTO.getSpo_kind().equals("축구장")) {
				tDTO.setNum23(tDTO.getNum23()+1);
			}else if(sDTO.getSpo_kind().equals("클라이밍장")) {
				tDTO.setNum24(tDTO.getNum24()+1);
			}else if(sDTO.getSpo_kind().equals("탁구장")) {
				tDTO.setNum25(tDTO.getNum25()+1);
			}else if(sDTO.getSpo_kind().equals("테니스장")) {
				tDTO.setNum26(tDTO.getNum26()+1);
			}else if(sDTO.getSpo_kind().equals("풋살장")) {
				tDTO.setNum27(tDTO.getNum27()+1);
			}else if(sDTO.getSpo_kind().equals("학교체육시설")) {
				tDTO.setNum28(tDTO.getNum28()+1);
			}
			
		}
		return tDTO;
	}
}
