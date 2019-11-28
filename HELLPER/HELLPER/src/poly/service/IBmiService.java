package poly.service;

import java.util.List;
import java.util.Map;

import poly.dto.BmiDTO;

public interface IBmiService {
	public Map<String, Object> insertBmi(BmiDTO bdto) throws Exception;
	public List<BmiDTO> userInsertBmi(BmiDTO bdto) throws Exception;
}
