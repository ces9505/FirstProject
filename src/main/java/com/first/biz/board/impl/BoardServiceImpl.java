package com.first.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.biz.board.BoardVO;

@Service("BoardSevice")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(BoardVO vo) {

		boardDAO.insertBoard(vo);

	}

	@Override
	public List<BoardVO> getCommonList(BoardVO vo) {

		return boardDAO.getCommonList(vo);

	}

	@Override
	public BoardVO getBoard(BoardVO vo) {

		return boardDAO.getBoard(vo);
	}

	@Override
	public List<BoardVO> getPlaceList(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.getPlaceList(vo);
	}

	@Override
	public void setBoardHeart(BoardVO vo) {
		boardDAO.setBoardHeart(vo);

	}
	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	
	}
	@Override
	public void renting(BoardVO vo) {
		boardDAO.renting(vo);
		
	}
}
