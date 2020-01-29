package poly.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import poly.dto.ReservationDTO;
import poly.persistance.mapper.ReservationMapper;
import poly.service.IReservationService;

@Service("ReservationService")
public class ReservationService implements IReservationService{
	
	@Resource(name="ReservationMapper")
	private ReservationMapper reservationMapper;
	
	@Override
	public List<ReservationDTO> getAllReservation(ReservationDTO rDTO) throws Exception{
		return reservationMapper.getAllReservation(rDTO);
	}

	@Override
	public int insertReservInfo(ReservationDTO rDTO) throws Exception {
		// TODO Auto-generated method stub
		return reservationMapper.insertReservInfo(rDTO);
	}

	@Override
	public String getReservationInfo() throws Exception {
		// TODO Auto-generated method stub
		return reservationMapper.getReservationInfo();
	}

	@Override
	public List<ReservationDTO> getTodayReservInfo(ReservationDTO rDTO) throws Exception {
		// TODO Auto-generated method stub
		return reservationMapper.getTodayReservInfo(rDTO);
	}
	

}
