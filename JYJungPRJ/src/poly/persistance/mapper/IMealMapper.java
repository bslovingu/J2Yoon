package poly.persistance.mapper;

import config.Mapper;
import poly.dto.MealDTO;

@Mapper("MealMapper")
public interface IMealMapper {

	//수집된 내용 DB에 등록
	int InsertMealInfo(MealDTO pDTO) throws Exception;
	
}
