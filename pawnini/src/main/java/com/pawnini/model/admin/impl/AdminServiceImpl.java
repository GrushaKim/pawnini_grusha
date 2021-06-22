package com.pawnini.model.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.admin.AdminService;
import com.pawnini.model.order.OrderDTO;
import com.pawnini.model.order.OrderListDTO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDAO dao;

	@Override
	public List<OrderDTO> getAllOrders() throws Exception {
		System.out.println("관리자 주문 목록 불러오기");
		return dao.getAllOrders();
	}

	@Override
	public List<OrderListDTO> getOrder(OrderDTO dto) throws Exception {
		System.out.println("관리자 특정 주문 불러오기");
		return dao.getOrder(dto);
	}
	
	

}
