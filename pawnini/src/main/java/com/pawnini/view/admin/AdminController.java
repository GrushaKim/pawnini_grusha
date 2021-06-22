package com.pawnini.view.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pawnini.model.admin.AdminService;
import com.pawnini.model.order.OrderDTO;
import com.pawnini.model.order.OrderListDTO;

@Controller
@SessionAttributes("admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="getAllOrders.do", method=RequestMethod.GET)
	public String getAllOrders(Model model) throws Exception {
		
		List<OrderDTO> allOrders = adminService.getAllOrders();
		
		model.addAttribute("allOrders", allOrders);
	
		return "admin/order/getAllOrders";
	}
	
	@RequestMapping(value="getOrder.do", method=RequestMethod.GET)
	public String getOrder(@RequestParam("num") String ord_id, OrderDTO dto, Model model) throws Exception {
		
		dto.setOrd_id(ord_id);
		List<OrderListDTO> spOrder = adminService.getOrder(dto);
		
		model.addAttribute("spOrder", spOrder);
		
		return "admin/order/getOrder";
	}
}
