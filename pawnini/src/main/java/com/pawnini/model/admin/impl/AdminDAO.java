package com.pawnini.model.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.order.OrderDTO;
import com.pawnini.model.order.OrderListDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 관리자 주문 목록 조회
	public List<OrderDTO> getAllOrders() throws Exception{
		System.out.println("Mybatis/getAllOrders() 기능처리 시작");
		return mybatis.selectList("OrderDAO.getAllOrders");
	}
	
	// 관리자 특정 주문 조회
	public List<OrderListDTO> getOrder(OrderDTO dto) throws Exception{
		System.out.println("Mybatis/getOrder() 기능처리 시작");
		return mybatis.selectList("OrderDAO.getOrder", dto);
	}
}
