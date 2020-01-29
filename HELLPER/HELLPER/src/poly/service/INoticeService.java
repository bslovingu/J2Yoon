package poly.service;

import java.util.List;
import java.util.Map;

import poly.dto.NoticeDTO;

public interface INoticeService {
	public List<NoticeDTO> getAllNotice() throws Exception;
	public Map<String, Object> insertNotice(NoticeDTO ndto) throws Exception;
	public Map<String, Object> getNoticeDetail(NoticeDTO ndto) throws Exception;
	public Map<String, Object> updateNoticeDetail(NoticeDTO ndto) throws Exception;
	public Map<String, Object> deleteNotice(NoticeDTO ndto) throws Exception;
	public Map<String, Object> getAllList() throws Exception;
	public int getNoticeTotal() throws Exception;
	public List<NoticeDTO> getNoticeList(NoticeDTO pnDTO) throws Exception;
}
