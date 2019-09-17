package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BoardDTO;
import poly.persistance.mapper.BoardMapper;
import poly.service.IBoardService;

@Service("BoardService")
public class BoardService implements IBoardService {
	
	@Resource(name="BoardMapper")
	private BoardMapper boardMapper;

	@Override
	public int insertBoardInfo(BoardDTO bDTO) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.insertBoardInfo(bDTO);
	}

}
