package com.pawnini.view.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pawnini.model.cs.CsDTO;
import com.pawnini.model.cs.CsService;
import com.pawnini.model.cs.impl.CsDAO;


//@SessionAttributes => HttpSession에 저장시켜주는 애노테이션
@Controller
@SessionAttributes("cs")
public class CsController {
	
	@Autowired
	private CsService csService;
	
	//글 등록
	@RequestMapping("/insertCs.do")
	public String insertCs(CsDTO dto, CsDAO csDAO) {
		csDAO.insertCs(dto);
		return "redirect:insertCs.do"; //리다이렉트로 넘기기 (final url변경되어 insertCs.do doesn't show)
	}
	//글 수정
	@RequestMapping("/updateCs.do")
	public String updateCs(CsDTO dto, CsDAO csDAO) {
		csDAO.insertCs(dto);
		return "redirect:getCsList.do";
	}
	
	//글 삭제
	@RequestMapping("/deleteCs.do")
	public String deleteCs(CsDTO dto, CsDAO csDAO) {
		csDAO.deleteCs(dto);
		return "redirect:getCsList.do";
	}
	
	@RequestMapping("/getCs.do")
	public String getCs(CsDTO dto, Model model) {		//model 정보 저장
		model.addAttribute("cs", csService.getCs(dto));
		return "cs/getCs";//view 이름 리턴
	}
	
	//이거 고쳐줘야함 (temporary)
	@RequestMapping("/getCsList.do")
	public String getCsList(CsDTO dto, Model model) {
		//Model 정보저장
		model.addAttribute("csList", csService.getCsList(dto));
		return "cs/getCsList";
	}
}
