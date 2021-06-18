package com.pawnini.model.adoption.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.adoption.AdoptionDTO;

@Repository
public class AdoptionDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//등록
	public void insertAdoption(AdoptionDTO dto) {
		System.out.println("등록처리");
		mybatis.insert("AdoptionDAO.insertAdoption", dto);
	}
	//수정
	public void updateAdoption(AdoptionDTO dto) {
		System.out.println("수정처리");
		mybatis.update("AdoptionDAO.updateAdoption", dto);
	}
	//삭제
	public void deleteAdoption(AdoptionDTO dto) {
		System.out.println("삭제처리");
		mybatis.delete("AdoptionDAO.deleteAdoption", dto);
	}
	//상세보기
	public AdoptionDTO getAdoption(AdoptionDTO dto) {
		System.out.println("상세보기");
		return (AdoptionDTO)mybatis.selectOne("AdoptionDAO.getAdoption",dto);
	}
	//리스트 불러오기
	public List<AdoptionDTO> getAdoptionList(AdoptionDTO dto) {
		System.out.println("목록불러오기");
		return mybatis.selectList("AdoptionDAO.getAdoptionList",dto);
	}
}
