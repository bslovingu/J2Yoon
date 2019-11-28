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

import poly.dto.MemberDTO;
import poly.dto.EventDTO;
import poly.service.IMemberService;
// import poly.service.ISpofacService;
import poly.util.EncryptUtil;

@Controller
public class UserMemberController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "MemberService")
	private IMemberService memberService;
	
	// @Resource(name = "SpofacService")
	// private ISpofacService spofacService;
	
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
		return "/user/usermain";
	}
	
	@RequestMapping(value="/usermember/getusermemberdetail")
	public String getMemberDetail(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		
		log.info(this.getClass().getName() + "getMemberdetail start!");
		Map<String, Object> mmap;
		String mem_seq = request.getParameter("mem_seq");
		System.out.println(request.getParameter("mem_seq"));
		MemberDTO mdto = new MemberDTO();
		mdto.setMem_seq(mem_seq);
		
		mmap = memberService.getMemberDetail(mdto, (String) session.getAttribute("SS_MEM_SEQ"));
		
		mdto = (MemberDTO)mmap.get("mdto");
		mdto.setEmail(new EncryptUtil().decAES128CBC(mdto.getEmail()));
		mdto.setPhone(new EncryptUtil().decAES128CBC(mdto.getPhone()));
		
		if (mmap == null) {
			mmap = new HashMap<>();
		}
		
		model.addAttribute("memberdetail", mdto);
		
		
		log.info(this.getClass().getName() + "getMemberdetail end!");
		
		return "/user/usermemberdetail";
	}
	@RequestMapping(value="/usermember/userdeletemember")
	public String deleteMember(HttpSession session,  HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		
		log.info(this.getClass().getName() + "userdeletemember start!");
		
		String mem_seq = request.getParameter("mem_seq");
		MemberDTO mdto = new MemberDTO();
		mdto.setMem_seq(mem_seq);
		Map<String, Object> mmap = memberService.deleteMember(mdto, (String)session.getAttribute("SS_MEM_SEQ"));
		
		
		
		
		log.info(this.getClass().getName() + "userdeletemember end!");
		return "/logout";
	}
	
	
	@RequestMapping(value="/usermember/updateusermemberinfo", method=RequestMethod.POST)
	public String updateMemberInfo(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		
		log.info(this.getClass().getName() + "updateusermemberinfo start!");
		
						
		String mem_seq = request.getParameter("mem_seq");
		String phone = EncryptUtil.encAES128CBC(request.getParameter("phone"));
		String password = EncryptUtil.encHashSHA256(request.getParameter("password"));
		String name = request.getParameter("name");
		String email = EncryptUtil.encAES128CBC(request.getParameter("email"));
		
		log.info("name : "+ name);
		log.info("email : "+ email);
		log.info("password : "+ password);
		log.info("phone : "+ phone);
		log.info("mem_seq : " + mem_seq);
		
		MemberDTO mdto = new MemberDTO(name, email, password, phone);
		mdto.setMem_seq(mem_seq);
		
		memberService.updateUserMemberDetail(mdto);
		
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
		String password = EncryptUtil.encHashSHA256(request.getParameter("password1"));
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
	
	
}
