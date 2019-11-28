package poly.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.ExerciseDTO;
import poly.persistance.mapper.EventMapper;
import poly.persistance.mapper.ExerciseMapper;
import poly.persistance.mapper.MemberMapper;
import poly.persistance.mapper.NoticeMapper;
import poly.persistance.mapper.QnAMapper;
import poly.service.IExerciseService;

@Service("ExerciseService")
public class ExerciseService implements IExerciseService{
	@Resource(name="MemberMapper")
	private MemberMapper MemberMapper;
	
	@Resource(name="QnAMapper")
	private QnAMapper qnaMapper;
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;
	
	@Resource(name="EventMapper")
	private EventMapper eventMapper;
	
	@Resource(name="ExerciseMapper")
	private ExerciseMapper exerciseMapper;
	
	@Override
	public List<ExerciseDTO> getAllExercise() throws Exception {
		
		List<ExerciseDTO> xlist =  exerciseMapper.getAllExercise();
		return xlist;
	}

	@Override
	public int exerciseReg(ExerciseDTO xdto) throws Exception {
		
		return exerciseMapper.insertExer(xdto);
		
	}

	@Override
	public ExerciseDTO exerciseDetail(ExerciseDTO xdto) throws Exception {
		exerciseMapper.updateExerCnt(xdto);
		return exerciseMapper.getExerciseDetail(xdto);
	}

	@Override
	public void updateExer(ExerciseDTO xdto) throws Exception {
		
		if(xdto.getExer_path() != null && xdto.getExer_url() != null){
			exerciseMapper.updateExerFile(xdto);
		}else{
			exerciseMapper.updateExerNoFile(xdto);
		}
		
	}

	@Override
	public List<ExerciseDTO> deleteExer(ExerciseDTO xdto) throws Exception {
		exerciseMapper.deleteExer(xdto);
		List<ExerciseDTO> xlist = exerciseMapper.getAllExercise();
		return xlist;
	}

	@Override
	public List<ExerciseDTO> getUserExer() throws Exception {
		return exerciseMapper.getAllExercise();
	}

	@Override
	public int insertUserExerReg(ExerciseDTO xdto) throws Exception {
		
		return exerciseMapper.insertExer(xdto);
	}

	@Override
	public ExerciseDTO getUserExer(ExerciseDTO xdto) throws Exception {
		return exerciseMapper.getExerciseDetail(xdto);
	}
}
