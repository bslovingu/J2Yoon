package poly.service;

import java.util.List;

import poly.dto.SPOFACDTO;

public interface ISpofacService {

	List<SPOFACDTO> getFacList() throws Exception;
	public int getFacTotal() throws Exception;
	List<SPOFACDTO> getFacilityList(int startNum, int endNum);

}
