package poly.controller;

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

import poly.dto.BmiDTO;
import poly.dto.MemberDTO;
import poly.service.IBmiService;
import poly.service.IMemberService;

@Controller
public class BmiController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "BmiService")
	private IBmiService bmiService;
	
	@RequestMapping(value = "bmi/bmicalc", method=RequestMethod.POST)
	public String bmiCalc(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + "bmiCalc start!");
		String cm = request.getParameter("cm");
		log.info("cm : " + cm);
		String kg = request.getParameter("kg");
		log.info("kg : " + kg);
		double cmC, kgC;
		cmC = Double.parseDouble(cm);
		kgC = Double.parseDouble(kg);
		double bmi;
		bmi = kgC / ((cmC* 0.01) * (cmC * 0.01));
		
		String mem_seq = (String)session.getAttribute("SS_MEM_SEQ");
		BmiDTO bdto = new BmiDTO();
		bdto.setBmi_mem_seq(mem_seq);
		bdto.setBmi_result("" + bmi);
		List<BmiDTO> blist = bmiService.userInsertBmi(bdto);
		String result = "";
		if(bmi >= 30){
			result = "고도비만";
		}else if(bmi >= 25){
			result = "비만";
		}else if(bmi >= 23){
			result = "과체중";
		}else if(bmi >= 18.5){
			result = "정상체중";
		}else{
			result = "저체중";
		}
		System.out.println("bmi : " + bmi +" / result : " + result); 
		model.addAttribute("blist", blist);
		model.addAttribute("bmiresult", result);
		model.addAttribute("bmi", "" + bmi);
		log.info(this.getClass().getName() + "bmiCalc end!");
		
		return "/notice/bmi_result";
	}
	
	

}
