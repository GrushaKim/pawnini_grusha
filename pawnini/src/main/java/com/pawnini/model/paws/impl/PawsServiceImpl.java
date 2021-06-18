package com.pawnini.model.paws.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.paws.PawsDTO;
import com.pawnini.model.paws.PawsService;

@Service("pawsService")
public class PawsServiceImpl implements PawsService {

	@Autowired
	private PawsDAO pawsDAO;
	
	@Override
	public void insertPaws(PawsDTO dto) {
		pawsDAO.insertPaws(dto);
	}

	@Override
	public void updatePaws(PawsDTO dto) {
		pawsDAO.updatePaws(dto);
	}

	@Override
	public void deletePaws(PawsDTO dto) {
		pawsDAO.deletePaws(dto);
	}

	@Override
	public List<PawsDTO> getPawsList(PawsDTO dto) {
		return pawsDAO.getPawsList(dto);
	}

	@Override
	public PawsDTO getPaws(PawsDTO dto) {
		return pawsDAO.getPaws(dto);
	}

	@Override
	public int getCountPaws(PawsDTO dto) {
		return pawsDAO.getCountPaws(dto);
	}

}
