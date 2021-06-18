package com.pawnini.model.cs.impl;

import java.util.List;

import com.pawnini.model.cs.CsDTO;

public interface CsDAO {
	
	//삽입
	 void insertCs(CsDTO dto);
	//수정
	 void updateCs(CsDTO dto);
	//삭제
	 void deleteCs(CsDTO dto);
	 //상세 조회할때 
	 CsDTO getCs(CsDTO dto);
	 //리스트 
	 List<CsDTO> getCsList(CsDTO dto);
		 	  
}
