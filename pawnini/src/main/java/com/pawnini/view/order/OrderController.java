package com.pawnini.view.order;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.pawnini.model.member.MemberDTO;
import com.pawnini.model.order.CartDTO;
import com.pawnini.model.order.OrderDTO;
import com.pawnini.model.order.OrderDetailsDTO;
import com.pawnini.model.order.OrderListDTO;
import com.pawnini.model.order.OrderService;

@Controller
@SessionAttributes("order")
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value="orderFormView.do")
	public ModelAndView orderFormView(HttpSession session, ModelAndView mav) throws Exception{
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String member_id = member.getMember_id();
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartDTO> cartList = orderService.getCartList(member_id);
		
		int sumTotal = orderService.getSum(member_id);
		int shippingFee = sumTotal >= 50000 ? 0 : 2500;
		
		map.put("cartList",  cartList);
		map.put("count",  cartList.size());
		map.put("sumTotal",  sumTotal);
		map.put("shippingFee",  shippingFee);
		map.put("finalSum", sumTotal+shippingFee);
		mav.setViewName("order/orderForm");
		mav.addObject("map", map);
		
		return mav;
		
	}
	
	@RequestMapping(value="insertOrder.do", method=RequestMethod.POST)
	public String order(HttpSession session, OrderDTO dto, OrderDetailsDTO dtoList) throws Exception{
		System.out.println("insertOrder.do 작동");
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String member_id = member.getMember_id();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i=1; i<=3; i++) {
			subNum += (int)(Math.random()*10);
		}

		String ord_id = ymd + "_" + subNum;
		
		dto.setOrd_id(ord_id);
		dto.setMember_id(member_id);
		
		orderService.insertOrder(dto);
		
		dtoList.setOrd_id(ord_id);
		orderService.insertOrderDetails(dtoList);
		
		orderService.deleteCartByMember(member_id);
		
		return "redirect:main.do";
		
	}
	
	@RequestMapping(value="getOrderList.do", method=RequestMethod.GET)
	public String getOrderList(HttpSession session, OrderDTO dto, Model model) throws Exception {
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String member_id = member.getMember_id();
		
		dto.setMember_id(member_id);
		
		List<OrderDTO> orderList = orderService.getOrderList(dto);
		
		model.addAttribute("orderList", orderList);
		
		return "order/getOrderList";
		
	}
	
	@RequestMapping(value="getOrderDetails.do", method=RequestMethod.GET)
	public String getOrderDetails(HttpSession session, @RequestParam("num") String ord_id, OrderDTO dto, Model model) throws Exception {
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String member_id = member.getMember_id();
		
		dto.setMember_id(member_id);
		dto.setOrd_id(ord_id);
		
		List<OrderListDTO> orderDetails = orderService.getOrderDetails(dto);
		
		model.addAttribute("orderDetails", orderDetails);
		
		return "order/getOrderDetails";
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="addToCart.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String addToCart(@ModelAttribute CartDTO dto, HttpSession session) throws Exception {
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String member_id = member.getMember_id();
		dto.setMember_id(member_id);
		
		int product_id = dto.getProduct_id();
		
		int count = orderService.countCart(product_id, member_id);
		
		if(member != null) {
		if(count == 0) {
			orderService.addToCart(dto);
		} else {
			orderService.checkOverlap(dto);
		}
		}
		
		return "redirect:/getCartList.do";
		
	}
	
	@ResponseBody
	@RequestMapping(value="getCartList.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getCartList(HttpSession session, ModelAndView mav) throws Exception {
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String member_id = member.getMember_id();
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartDTO> cartList = orderService.getCartList(member_id);
		
		int sumTotal = orderService.getSum(member_id);
		int shippingFee = sumTotal >= 50000 ? 0 : 2500;
		
		map.put("cartList",  cartList);
		map.put("count",  cartList.size());
		map.put("sumTotal",  sumTotal);
		map.put("shippingFee",  shippingFee);
		map.put("finalSum", sumTotal+shippingFee);
		mav.setViewName("order/getCartList");
		mav.addObject("map", map);
		return mav;
		
	}
	
	@ResponseBody
	@RequestMapping(value="updateCart.do", method=RequestMethod.POST)
	public String updateCart(@RequestParam int[] cart_amount, @RequestParam int[] product_id, 
								HttpSession session) throws Exception{
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String member_id = member.getMember_id();
		
		for(int i=0; i<product_id.length; i++) {
			CartDTO dto = new CartDTO();
			dto.setMember_id(member_id);
			dto.setCart_amount(cart_amount[i]);
			dto.setProduct_id(product_id[i]);
			orderService.modifyCart(dto);
		}
		
		//redirect 작동 여부 재확인
		return "redirect:getCartList.do";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteCart.do", method=RequestMethod.POST)
	public String deleteCart(@RequestParam int cart_id) throws Exception {
		orderService.deleteCartId(cart_id);
		
		//redirect 작동 여부 재확인
		return "redirect:getCartList.do";
	}
	

	/*@RequestMapping(value="getCartList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getCartList(HttpSession session, Model model) throws Exception {
		System.out.println("getCartList.do 작동");
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String member_id = member.getMember_id();
		List<CartListDTO> cartList = orderService.getCartList(member_id);

		model.addAttribute("cartList", cartList);
		
		return "order/getCartList";
		
	}*/
	
	/*@ResponseBody
	@RequestMapping(value="deleteCart.do", method=RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value="chbox[]") List<String> chArr, CartDTO dto) throws Exception{
			System.out.println("deleteCart.do 작동");
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String member_id = member.getMember_id();
		
		int result = 0;
		int cart_id = 0;
		
		
		if(member != null) {
			dto.setMember_id(member_id);
			
			for(String i : chArr) {
				cart_id = Integer.parseInt(i);
				dto.setCart_id(cart_id);
				orderService.deleteCart(dto);
			}
			result = 1;
		}
		return result;
	}*/
	
	
	
}
