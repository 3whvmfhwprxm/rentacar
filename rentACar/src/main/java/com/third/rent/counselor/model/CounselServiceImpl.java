package com.third.rent.counselor.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CounselServiceImpl implements CounselService{

	@Autowired
	private CounselDAO counselDao;
	
	@Override
	public int counselInsert(CounselVO vo) {
		return counselDao.counselInsert(vo);
	}
	
}
