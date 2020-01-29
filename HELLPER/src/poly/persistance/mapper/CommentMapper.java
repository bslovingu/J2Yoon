package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.CommentDTO;
import poly.dto.QnADTO;

@Mapper("CommentMapper")
public interface CommentMapper {
	public List<CommentDTO> getComment(QnADTO qdto) throws Exception;
	public void insertComment(CommentDTO cdto) throws Exception;
	public void deleteComment(CommentDTO cdto) throws Exception;
	public CommentDTO getOneComment(CommentDTO cdto) throws Exception;
	public void updateComment(CommentDTO cdto) throws Exception;
	public int getCommentTotal() throws Exception;
	public List<CommentDTO> getCommentList(QnADTO qDTO) throws Exception;
	public int getCommentTotal(String qseq) throws Exception;
}
