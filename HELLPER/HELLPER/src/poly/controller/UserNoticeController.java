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

import poly.dto.EventDTO;
import poly.dto.NoticeDTO;
import poly.dto.QnADTO;
import poly.service.INoticeService;
import poly.util.EncryptUtil;

@Controller
public class UserNoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "NoticeService")
	private INoticeService noticeService;
	
	@RequestMapping("usernotice/usernoticelist")
	public String userNoticeList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + ".userNoticeList start!");
		int NPgNum = 0;
		if(request.getParameter("NPgNum")==null) {
			NPgNum= 1;
		}else {
			NPgNum = Integer.parseInt(request.getParameter("NPgNum"));
		}
		// 전체 게시글 갯수 조회
		int Ntotal = noticeService.getNoticeTotal();
		NoticeDTO pnDTO = new NoticeDTO();
		pnDTO.setNstartNum((NPgNum-1)*10+1);
		pnDTO.setNendNum(NPgNum*10);
		
		List<NoticeDTO> nlist = noticeService.getNoticeList(pnDTO);
		if(nlist==null) {
			nlist = new ArrayList<NoticeDTO>();
		}else {
			for(int i=0;i<nlist.size();i++) {
				nlist.get(i).setNotice_uploadname(EncryptUtil.decAES128CBC(nlist.get(i).getNotice_uploadname()));
			}
		}
		model.addAttribute("Ntotal",Ntotal);
		model.addAttribute("NPgNum",NPgNum);
		model.addAttribute("nlist", nlist);
		
		log.info(this.getClass().getName() + ".userNoticeList end!");
		return "/user/usercommunity";
	}
	
	
	
	
	
	
	@RequestMapping("/usernotice/usernoticedetail")
	public String getNoitceDetail (HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		
		log.info(this.getClass().getName() + "getusernoticedetail start!");
		
		String nseq = request.getParameter("nseq");
		NoticeDTO ndto = new NoticeDTO();
		ndto.setNotice_seq(nseq);
		
		Map<String, Object> nmap = noticeService.getNoticeDetail(ndto);
		
		model.addAttribute("ndetail", (NoticeDTO)nmap.get("ndetail"));
		log.info(this.getClass().getName() + "getusernoticedetail end!");
		
		
		return "/user/usernoticedetail";
	}
}
