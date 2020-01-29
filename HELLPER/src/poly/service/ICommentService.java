package poly.service;

import java.util.List;
import java.util.Map;

import poly.dto.CommentDTO;
import poly.dto.QnADTO;

public interface ICommentService {
	public Map<String, Object> insertComment(CommentDTO cdto, QnADTO qdto) throws Exception;
	public Map<String, Object> deleteComment(CommentDTO cdto, QnADTO qdto) throws Exception;
	public Map<String, Object> updateCommForm(CommentDTO cdto, QnADTO qdto) throws Exception;
	public Map<String, Object> updateComm(CommentDTO cdto, QnADTO qdto) throws Exception;
	public QnADTO insertUserComment(CommentDTO cdto, QnADTO qdto) throws Exception;
	public QnADTO deleteUserComment(CommentDTO cdto, QnADTO qdto) throws Exception;
	public Map<String, Object> updateUserCommentForm(CommentDTO cdto, QnADTO qdto)throws Exception;
	public QnADTO updateUserComment(CommentDTO cdto, QnADTO qdto) throws Exception;
	public int getCommentTotal(String qseq) throws Exception;
	public List<CommentDTO> getCommentList(CommentDTO pcDTO) throws Exception;
}
