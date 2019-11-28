package poly.persistance.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import config.Mapper;
import poly.dto.SPOFACDTO;

@Mapper("SpofacMapper")
public interface SpofacMapper {

	List<SPOFACDTO> getFacList();
	public int getFacTotal() throws Exception;
	List<SPOFACDTO> getFacilityList(@Param("startNum")int startNum, @Param("endNum")int endNum);

	
}
