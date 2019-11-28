package poly.service;

import java.util.List;
import java.util.Map;

import poly.dto.ExerciseDTO;

public interface IExerciseService {
	public List<ExerciseDTO> getAllExercise() throws Exception;
	
	public int exerciseReg(ExerciseDTO xdto ) throws Exception;

	public ExerciseDTO exerciseDetail(ExerciseDTO xdto) throws Exception;
	
	public void updateExer(ExerciseDTO xdto) throws Exception;
	
	public List<ExerciseDTO> deleteExer(ExerciseDTO xdto) throws Exception;
	
	public List<ExerciseDTO> getUserExer() throws Exception;
	
	public int insertUserExerReg(ExerciseDTO xdto) throws Exception;
	
	public ExerciseDTO getUserExer(ExerciseDTO xdto) throws Exception;
}
