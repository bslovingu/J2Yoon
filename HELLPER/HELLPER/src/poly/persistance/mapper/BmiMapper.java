package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BmiDTO;
@Mapper("BmiMapper")
public interface BmiMapper {
	public void insertBmi(BmiDTO bdto) throws Exception;
	public List<BmiDTO> getBmi(BmiDTO bdto) throws Exception;
	
}
