package poly.service;

import java.util.List;

import poly.dto.ReservDetailDTO;
import poly.dto.ReservationDTO;

public interface IReservDetailService {

	public List<ReservDetailDTO> getAllReservDetail(ReservDetailDTO rdDTO) throws Exception;

	public int insertReservDetailInfo(ReservDetailDTO rdDTO) throws Exception;

	public int getReservMemberTotal(String reserv_seq) throws Exception;

	public List<ReservDetailDTO> getReservList(String reserv_seq) throws Exception;

	public int deleteReservDetailInfo(ReservDetailDTO rdDTO) throws Exception;

}
