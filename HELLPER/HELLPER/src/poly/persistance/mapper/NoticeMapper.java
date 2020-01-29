package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.NoticeDTO;

@Mapper("NoticeMapper")
public interface NoticeMapper {
	public List<NoticeDTO> getAllNotice() throws Exception;
	public void insertNotice(NoticeDTO ndto) throws Exception;
	public NoticeDTO getNoticeDetail(NoticeDTO ndto) throws Exception;
	public boolean updateNoticeDetail(NoticeDTO ndto) throws Exception;
	public boolean deleteNotice(NoticeDTO ndto) throws Exception;
	public void updateNoticeCnt(NoticeDTO ndto) throws Exception;
	public int getNoticeTotal() throws Exception;
	public List<NoticeDTO> getNoticeList(NoticeDTO pnDTO) throws Exception;
}
