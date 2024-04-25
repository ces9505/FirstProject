package com.first.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.first.biz.board.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertBoard(BoardVO vo) {
		
		System.out.println("MYbatis insertboard 처리");
		mybatis.insert("BoardDAO.insertBoard", vo);
		
		
	}
	public List<BoardVO> getCommonList(BoardVO vo) {
		System.out.println("MYbatis getCommonList 처리");
		List<BoardVO> commonList = mybatis.selectList("BoardDAO.getCommonList", vo);
		System.out.println(commonList.get(0).getTitle());
		return commonList;
	}
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("MYbatis getBoard 처리");
		mybatis.update("BoardDAO.updateView", vo);	
		return mybatis.selectOne("BoardDAO.getBoard", vo);
	}
	public List<BoardVO> getPlaceList(BoardVO vo) {
		System.out.println("MYbatis getPlaceList 처리");
		List<BoardVO> placeList = mybatis.selectList("BoardDAO.getPlaceList", vo);
		
		return placeList;
	}
	public void setBoardHeart(BoardVO vo) {
		System.out.println("마이바티스 찜 셋");
		mybatis.update("BoardDAO.setBoardHeart", vo);
		
	}
	public void deleteBoard(BoardVO vo) {
		System.out.println("마이바티스 게시글삭제");
		mybatis.delete("BoardDAO.deleteBoard", vo);
		
	}
	public void updateBoard(BoardVO vo) {
		System.out.println("마미바티스 업데이트");
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	public void renting(BoardVO vo) {
		System.out.println("마이바티스 렌팅 전환");
		mybatis.update("BoardDAO.renting",vo);
	}

	
}
