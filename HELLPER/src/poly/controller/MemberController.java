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
import org.springframework.beans.factory.annotation.Autowired;
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
import poly.util.Email;
import poly.util.EmailSender;
import poly.util.EncryptUtil;

@Controller
public class MemberController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "MemberService")
	private IMemberService memberService;
	
	@Resource(name = "ReservationService")
	private IReservationService reservationService;

	@Resource(name = "ReservDetailService")
	private IReservDetailService reservdetailService;
	
	@Resource(name = "SpofacService")
	private ISpofacService spofacService;
	
	@Autowired
	private EmailSender emailSender;

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		log.info(this.getClass().getName() + "index start!");
		return "/index";
	}

	@RequestMapping(value = "member/regproc", method = RequestMethod.POST)
	public String regProc(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		log.info(this.getClass().getName() + "MemberReg start!");
		String returnURL = "";
		String name = CmmUtil.nvl(request.getParameter("name"));
		String email = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("email")));
		String password1 = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("password1")));
		String password2 = CmmUtil.nvl(request.getParameter("password2"));
		String phone = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("phone")));
		log.info("name : " + name);
		log.info("email : " + email);
		log.info("password1 : " + password1);
		log.info("password2 : " + password2);
		log.info("phone : " + phone);
		log.info("암호화 : " + EncryptUtil.encAES128CBC(email));
		log.info("암호화 : " + EncryptUtil.encAES128CBC(phone));
		log.info("암호화 : " + EncryptUtil.encHashSHA256(password1));

		MemberDTO mdto = new MemberDTO(name, email, password1, phone);

		MemberDTO check = null;

		int checkint = memberService.insertMember(mdto);

		if (checkint == 0) {
			returnURL = "/member/regfail";
		} else {
			returnURL = "/member/regsuccess";
		}

		log.info(this.getClass().getName() + "MemberReg end!");

		return returnURL;// index.jsp
	}

	// 만들어야해요!!
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		int MPgNum = 0;
		if(request.getParameter("MPgNum")==null) {
			MPgNum= 1;
		}else {
			MPgNum = Integer.parseInt(request.getParameter("MPgNum"));
		}
		
		log.info(this.getClass().getName() + "login start!");
		String resUrl = "";

		String email = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("email")));
		String password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("password")));
		log.info("email : " + EncryptUtil.encAES128CBC(email));
		log.info("password : " + EncryptUtil.encHashSHA256(password));
		MemberDTO mdto = new MemberDTO();
		// mdto.setId(email);
		mdto.setEmail(email);
		mdto.setPassword(password);
		mdto.setMstartNum((MPgNum-1)*10+1);
		mdto.setMendNum(MPgNum*10);
		Map<String, Object> mmap = memberService.getLogin(mdto);
		int Mtotal = memberService.getMembertotal();
		if (mmap == null) {
			mmap = new HashMap<>();
		}

		mdto = (MemberDTO) mmap.get("mdto");

		if (mdto != null) {
			
			if(mdto.getStatus().equals("1")) {
				model.addAttribute("msg", "정지된 회원입니다.");
				model.addAttribute("url", "/index.do");
				
				return "/redirect";
			}
				
			String adminEmail = "sincethe1997@naver.com";
			
			if (mdto.getEmail().equals(EncryptUtil.encAES128CBC(adminEmail))) {
				session.setAttribute("SS_USER_EMAIL", mdto.getEmail());
				session.setAttribute("SS_MEM_SEQ", mdto.getMem_seq());
				session.setAttribute("SS_USER_NAME", mdto.getName());
				
				log.info("###############equal");
				List<MemberDTO> mlist = (List<MemberDTO>) mmap.get("mlist");

				if (mlist == null) {
					mlist = new ArrayList<MemberDTO>();
				}
				for(int i=0; i<mlist.size(); i++) {
					mlist.get(i).setEmail(EncryptUtil.decAES128CBC(mlist.get(i).getEmail()));
					mlist.get(i).setPhone(EncryptUtil.decAES128CBC(mlist.get(i).getPhone()));
				}
				model.addAttribute("mlist", mlist);
				model.addAttribute("MPgNum",MPgNum);
				model.addAttribute("Mtotal",Mtotal);
				CountDTO rDTO = new CountDTO();
				ChartCount(rDTO);
				TypeCount(rDTO);
				model.addAttribute("rDTO",rDTO);
				resUrl = "/admin/adminmain";

			} else {
				log.info(this.getClass().getName() + "제발 되라 :" + EncryptUtil.encAES128CBC("sincethe1997@naver.com") );
				session.setAttribute("SS_USER_EMAIL", mdto.getEmail());
				session.setAttribute("SS_MEM_SEQ", mdto.getMem_seq());
				session.setAttribute("SS_USER_NAME", mdto.getName());
				/*
				 List<EventDTO> sList = new ArrayList<EventDTO>();
				 
				
				
				  // 시설 정보 받아오기
				 
				sList = eventService.getFacList();
				if(sList==null)
				{
					sList = new ArrayList<EventDTO>();
				}else {
					log.info(sList.get(1).getFac_name());
				}
				
				model.addAttribute("sList",sList);
				*/
				CountDTO rDTO = new CountDTO();
				ChartCount(rDTO);
				TypeCount(rDTO);
				model.addAttribute("rDTO",rDTO);
				resUrl = "/user/usermain";
                  
			}

		} else {

			resUrl = "/nologin";
		}

		System.out.println(resUrl);
		log.info(this.getClass().getName() + "login end!");
		return resUrl;

	}

	@RequestMapping(value = "/member/idcheck_proc", method = RequestMethod.POST)
	public String idCheck_proc(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		log.info(this.getClass().getName() + "idcheckproc start!");

		String idcheck = CmmUtil.nvl(request.getParameter("idcheck"));
		log.info("idcheck : " + idcheck);
		MemberDTO mdto = new MemberDTO();
		// mdto.setId(idcheck);
		mdto = memberService.getIdCheck(mdto);

		if (mdto == null) {
			mdto = new MemberDTO();
		}

		// String id = mdto.getId();
		// model.addAttribute("id", id);
		model.addAttribute("idcheck", idcheck);

		log.info(this.getClass().getName() + "idcheckproc end!");

		return "/member/idcheck_result";
	}

	@RequestMapping(value = "/member/idsearch_proc", method = RequestMethod.POST)
	public String idSearchProc(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		log.info(this.getClass().getName() + "idsearch start!");

		String name = CmmUtil.nvl(request.getParameter("name"));
		String phone = EncryptUtil.encAES128CBC(request.getParameter("phone"));

		log.info("name : " + name);
		log.info("phone : " + EncryptUtil.encAES128CBC(phone));

		MemberDTO mdto = new MemberDTO();
		mdto.setName(name);
		mdto.setPhone(phone);

		System.out.println(name);
		System.out.println(phone);

		mdto = memberService.getIdSearch(mdto);
		if (mdto == null) {
			mdto = new MemberDTO();
		}

		model.addAttribute("idsearch", EncryptUtil.decAES128CBC(mdto.getEmail()));

		return "/member/idsearch_result";

	}

	@RequestMapping(value = "/member/passwordsearch_proc", method = RequestMethod.POST)
	public String passwordSearchProc(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {

		log.info(this.getClass().getName() + "passwordsearch_proc start!");
		String returnURL = "/member/passwordsearch_result";
		Email email1 = new Email();
		String name = CmmUtil.nvl(request.getParameter("name"));
		String email = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("email")));
		String phone = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("phone")));

		log.info("name : " + name);
		log.info("email : " + email);
		log.info("phone : " + phone);

		MemberDTO mdto = new MemberDTO();
		// mdto.setId(id);
		mdto.setName(name);
		mdto.setEmail(email);
		mdto.setPhone(phone);

		mdto = memberService.getPasswordSearch(mdto);

		if (mdto == null) {
			returnURL = "/member/passwordsearch_fail";
			// 비번찾기 정보 없을때 보낼곳
		} else {
			log.info("email : " + email);
			System.out.println(mdto.getPassword());

			email1.setReciver(EncryptUtil.decAES128CBC(mdto.getEmail()));

			System.out.println("email1.get " + email1.getReciver());

			email1.setSubject("SPORnSER 비밀번호가 재발급되었습니다.");
			email1.setContent("임시 비밀번호는 " + mdto.getPassword() + "입니다.");

			emailSender.SendEmail(email1);

			model.addAttribute("passwordsearch", mdto.getPassword());

			log.info(this.getClass().getName() + "passwordsearch_proc end!");

		}
		return returnURL;

	}

	@RequestMapping(value = "/member/getmemberdetail")
	public String getMemberDetail(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {
		int MPgNum = 0;
		if(request.getParameter("MPgNum")==null) {
			MPgNum= 1;
		}else {
			MPgNum = Integer.parseInt(request.getParameter("MPgNum"));
		}
		int Mtotal = memberService.getMembertotal();
		
		log.info(this.getClass().getName() + "getMemberdetail start!");
		Map<String, Object> mmap;
		String mem_seq = CmmUtil.nvl(request.getParameter("mem_seq"));
		MemberDTO mdto = new MemberDTO();
		mdto.setMem_seq(mem_seq);

		mmap = memberService.getMemberDetail(mdto, (String) session.getAttribute("SS_MEM_SEQ"));
		
		mdto = (MemberDTO)mmap.get("mdto");
		mdto.setEmail(new EncryptUtil().decAES128CBC(mdto.getEmail()));
		mdto.setPhone(new EncryptUtil().decAES128CBC(mdto.getPhone()));
		
		if (mmap == null) {
			mmap = new HashMap<>();
		}
		CountDTO rDTO = new CountDTO();
		ChartCount(rDTO);
		TypeCount(rDTO);
		model.addAttribute("rDTO",rDTO);
		model.addAttribute("memberdetail", mdto);
		model.addAttribute("MPgNum",MPgNum);
		model.addAttribute("Mtotal",Mtotal);
		
		log.info(this.getClass().getName() + "getMemberdetail end!");

		return "/admin/adminmain";
	}

	private Object mdto(int i) {
		// TODO Auto-generated method stub
		return null;
	}

	@RequestMapping(value = "/member/updatememberinfo", method = RequestMethod.POST)
	public String updateMemberInfo(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {

		log.info(this.getClass().getName() + "updatememberinfo start!");
		int MPgNum = 0;
		if(request.getParameter("MPgNum")==null) {
			MPgNum= 1;
		}else {
			MPgNum = Integer.parseInt(request.getParameter("MPgNum"));
		}
		int Mtotal = memberService.getMembertotal();
		
		String user_email = (String) request.getSession().getAttribute("SS_USER_EMAIL");

		String mem_seq = CmmUtil.nvl(request.getParameter("mem_seq"));
		String phone = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("phone")));
		String password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("pass")));
		String name = CmmUtil.nvl(request.getParameter("name"));
		String email = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("email")));

		log.info("name : " + name);
		log.info("email : " + email);
		log.info("password : " + password);
		log.info("phone : " + phone);
		log.info("mem_seq : " + mem_seq);

		MemberDTO mdto = new MemberDTO(name, email, password, phone);
		mdto.setMem_seq(mem_seq);

		Map<String, Object> mmap = memberService.updateMemberDetail(mdto, (String) session.getAttribute("SS_MEM_SEQ"));

		if (user_email.equals(EncryptUtil.encAES128CBC("sincethe1997@naver.com")) || user_email.equals(EncryptUtil.encAES128CBC("SINCETHE1997@NAVER.COM"))) 
			{
			List<MemberDTO> mlist = (List<MemberDTO>) mmap.get("mlist");

			if (mlist == null) {
				mlist = new ArrayList<MemberDTO>();
			}else {
				for (int i = 0; i < mlist.size(); i++) {
					mlist.get(i).setEmail(EncryptUtil.decAES128CBC(mlist.get(i).getEmail()));
					mlist.get(i).setPhone(EncryptUtil.decAES128CBC(mlist.get(i).getPhone()));
				}
			}
			System.out.println(mlist.size());
			model.addAttribute("mlist", mlist);
			model.addAttribute("MPgNum",MPgNum);
			model.addAttribute("Mtotal",Mtotal);
			CountDTO rDTO = new CountDTO();
			ChartCount(rDTO);
			TypeCount(rDTO);
			model.addAttribute("rDTO",rDTO);
			log.info(this.getClass().getName() + "updatememberinfo end!");
			return "/admin/adminmain";
		} else {
			log.info(this.getClass().getName() + "updatememberinfo end!");
			return "/main";
		}

	}

	@RequestMapping(value = "/member/deletemember")
	public String deleteMember(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception {

		log.info(this.getClass().getName() + " deletemember start!");
		String mem_seq = CmmUtil.nvl(request.getParameter("mem_seq"));
		MemberDTO mdto = new MemberDTO();
		mdto.setMem_seq(mem_seq);
		log.info("mem_seq : " + mem_seq);
		Map<String, Object> mmap = memberService.deleteMember(mdto, (String) session.getAttribute("SS_MEM_SEQ"));
		model.addAttribute("msg","회원정보삭제에 성공하셨습니다.");
		model.addAttribute("url","/admin/adminmain.do");
		log.info(this.getClass().getName() + "deletemember end!");
		return "/redirect";
	}

	@RequestMapping("/member/logout")
	public String logOut(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {

		log.info(this.getClass().getName() + "deletemember start!");
		session.invalidate();
		log.info(this.getClass().getName() + "deletemember start!");

		return "/logout";
	}

	@RequestMapping(value = "/admin/adminmain", method = RequestMethod.GET)
	public String remain(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		log.info("mainlog click start!");
		int MPgNum = 0;
		if(request.getParameter("MPgNum")==null) {
			MPgNum= 1;
		}else {
			MPgNum = Integer.parseInt(request.getParameter("MPgNum"));
		}
		int Mtotal = memberService.getMembertotal();
		
		MemberDTO mdto = new MemberDTO();
		mdto.setMstartNum((MPgNum-1)*10+1);
		mdto.setMendNum(MPgNum*10);
		log.info(mdto.getMstartNum());
		
		List<MemberDTO> mlist = memberService.getMemberInfo(mdto);
		if(mlist==null) {
			mlist = new ArrayList<MemberDTO>();
		}
		for(int i = 0; i<mlist.size();i++) {
			mlist.get(i).setEmail(EncryptUtil.decAES128CBC(mlist.get(i).getEmail()));
			mlist.get(i).setPhone(EncryptUtil.decAES128CBC(mlist.get(i).getPhone()));
		}
		CountDTO rDTO = new CountDTO();
		ChartCount(rDTO);
		TypeCount(rDTO);
		model.addAttribute("rDTO",rDTO);
		model.addAttribute("mlist", mlist);
		model.addAttribute("Mtotal",Mtotal);
		model.addAttribute("MPgNum",MPgNum);
		log.info("mainlog click end!");
		
		return "/admin/adminmain";
	}

	@RequestMapping("/member/chpassword")
	public String chPassword(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
			throws Exception {

		log.info(this.getClass().getName() + ".chPassword start!");

		log.info(this.getClass().getName() + ".chPassword end!");
		return "/member/chpasswordform";
	}

	@RequestMapping(value = "/member/chpassword_proc", method = RequestMethod.POST)
	public String chPasswordProc(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Model model) throws Exception {

		log.info(this.getClass().getName() + ".chPasswordProc end!");
		String password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("password1")));

		MemberDTO mdto = new MemberDTO();

		mdto.setPassword(EncryptUtil.encHashSHA256(password));
		mdto.setMem_seq((String) session.getAttribute("SS_MEM_SEQ"));

		List<MemberDTO> mlist = memberService.updatePassword(mdto);
		model.addAttribute("mlist", mlist);
		CountDTO rDTO = new CountDTO();
		ChartCount(rDTO);
		TypeCount(rDTO);
		model.addAttribute("rDTO",rDTO);
		log.info(this.getClass().getName() + ".chPasswordProc end!");
		return "/admin/adminmain";
	}

	@RequestMapping("/member/memberchpassword")
	public String memberChPassword(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".memberChPassword start!");
		int MPgNum = 0;
		if(request.getParameter("MPgNum")==null) {
			MPgNum= 1;
		}else {
			MPgNum = Integer.parseInt(request.getParameter("MPgNum"));
		}
		int Mtotal = memberService.getMembertotal();
		String mem_seq = CmmUtil.nvl(request.getParameter("mem_seq"));
		String password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("password1")));
		log.info("password : " + password);
		MemberDTO mdto = new MemberDTO();
		mdto.setMem_seq(mem_seq);
		mdto.setPassword(password);
		memberService.updateUserPassword(mdto);
		log.info(this.getClass().getName() + ".memberChPassword end!");
		model.addAttribute("mem_seq", mem_seq);
		model.addAttribute("MPgNum",MPgNum);
		model.addAttribute("Mtotal",Mtotal);
		return "/member/chpasswordform";
	}

	@RequestMapping(value = "/member/adminchpassword", method = RequestMethod.POST)
	public String adminChPassword(HttpServletResponse response, HttpServletRequest request, Model model)
			throws Exception {
		log.info(this.getClass().getName() + ".memberChPassword end!");
		String mem_seq = CmmUtil.nvl(request.getParameter("mem_seq"));
		log.info("mem_seq : " + mem_seq);
		String password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("password1")));
		log.info("password : " + password);
		MemberDTO mdto = new MemberDTO();
		mdto.setMem_seq(mem_seq);
		mdto.setPassword(password);
		memberService.updateUserPassword(mdto);

		log.info(this.getClass().getName() + ".memberChPassword end!");
		return "/notice/noticeredirect";
	}
	@RequestMapping(value = "/member/setmemberstop")
	public String setmemberstop(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception {

		log.info(this.getClass().getName() + " setmemberstop start!");
		String mem_seq = CmmUtil.nvl(request.getParameter("mem_seq"));
		MemberDTO mdto = new MemberDTO();
		mdto.setMem_seq(mem_seq);
		log.info("mem_seq : " + mem_seq);
		int res = memberService.setMemberStop(mem_seq);
		model.addAttribute("msg","회원을 정지상태로 변경하였습니다.");
		model.addAttribute("url","/admin/adminmain.do");
		log.info(this.getClass().getName() + "setmemberstop end!");
		return "/redirect";
	}
	@RequestMapping(value = "/member/setmemberstart")
	public String setmemberstart(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception {

		log.info(this.getClass().getName() + " setmemberstart start!");
		String mem_seq = CmmUtil.nvl(request.getParameter("mem_seq"));
		MemberDTO mdto = new MemberDTO();
		mdto.setMem_seq(mem_seq);
		log.info("mem_seq : " + mem_seq);
		int res = memberService.setMemberStart(mem_seq);
		model.addAttribute("msg","회원정지를 해제하였습니다.");
		model.addAttribute("url","/admin/adminmain.do");
		log.info(this.getClass().getName() + "setmemberstart end!");
		return "/redirect";
	}
	
	public CountDTO ChartCount(CountDTO pDTO) throws Exception {
		List<ReservationDTO>rList = reservationService.getAllReservationInfo();
		for(int i = 0; i<rList.size();i++) {
			SPOFACDTO sDTO = spofacService.getSpofacInfo(rList.get(i).getFac_seq());
			if(sDTO.getLoc_gu().equals("강남구")) {
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
