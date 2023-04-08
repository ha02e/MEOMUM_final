package com.mm.order.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mm.pro.model.ProDTO;

public class OrderDAOImple implements OrderDAO {

	private SqlSessionTemplate sqlMap;

	public OrderDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public ProDTO orderList(int idx) {
		ProDTO dto = sqlMap.selectOne("orderList", idx);
		return dto;
	}

	@Override
	public int orderInsert(OrderDTO dto) {
		int count = sqlMap.insert("orderInsert", dto);
		return count;
	}

	@Override
	public List<OrderDTO> myOrderList(Integer idx) {
		List<OrderDTO> list = sqlMap.selectList("myOrderList", idx);
		return list;
	}

	@Override
	public List<OrderReportDTO> orderReport(Map map) {
		List<OrderReportDTO> lists = sqlMap.selectList("orderReport", map);
		return lists;
	}

	@Override
	public int reportTotalCnt() {
		int count = sqlMap.selectOne("reportTotalCnt");
		count = count == 0 ? 1 : count;
		return count;
	}
}