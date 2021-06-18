package com.pawnini.model.adoption.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.adoption.AdoptionDTO;
import com.pawnini.model.adoption.AdoptionService;

@Service("adoptionService")
public class AdoptionServiceImpl implements AdoptionService {

	@Autowired
	private AdoptionDAO adoptionDAO;
	
	@Override
	public void insertAdoption(AdoptionDTO dto) {
		adoptionDAO.insertAdoption(dto);
	}

	@Override
	public void updateAdoption(AdoptionDTO dto) {
		adoptionDAO.updateAdoption(dto);
	}

	@Override
	public void deleteAdoption(AdoptionDTO dto) {
		adoptionDAO.deleteAdoption(dto);
	}

	@Override
	public List<AdoptionDTO> getAdoptionList(AdoptionDTO dto) {
		return adoptionDAO.getAdoptionList(dto); 
	}

	@Override
	public AdoptionDTO getAdoption(AdoptionDTO dto) {
		return adoptionDAO.getAdoption(dto);
	}

}
