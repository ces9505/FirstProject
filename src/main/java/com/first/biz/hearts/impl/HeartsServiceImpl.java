package com.first.biz.hearts.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.biz.hearts.HeartsVO;



@Service("HeartsSevice")
public class HeartsServiceImpl implements HeartsService{


	@Autowired
	private HeartsDAO heartsDAO;
	

	@Override
	public void insertHearts(HeartsVO vo) {
		
		heartsDAO.insertHeart(vo);
		
	}
	
	@Override
	public HeartsVO getHearts(HeartsVO vo) {
		// TODO Auto-generated method stub
		return heartsDAO.getHearts(vo);
	}
	@Override
	public void deleteHearts(HeartsVO vo) {
		heartsDAO.deleteHearts(vo);
		
	}
	@Override
	public String getCountHearts(HeartsVO vo) {
		
		return heartsDAO.getCountHearts(vo);
	}
	
	@Override
	public List<HeartsVO> getHeartList(HeartsVO vo) {
		// TODO Auto-generated method stub
		return heartsDAO.getHeartList(vo);
	}
}
