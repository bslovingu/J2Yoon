package poly.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import poly.dto.QnADTO;

public interface IQnAService {
	public List<QnADTO> getAllQna() throws Exception;
	public Map<String, Object> insertQnA(QnADTO qdto) throws Exception;
	public Map<String, Object> getAllList() throws Exception; 
	public Map<String, Object> getQnADetail(QnADTO qdto) throws Exception;
	public Map<String, Object> deleteQnA(QnADTO qdto) throws Exception;
	public Map<String, Object> qnAUpdateForm(QnADTO qdto) throws Exception;
	public Map<String, Object> updateQnA(QnADTO qdto) throws Exception;
	public QnADTO getUserQnADetail(QnADTO qdto) throws Exception;
	public int insertUserQnA(QnADTO qdto) throws Exception;
	public int deleteUserQnA(QnADTO qdto) throws Exception;
	public int updateUserQnA(QnADTO qdto) throws Exception;
	public int getQnaTotal() throws Exception;
	public List<QnADTO> getQnaList(QnADTO pDTO) throws Exception;
}
