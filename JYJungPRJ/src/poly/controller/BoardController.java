package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.BoardDTO;
import poly.service.IBoardService;

@Controller
public class BoardController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "BoardService")
	private IBoardService boardService;

	@RequestMapping(value="/test")
	public String Test() {
		return "/test";
	}
	@RequestMapping(value = "/board/boardReg")
	public String RegBoard() {
		log.info(this.getClass().getName());

		return "/board/boardReg";
	}
	
	@RequestMapping(value = "/board/boardList")
	public String BoardList() {
		log.info(this.getClass().getName());

		return "/board/boardList";
	}
	
	@RequestMapping(value="board/boardRegProc")
	public String BoardRegProc(HttpServletRequest request, Model model) {

		log.info(this.getClass().getName());
		
		String title=request.getParameter("title");
		String contents = request.getParameter("contents");
		
		log.info(title);
		log.info(contents);
		
		BoardDTO bDTO = new BoardDTO();
		bDTO.setContent(contents);
		bDTO.setTitle(title);
		
		int result = 0;
		
		try {
			result=boardService.insertBoardInfo(bDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0) {
		model.addAttribute("url", "/board/boardReg.do");
		model.addAttribute("msg", "등록되었습니다.");
		}else {
			model.addAttribute("url", "/board/boardReg.do");
			model.addAttribute("msg", "등록에 실패했습니다.");
		}
		return "/redirect";
	 
	}


}
