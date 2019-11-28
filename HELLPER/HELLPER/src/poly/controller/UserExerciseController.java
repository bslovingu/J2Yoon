package poly.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.ExerciseDTO;
import poly.service.IExerciseService;

@Controller
public class UserExerciseController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "ExerciseService")
	private IExerciseService exerciseService;
	
	@RequestMapping("userexercise/userexerlist")
	public String userExerList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + ".userExerList start!");
		List<ExerciseDTO> xlist = exerciseService.getUserExer();
		if(xlist == null){
			xlist = new ArrayList<ExerciseDTO>();
		}
		
		model.addAttribute("xlist", xlist);
		
		log.info(this.getClass().getName() + ".userExerList start!");
		return "/user/userexerlist";
	}
	
	@RequestMapping("/userexercise/userexercisereg")
	public String userExerRegFrom(HttpServletResponse response, HttpServletRequest request, Model model)throws Exception{
		log.info(this.getClass().getName() + ".userExerRegFrom start!");
		
		
		log.info(this.getClass().getName() + ".userExerRegFrom start!");
		return "/user/userexerregform";
	}
	

	@RequestMapping(value = "/userexercise/userexercisereg", method=RequestMethod.POST)
	public String userExerciseReg(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam("exerfile") MultipartFile file, HttpSession session) throws Exception {
		log.info(this.getClass().getName() + "UserExerciseReg test start!");
		
		
		String title = request.getParameter("title");
		log.info("testtitle : " + title);
		
		String content = request.getParameter("content");
		log.info("testcontent : " + content);
		content = content.replaceAll("\r\n", "<br>");
		String user_email = (String)session.getAttribute("SS_USER_EMAIL");
		log.info("testuser_email : " + user_email);
		
		ExerciseDTO xdto = new ExerciseDTO();
		String refilename = "";
		if (file != null) {
			for (int j = 0; j < 2; j++) {
				String fileOrgName = file.getOriginalFilename();
				String savePath = "C:/spring/SpringPRJ/WebContent/video/";
				File f = new File(savePath + fileOrgName);
				String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date());
				int i = -1;
				i = fileOrgName.indexOf(".");
				if (fileOrgName.length() > 0) {
					refilename = now + fileOrgName.substring(i, fileOrgName.length());
					File newFile = new File(savePath + refilename);
					
					f.renameTo(newFile);
					file.transferTo(f);
					
					if (j == 1) {
						f = new File(savePath + fileOrgName);
						f.delete();
					}
				}
			}
		}
		String realPath = request.getRealPath("/video") + "\\" + refilename;
		String url = "/video/" + refilename;

		xdto.setExer_title(title);
		xdto.setExer_uploadname(user_email);
		xdto.setExer_content(content);
		xdto.setExer_path(realPath);
		xdto.setExer_url(url);
		int c = exerciseService.insertUserExerReg(xdto);
		if(c > 0){
			model.addAttribute("userexercise", "success");
		}else{
			model.addAttribute("userexercise", "fail");
		}
		
		
		
		
		log.info(this.getClass().getName() + "user Test ExerciseReg end!");
		return "/notice/noticeredirect";
	}
	
	@RequestMapping("/userexercise/userexercisedetail")
	public String userExerRegForm(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + "userExerRegForm start!");
		String xseq = request.getParameter("xseq");
		log.info("xseq : " + xseq);
		
		ExerciseDTO xdto = new ExerciseDTO();
		xdto.setExer_seq(xseq);
		
		xdto = exerciseService.getUserExer(xdto);
		
		model.addAttribute("xdto", xdto);
		
		
		
		
		xdto = exerciseService.getUserExer(xdto);
		
		model.addAttribute("xdto", xdto);
		
		xdto = exerciseService.exerciseDetail(xdto);
		
		model.addAttribute("xupdateform", xdto);
		
		
		log.info(this.getClass().getName() + "userExerRegForm end!");
		return "/user/userexerdetail";
	}
	
	
	
	@RequestMapping("/userexercise/userexerdelete")
	public String exerDelete(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + "userexerDelete start!");
		String xseq = request.getParameter("xseq");
		log.info("xseq : " + xseq);
		ExerciseDTO xdto = new ExerciseDTO();
		
		xdto.setExer_seq(xseq);
		
		List<ExerciseDTO> xlist = exerciseService.deleteExer(xdto);
		
		model.addAttribute("xlist", xlist);
		
		log.info(this.getClass().getName() + "userexerDelete end!");
		return "/user/userexerlist";
	}
	
	@RequestMapping(value = "/userexercise/userexerupdate", method=RequestMethod.POST)
	public String exerUpdate(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session, @RequestParam("exerfile") MultipartFile file)throws Exception{
		log.info(this.getClass().getName() + "userexerUpdate start!");
		String title = request.getParameter("title");
		log.info("title : " + title);
		
		String content = request.getParameter("content");
		log.info("content : " + content);
		content = content.replaceAll("\r\n", "<br>");
		String user_email = (String)session.getAttribute("SS_USER_EMAIL");
		log.info("user_email : " + user_email);
		
		String xseq = request.getParameter("xseq"); 
		
		ExerciseDTO xdto = new ExerciseDTO();
		
		String fileOrgName = file.getOriginalFilename();
		
		String savePath = "C:/MYH_workspace/SpringPRJ/WebContent/video/";
		
		File f = new File(savePath + fileOrgName);
		String realPath = "";
		String refilename = "";
		if (!fileOrgName.equals("")) {
			for(int j = 0; j < 2; j ++ ){
				String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date());

				int i = -1;
				i = fileOrgName.indexOf(".");

				refilename = now + fileOrgName.substring(i, fileOrgName.length());

				File oldFile = new File(savePath + fileOrgName);
				File newFile = new File(savePath + refilename);

				f.renameTo(newFile);

				file.transferTo(f);
				if(j == 1){
					f = new File(savePath + fileOrgName);
					f.delete();
				}
			}
				realPath = request.getRealPath("/video") + "\\" + refilename;
				String url = "/video/" + refilename;

				xdto.setExer_title(title);
				xdto.setExer_uploadname(user_email);
				xdto.setExer_content(content);
				xdto.setExer_path(realPath);
				xdto.setExer_url(url);
				xdto.setExer_seq(xseq);

		}else{
			
			xdto.setExer_title(title);
			xdto.setExer_uploadname(user_email);
			xdto.setExer_content(content);
			xdto.setExer_seq(xseq);
			
		}
		exerciseService.updateExer(xdto);
		model.addAttribute("exercise", "exercise");
		
		List<ExerciseDTO> xlist = exerciseService.getUserExer();
		if(xlist == null){
			xlist = new ArrayList<ExerciseDTO>();
		}
		
		model.addAttribute("xlist", xlist);
		
		log.info(this.getClass().getName() + ".userExerList start!");
		
		log.info(this.getClass().getName() + "userexerUpdate end!");
		return "/user/userexerlist";
	}
	
	@RequestMapping("/userexercise/userexerupdateform")
	public String exerUpdateFrom(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + "exerUpdateFrom start!");
		
		
		String xseq = request.getParameter("xseq");
		log.info("xseq : " + xseq);
		
		ExerciseDTO xdto = new ExerciseDTO();
		xdto.setExer_seq(xseq);
		
		
		xdto = exerciseService.exerciseDetail(xdto);
		xdto.setExer_content(xdto.getExer_content().replaceAll("<br>", "\r\n"));
		model.addAttribute("xupdateform", xdto);
		
		log.info(this.getClass().getName() + "exerUpdateFrom end!");
		return "/user/userexerupdateform";
	}
}
