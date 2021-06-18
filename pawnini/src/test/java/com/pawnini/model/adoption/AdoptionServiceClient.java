package com.pawnini.model.adoption;

import java.util.Date;
import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

//1. GenericXmlAppl.... AdoptionService class methods
//2. page 489 testing AdoptionDAO class methods

public class AdoptionServiceClient {
	public static void main(String [] args) {

		//1. Spring container 구동
		AbstractApplicationContext container = new GenericXmlApplicationContext("spring/root-context.xml");
		
		//2, Spring container로부터 AdoptionServiceImpl 객체를 lookup
		AdoptionService AdoptionService = (AdoptionService) container.getBean("adoptionService"); //AdoptionServiceImpl
		
		//3. 글 등록 기능 테스트
//		AdoptionDAOImpl AdoptionDAO = new AdoptionDAOImpl();
		
		AdoptionDTO dto = new AdoptionDTO();
		dto.setAdoption_id(1234);
		dto.setAdoption_title("title here");
		dto.setAdoption_name("name here");
		dto.setAdoption_content("oops");
		dto.setAdoption_f_image("temp");
		dto.setMember_id("Lany10");
		dto.setPaws_id(234);
		
	//	AdoptionDAO.insertAdoption(dto);
		AdoptionService.insertAdoption(dto);
		
		AdoptionService.getAdoption(dto);
		
		
//4. 글 목록 검색 기능 테스트
		List<AdoptionDTO> adoptionList = AdoptionService.getAdoptionList(dto);
		
		for (AdoptionDTO adoption : adoptionList) {
			System.out.println("===> "+adoption.toString());
		}
		
		//5. Spring container 종료
		container.close();
		
	}
	
}
