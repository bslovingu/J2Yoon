package poly.service.impl;

import java.util.Iterator;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import poly.dto.MealDTO;
import poly.dto.MovieDTO;
import poly.persistance.mapper.IMealMapper;
import poly.service.IMealService;
import poly.util.CmmUtil;
import poly.util.DateUtil;

@Service("MealService")
public class MealService implements IMealService {

	@Resource(name = "MealMapper")
	private IMealMapper mealMapper;

	// 로그 파일 생성 및 로그 출력을 위한 log4j 프레임워크의 자바 객체
	private Logger log = Logger.getLogger(this.getClass());

	/**
	 * JSOUP 라이브러리를 통한 학교홈페이지 식단정보 가져오기
	 */
	@Override
	public int getMealInfoFromWEB() throws Exception {

		// 로그 찍기(나중에 로그찍어서 함수에 접근했는지 파악하기위해서)
		log.info(this.getClass().getName() + ".getMealInfoFromWEB start!");

		int res = 0; // 크롤링 결과 (0보다 크면 크롤링 성공)

		// 학교식단주소
		String url = "http://www.kopo.ac.kr/kangseo/content.do?menu=262";

		// JSOUP 라이브러리를 통해 사이트 접속하면 그 사이트 전체 HTML소스 저장할 변수
		Document doc = null;

		// 사이트 접속(http프로토콜만 가능, https 프로토콜은 보안상 불가능)
		doc = Jsoup.connect(url).get();

		// 학교식단 홈페이지 중 일부태그만 사용
		// <table class="tbl_table menu"> 이 태그 내에 있는 HTML소스만 element에 저장
		Elements element = doc.select("table.tbl_table");

		// Iterator를 사용하여 식단정보를 가져오기
		// 주간식단이기 때문에 반복됨
		Iterator<Element> meal_date = element.select("tbody tr td:first-child").iterator(); // 식단 날짜
		Iterator<Element> meal_cnt = element.select("tbody tr td:nth-child(3)").iterator(); // 식단 내용

		MealDTO pDTO = null;

		// 수집된 데이터 DB에 저장하기
		
		for (int i=0; i<5; i++) {
			pDTO = new MealDTO(); // 수집된 영화정보를 DTO에 저장하기 위해 메모리에 올리기
			
			// 수집되는 데이터가 '2019.10.23 ~~~'
			pDTO.setMeal_date(CmmUtil.nvl(meal_date.next().text()).trim());
			
			// 식단 내용
			pDTO.setMeal_cnt(CmmUtil.nvl(meal_cnt.next().text()).trim());
			
			// 식단 한개씩 추가
			res += mealMapper.InsertMealInfo(pDTO);
			
		}

		// 로그찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다)
		log.info(this.getClass().getName() + ".getMealInfoFromWEB end!");

		return res;
	}
}
