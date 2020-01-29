package poly.persistance.mapper;

import config.Mapper;
import java.util.List;
import poly.dto.ReservationDTO;

@Mapper("ReservationMapper")
public interface ReservationMapper {
	
	public List<ReservationDTO> getAllReservation(ReservationDTO rDTO) throws Exception;

	public int insertReservInfo(ReservationDTO rDTO)throws Exception;

	public String getReservationInfo()throws Exception;

	public List<ReservationDTO> getTodayReservInfo(ReservationDTO rDTO)throws Exception;

}
