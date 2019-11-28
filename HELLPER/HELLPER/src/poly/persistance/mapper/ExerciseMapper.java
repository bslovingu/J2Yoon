package poly.persistance.mapper;

import java.util.List;
import java.util.Map;

import config.Mapper;
import poly.dto.ExerciseDTO;

@Mapper("ExerciseMapper")
public interface ExerciseMapper {
	public List<ExerciseDTO> getAllExercise() throws Exception;
	
	public int insertExer(ExerciseDTO xdto) throws Exception;
	
	public ExerciseDTO getExerciseDetail(ExerciseDTO xdto) throws Exception;
	
	public void updateExerFile(ExerciseDTO xdto) throws Exception;
	
	public int updateExerNoFile(ExerciseDTO xdto) throws Exception;
	
	public void deleteExer(ExerciseDTO xdto) throws Exception;
	
	public void updateExerCnt(ExerciseDTO xdto) throws Exception;
}
