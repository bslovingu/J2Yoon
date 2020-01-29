package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.SPOFACDTO;
import poly.persistance.mapper.SpofacMapper;
import poly.service.ISpofacService;

@Service("SpofacService")
public class SpofacService implements ISpofacService {

	@Resource(name="SpofacMapper")
	private SpofacMapper spofacMapper;
	
	@Override
	public List<SPOFACDTO> getFacList() throws Exception {
		// TODO Auto-generated method stub
		return spofacMapper.getFacList();
	}
	
	@Override
	public int getFacTotal() throws Exception {
		// TODO Auto-generated method stub
		return spofacMapper.getFacTotal();
	}

	@Override
	public List<SPOFACDTO> getFacilityList(int startNum, int endNum) {
		// TODO Auto-generated method stub
		return spofacMapper.getFacilityList(startNum,endNum);
	}

	@Override
	public int getFacCount(SPOFACDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return spofacMapper.getFacCount(pDTO);
	}

	@Override
	public List<SPOFACDTO> getFacilitySearchList(SPOFACDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return spofacMapper.getFacilitySearchList(pDTO);
	}

	@Override
	public SPOFACDTO getSpofacInfo(String fseq) throws Exception {
		// TODO Auto-generated method stub
		return spofacMapper.getSpofacInfo(fseq);
	}
	
	
}
