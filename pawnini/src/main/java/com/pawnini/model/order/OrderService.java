package com.pawnini.model.order;

import java.util.List;

public interface OrderService {
	
	//주문 정보 삽입
	public void insertOrder(OrderDTO dto) throws Exception;
	
	//상세주문 정보 삽입
	public void insertOrderDetails(OrderDetailsDTO dto) throws Exception;
	
	//특정 ID 주문 정보 불러오기
	public List<OrderDTO> getOrderList(OrderDTO dto) throws Exception;
	
	//상세주문 보기
	public List<OrderListDTO> getOrderDetails(OrderDTO dto) throws Exception;
	
	//장바구니 제품 추가
	public void addToCart(CartDTO dto) throws Exception;
	
	//장바구니 목록 불러오기
	public List<CartDTO> getCartList(String member_id) throws Exception;
	
	//장바구니 수정
	public void modifyCart(CartDTO dto) throws Exception;
	
	//장바구니 중복 제품 확인
	public int countCart(int product_id, String member_id) throws Exception;
	
	//장바구니 중복 제품 수량 합치기
	public void checkOverlap(CartDTO dto) throws Exception;
	
	//장바구니 ID 삭제
	public void deleteCartId(int cart_id) throws Exception;
	
	//특정 회원 장바구니 삭제
	public void deleteCartByMember(String member_id) throws Exception;
	
	//장바구니 금액 합계 구하기
	public int getSum(String member_id) throws Exception;
}
