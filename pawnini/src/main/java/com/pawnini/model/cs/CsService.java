package com.pawnini.model.cs;

import java.util.List;

public interface CsService {
	//CRUD 기능의 메소드 구현 (여기선 CsDAO interface랑 more or less 같음)
	//삽입
	void insertCs(CsDTO dto);
	//수정
	void updateCs(CsDTO dto);
	//삭제
	void deleteCs(CsDTO dto);
	//상세 조회 
	CsDTO getCs(CsDTO dto);
	//리스트!
	List<CsDTO> getCsList(CsDTO dto);

	
	//비즈니스 로직?
	
}