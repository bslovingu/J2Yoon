package poly.persistance.mapper;

import config.Mapper;
import poly.dto.BoardDTO;

@Mapper("BoardMapper")
public interface BoardMapper {

	int insertBoardInfo(BoardDTO bDTO) throws Exception;

}
