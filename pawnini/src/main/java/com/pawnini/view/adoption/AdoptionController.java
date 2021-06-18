package com.pawnini.view.adoption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pawnini.model.adoption.AdoptionDTO;
import com.pawnini.model.adoption.AdoptionService;

@Controller
@SessionAttributes("adoption")
public class AdoptionController {

	@Autowired
	private AdoptionService adoptionService;
	
	@RequestMapping("goUpdate.do")
	public String goUpdate() {
		return "adoption/updateAdoption";
	}
	
	// 등록폴더 이동
	@RequestMapping("/goInsert.do")
	public String goInsertAdoption() {
		return "adoption/insertAdoption";
	}
	
	// 분양글 등록
	@RequestMapping("/insertAdoption.do")
	public String insertAdoption(AdoptionDTO dto) {
		adoptionService.insertAdoption(dto);
		return "redirect:getAdoptionList.do";
	}
	
	// 분양글 삭제
	@RequestMapping("/deleteAdoption.do")
	public String deleteAdoption(AdoptionDTO dto) {
		adoptionService.deleteAdoption(dto);
		return "redirect:getAdoptionList.do";
	}
	
	// 상세 등록
	@RequestMapping("/getAdoption.do")
	public String getAdoption(AdoptionDTO dto, Model model) {
		model.addAttribute("adoption",adoptionService.getAdoption(dto));
		return "adoption/getAdoption";
	}
	
	// 수정
	@RequestMapping("/updateAdoption.do")
	public String updateAdoption(AdoptionDTO dto) {
		adoptionService.updateAdoption(dto);
		return "redirect:getAdoptionList.do";
	}
	
	// 리스트 조회
	@RequestMapping("/getAdoptionList.do")
	public String getAdoptionList(AdoptionDTO dto, Model model) {
		model.addAttribute("adoptionList",adoptionService.getAdoptionList(dto));
		return "adoption/getAdoptionList";
	}
	
	
}

