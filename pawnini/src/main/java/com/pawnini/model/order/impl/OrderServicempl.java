package com.pawnini.model.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.order.CartDTO;
import com.pawnini.model.order.OrderDTO;
import com.pawnini.model.order.OrderDetailsDTO;
import com.pawnini.model.order.OrderListDTO;
import com.pawnini.model.order.OrderService;

@Service("orderService")
public class OrderServicempl implements OrderService {
	@Autowired
	OrderDAO dao;

	@Override
	public void insertOrder(OrderDTO dto) throws Exception {
		System.out.println("주문서 삽입");
		dao.insertOrder(dto);
	}

	@Override
	public void insertOrderDetails(OrderDetailsDTO dtoList) throws Exception {
		System.out.println("상세주문서 삽입");
		dao.insertOrderDetails(dtoList);
	}
	
	@Override
	public List<OrderDTO> getOrderList(OrderDTO dto) throws Exception{
		System.out.println("주문 목록 불러오기");
		return dao.getOrderList(dto);
	}
	
	@Override
	public List<OrderListDTO> getOrderDetails(OrderDTO dto) throws Exception{
		System.out.println("상세주문 불러오기");
		return dao.getOrderDetails(dto);
	}

	@Override
	public void addToCart(CartDTO dto) throws Exception {
		System.out.println("장바구니 추가");
		dao.addToCart(dto);
	}

	@Override
	public List<CartDTO> getCartList(String member_id) throws Exception {
		System.out.println("장바구니 목록");
		return dao.getCartList(member_id);
	}

	@Override
	public void modifyCart(CartDTO dto) throws Exception {
		System.out.println("장바구니 수정");
		dao.modifyCart(dto);
		System.out.println("장바구니 수정 완료");
	}
	
	@Override
	public int countCart(int product_id, String member_id) throws Exception{
		System.out.println("장바구니 중복 체크");
		return dao.countCart(product_id, member_id);
	}
	
	@Override
	public void checkOverlap(CartDTO dto) throws Exception {
		System.out.println("장바구니 중복 상품 수량 합치기");
		dao.checkOverlap(dto);
	}
	
	@Override
	public void deleteCartId(int cart_id) throws Exception{
		System.out.println("장바구니 삭제");
		dao.deleteCartId(cart_id);
	}
	
	@Override
	public void deleteCartByMember(String member_id) throws Exception {
		System.out.println("특정 회원 장바구니 삭제");
		dao.deleteCartByMember(member_id);
	}

	public int getSum(String member_id) throws Exception {
		System.out.println("장바구니 금액 합계");
		return dao.getSum(member_id);
	}

}




