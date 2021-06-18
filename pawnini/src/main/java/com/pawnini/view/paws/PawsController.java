package com.pawnini.view.paws;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pawnini.model.paws.PawsDTO;
import com.pawnini.model.paws.PawsService;

@Controller
@SessionAttributes("paws")
public class PawsController {

	@Autowired
	private PawsService pawsService;
	
	//정보 등록 뷰 페이지 이동
	@RequestMapping("/goInsertPaws.do")
	public String goInsertPaws() {
		return "paws/insertPaws";
	}
	
	//정보 등록
	@RequestMapping("/insertPaws.do")
	public String insertPaws(PawsDTO dto) {
		pawsService.insertPaws(dto);
		return "redirect:getPawsList.do";
	}
	
	//리스트 불러오기
	@RequestMapping("/getPawsList.do")
	public String getPawsList(PawsDTO dto, Model model) {
		model.addAttribute("pawsList",pawsService.getPawsList(dto));
		return "paws/getPawsList";
	}
	
	//정보 삭제
	@RequestMapping("/deletePaws.do")
	public String deletePaws(PawsDTO dto) {
		pawsService.deletePaws(dto);
		return "redirect:getPawsList.do";
	}
	
	//상세 조회
	@RequestMapping("/getPaws.do")
	public String getPaws(PawsDTO dto, Model model) {
		model.addAttribute("paws", pawsService.getPaws(dto));
		return "paws/getPaws";
	}
	
	//정보 수정
	@RequestMapping("/updatePaws.do")
	public String updatePaws(PawsDTO dto) {
		pawsService.updatePaws(dto);
		return "redirect:getPawsList.do";
	}
	
}












