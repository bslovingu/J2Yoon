package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.QnADTO;

@Mapper("QnAMapper")
public interface QnAMapper {
	public List<QnADTO> getAllQna() throws Exception;
	public void insertQnA(QnADTO qdto) throws Exception;
	public QnADTO getQnADetail(QnADTO qdto) throws Exception;
	public void deleteQnA(QnADTO qdto) throws Exception;
	public void updateQnA(QnADTO qdto) throws Exception;
	public int insertUserQnA(QnADTO qdto) throws Exception;
	public int deleteUserQnA(QnADTO qdto) throws Exception;
	public int updateUserQnA(QnADTO qdto) throws Exception;
	public void updateQnACnt(QnADTO qdto) throws Exception;
	public int getQnaTotal() throws Exception;
	public List<QnADTO> getQnaList(QnADTO pDTO) throws Exception;
}
