package com.pawnini.model.adoption;

import java.util.List;

public interface AdoptionService {
	
	//분양글 등록
	void insertAdoption(AdoptionDTO dto);
	
	//분양글 수정
	void updateAdoption(AdoptionDTO dto);
	
	//분양글 삭제
	void deleteAdoption(AdoptionDTO dto);
	
	//분양글 리스트
	List<AdoptionDTO> getAdoptionList(AdoptionDTO dto);
	
	//분양글 조회
	AdoptionDTO getAdoption(AdoptionDTO dto);
	

}
