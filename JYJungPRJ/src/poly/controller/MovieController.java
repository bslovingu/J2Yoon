package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.service.IMovieService;


/*
 * Controller 선언해야만 Spring프레임워크에서 Controller인지 인식가능
 */

@Controller
public class MovieController {
	private Logger log = Logger.getLogger(this.getClass());
	
	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용))
	 */
	@Resource(name="MovieService")
	private IMovieService movieService;
	
	/**
	 * CGV영화 수집을 위한 URL호출
	 */
	@RequestMapping(value="movie/getMovieInfoFromWEB")
	public String getMovieInfoFromWEB(HttpServletRequest request, HttpServletResponse response, ModelMap model)
	throws Exception{
		log.info(this.getClass().getName()+".getMovieInfoFromWEB start!");;
		
		int res = movieService.getMovieInfoFromWEB();
		
		//크롤링 결과를 넣어주기
		model.addAttribute("res", String.valueOf(res));
		
		log.info(this.getClass().getName()+".getMovieInfoFromWEB end!");
		
		return "/movie/RankForWEB";
	}

}
