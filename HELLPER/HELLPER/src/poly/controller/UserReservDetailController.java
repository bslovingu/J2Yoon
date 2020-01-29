package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.ReservDetailDTO;
import poly.service.IReservDetailService;


@Controller
public class UserReservDetailController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ReservDetailService")
	private IReservDetailService reservdetailService;
	
	@RequestMapping("userreservdetail/userreservdetaillist")
	public String userReservDetailList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + ".userReservDetailList start!");
		
		ReservDetailDTO rdDTO = new ReservDetailDTO();
		List<ReservDetailDTO> rdlist = reservdetailService.getAllReservDetail(rdDTO);
		if(rdlist==null) {
			rdlist = new ArrayList<ReservDetailDTO>();
		}
		
		model.addAttribute("rdlist", rdlist);
		
		return "/user/userreservdetail";
		
	}
}
