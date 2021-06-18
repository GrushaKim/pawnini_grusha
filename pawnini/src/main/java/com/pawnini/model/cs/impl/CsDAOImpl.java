package com.pawnini.model.cs.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.cs.CsDTO;

//DAO
@Repository
public class CsDAOImpl implements CsDAO {
	
	@Autowired
	private SqlSessionTemplate  mybatis;	
	
	public void insertCs(CsDTO dto) {
		System.out.println("---> Mybatis로 insertCs() 기능 처리");
		mybatis.insert("CsDAO.insertCs", dto);  
		//"CsDAO" => refer to namespace of a mapper @ cs-mapping.xml
		System.out.println("---> Mybatis로 insertCs() 실행 완료");
	}
	
	public void updateCs(CsDTO dto) {
		System.out.println("---> Mybatis로 updateCs() 기능 처리");
		mybatis.update("CsDAO.updateCs", dto);  
		System.out.println("---> Mybatis로 updateCs() 실행 완료");
	}
	
	public void deleteCs(CsDTO dto) {
		System.out.println("---> Mybatis로 deleteCs() 기능 처리");
		mybatis.delete("CsDAO.deleteCs", dto);  
		System.out.println("---> Mybatis로 deleteCs() 실행 완료");
	}	
	
	public CsDTO getCs(CsDTO dto) {
		System.out.println("--> Mybatis로 getCs() 기능 처리");
		return  (CsDTO)  mybatis.selectOne("CsDAO.getCs", dto);
	}
	
	public List<CsDTO> getCsList(CsDTO dto) {
		System.out.println("---> Mybatis로 getCsList() 기능 처리");
		return mybatis.selectList("CsDAO.getCsList", dto);
	}
}
