package com.first.biz.hearts.impl;

import java.util.List;

import com.first.biz.hearts.HeartsVO;

public interface HeartsService {

	public void insertHearts(HeartsVO vo);
	public HeartsVO getHearts(HeartsVO vo);
	public void deleteHearts(HeartsVO vo);
	public String getCountHearts(HeartsVO vo);
	public List<HeartsVO> getHeartList(HeartsVO vo);
}
