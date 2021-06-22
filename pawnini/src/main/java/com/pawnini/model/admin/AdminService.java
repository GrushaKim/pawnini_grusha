package com.pawnini.model.admin;

import java.util.List;

import com.pawnini.model.order.OrderDTO;
import com.pawnini.model.order.OrderListDTO;

public interface AdminService {
	
		// 관리자 주문 목록 조회
		public List<OrderDTO> getAllOrders() throws Exception;
		
		// 관리자 특정 주문 조회
		public List<OrderListDTO> getOrder(OrderDTO dto) throws Exception;
}
