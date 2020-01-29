package poly.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import poly.dto.ReservDetailDTO;
import poly.dto.ReservationDTO;
import poly.persistance.mapper.ReservDetailMapper;
import poly.service.IReservDetailService;

@Service("ReservDetailService")
public class ReservDetailService implements IReservDetailService{
	
	@Resource(name="ReservDetailMapper")
	private ReservDetailMapper reservdetailMapper;
	
	@Override
	public List<ReservDetailDTO> getAllReservDetail(ReservDetailDTO rdDTO) throws Exception{
		return reservdetailMapper.getAllReservDetail(rdDTO);
	}
	
	@Override
	public int insertReservDetailInfo(ReservDetailDTO rdDTO) throws Exception {
		// TODO Auto-generated method stub
		return reservdetailMapper.insertReservDetailInfo(rdDTO);
	}

	@Override
	public int getReservMemberTotal(String reserv_seq) throws Exception {
		// TODO Auto-generated method stub
		return reservdetailMapper.getReservMemberTotal(reserv_seq);
	}

	@Override
	public List<ReservDetailDTO> getReservList(String reserv_seq) throws Exception {
		// TODO Auto-generated method stub
		return reservdetailMapper.getReservList(reserv_seq);
	}

	@Override
	public int deleteReservDetailInfo(ReservDetailDTO rdDTO) throws Exception {
		// TODO Auto-generated method stub
		return reservdetailMapper.deleteReservDetailInfo(rdDTO);
	}

}