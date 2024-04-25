package com.first.biz.board.impl;

import java.util.List;

import com.first.biz.board.BoardVO;

public interface BoardService {

	public void insertBoard(BoardVO vo);

	public List<BoardVO> getCommonList(BoardVO vo);

	public BoardVO getBoard(BoardVO vo);

	public List<BoardVO> getPlaceList(BoardVO vo);

	public void setBoardHeart(BoardVO vo);

	public void deleteBoard(BoardVO vo);

	public void updateBoard(BoardVO vo);

	public void renting(BoardVO vo);

	
	
	
	
}
