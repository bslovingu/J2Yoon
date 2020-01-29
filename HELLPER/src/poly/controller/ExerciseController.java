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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import poly.dto.ExerciseDTO;
import poly.service.IExerciseService;
import poly.service.IMemberService;

@Controller
public class ExerciseController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "ExerciseService")
	private IExerciseService exerciseService;
	
	@RequestMapping("/exercise/adminexercise")
	public String adminExercise(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + "adminExercise start!");
		
		List<ExerciseDTO> xlist = exerciseService.getAllExercise();
		model.addAttribute("xlist", xlist);
		
		log.info(this.getClass().getName() + "adminExercise end!");
		return "/exercise/adminexercise";
	}
	
	@RequestMapping("/exercise/exerciseuploadform")
	public String exerciseUploadForm(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + "exerciseUploadForm start!");
		
		model.addAttribute("exeruploadform", "exeruploadform");
		
		
		log.info(this.getClass().getName() + "exerciseUploadForm end!");
		
		
		return "/exercise/adminexercise";
	}
	
	@RequestMapping(value = "/exercise/exercisereg", method=RequestMethod.POST)
	public String exerciseReg(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam("exerfile") MultipartFile file, HttpSession session) throws Exception {
		log.info(this.getClass().getName() + "exercisereg start!");
		
		String returnURL = "/notice/noticeredirect";
		
		String title = request.getParameter("title");
		log.info("title : " + title);
		
		String content = request.getParameter("content");
		log.info("content : " + content);
		content = content.replaceAll("\r\n", "<br>");
		String user_email = (String)session.getAttribute("SS_USER_EMAIL");
		log.info("user_email : " + user_email);
		
		ExerciseDTO xdto = new ExerciseDTO();
		String refilename = "";
		
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
			}
			
			if (j == 1) {
				f = new File(savePath + fileOrgName);
				f.delete();
			}
		}
		
		String realPath = request.getRealPath("/video") + "\\" + refilename;
		String url = "/video/" + refilename;

		xdto.setExer_title(title);
		xdto.setExer_uploadname(user_email);
		xdto.setExer_content(content);
		xdto.setExer_path(realPath);
		xdto.setExer_url(url);
		int r = exerciseService.exerciseReg(xdto);
		
		if(r > 0){
			model.addAttribute("exercise", "success");
		}else{
			model.addAttribute("exercise", "fail");
		}
		
		log.info(this.getClass().getName() + "exercisereg end!");
		return returnURL;
	}
	
	@RequestMapping("/exercise/exercisedetail")
	public String exerciseDetail(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception{
		log.info(this.getClass().getName() + "exerciseDetail start!");
		
		String xseq = request.getParameter("xseq");
		
		ExerciseDTO xdto = new ExerciseDTO();
		xdto.setExer_seq(xseq);
		
		xdto = exerciseService.exerciseDetail(xdto);
		
		model.addAttribute("xdetail", xdto);
		
		
		log.info(this.getClass().getName() + "exercisDetail end!");
		return "/exercise/adminexercise";
	}
	
	@RequestMapping("/exercise/redirectExer")
	public String redirectExer(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + "redirectExer start!");
		
		List<ExerciseDTO> xlist = exerciseService.getAllExercise();
		
		
		
		model.addAttribute("xlist", xlist);
		
		log.info(this.getClass().getName() + "redirectExer end!");
		return "/exercise/adminexercise";
	}
	
	
	@RequestMapping("/exercise/exerupdateform")
	public String exerUpdateFrom(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + "exerUpdateFrom start!");
		String xseq = request.getParameter("xseq");
		
		ExerciseDTO xdto = new ExerciseDTO();
		xdto.setExer_seq(xseq);
		
		xdto = exerciseService.exerciseDetail(xdto);
		xdto.setExer_content(xdto.getExer_content().replaceAll("<br>", "\r\n"));
		model.addAttribute("xupdateform", xdto);
		
		log.info(this.getClass().getName() + "exerUpdateFrom end!");
		return "/exercise/adminexercise";
	}
	
	@RequestMapping(value = "/exercise/exerupdate", method=RequestMethod.POST)
	public String exerUpdate(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session, @RequestParam("exerfile") MultipartFile file)throws Exception{
		log.info(this.getClass().getName() + "exerUpdate start!");
		String returnURL = "/notice/noticeredirect";
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
		log.info(this.getClass().getName() + "exerUpdate end!");
		return returnURL;
	}
	
	@RequestMapping("/exercise/exerdelete")
	public String exerDelete(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + "exerDelete start!");
		String xseq = request.getParameter("xseq");
		log.info("xseq : " + xseq);
		ExerciseDTO xdto = new ExerciseDTO();
		
		xdto.setExer_seq(xseq);
		
		List<ExerciseDTO> xlist = exerciseService.deleteExer(xdto);
		
		model.addAttribute("xlist", xlist);
		
		log.info(this.getClass().getName() + "exerDelete end!");
		return "/exercise/adminexercise";
	}
	
	@RequestMapping("/exercise/healthvideo")
	public String exerVideo(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info(this.getClass().getName() + "exerVideo start!");
		
		
		
		log.info(this.getClass().getName() + "exerVideo end!");
		return "/exercise/healthvideo";
	}

}
