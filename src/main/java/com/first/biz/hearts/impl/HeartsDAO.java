package com.first.biz.hearts.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.first.biz.hearts.HeartsVO;

@Repository
public class HeartsDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertHeart(HeartsVO vo) {
		System.out.println("마이바티스 찜목록 추가");
		mybatis.insert("HeartsDAO.insertHearts",vo);
		
		
	}

	public HeartsVO getHearts(HeartsVO vo) {
		System.out.println("마이바티스 찜유무확인");
		
		return mybatis.selectOne("HeartsDAO.getHearts", vo);
	}

	public void deleteHearts(HeartsVO vo) {
		System.out.println("마이바티스 찜삭제");
		mybatis.delete("HeartsDAO.deleteHearts",vo);
	}

	public String getCountHearts(HeartsVO vo) {
		System.out.println("마이바티스 찜갯수");
		
		return mybatis.selectOne("HeartsDAO.getCountHearts",vo).toString();
	}

	public List<HeartsVO> getHeartList(HeartsVO vo) {
		System.out.println("마이바티스 찜리스트 확인");
		
		
		return mybatis.selectList("HeartsDAO.getHeartList", vo);
	}
	
	
}
