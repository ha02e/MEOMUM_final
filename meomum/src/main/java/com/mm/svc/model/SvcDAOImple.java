package com.mm.svc.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class SvcDAOImple implements SvcDAO {
	
	private SqlSessionTemplate sqlMap;
	
	
	public SvcDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}


	@Override
	public int svcInsert(SvcDTO dto) {
		int count = sqlMap.insert("svcInsert",dto);
		return count;
	}
	
	@Override
	public int svcDateInsert(SvcDateDTO dto) {
		int count = sqlMap.insert("svcDateInsert",dto);
		return count;
	}
	
	@Override
	public List<SvcDateDTO> svcTimeSelect(String days) {
		List<SvcDateDTO> times = sqlMap.selectList("svcTimeSelect", days);
		return times;
	}
}