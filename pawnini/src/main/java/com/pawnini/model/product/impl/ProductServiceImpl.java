package com.pawnini.model.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.product.ProductDTO;
import com.pawnini.model.product.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public void insertProduct(ProductDTO dto) {
		productDAO.insertProduct(dto);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		productDAO.updateProduct(dto);
	}

	@Override
	public void deleteProduct(ProductDTO dto) {
		productDAO.deleteProduct(dto);
	}

	@Override
	public List<ProductDTO> getProductList(ProductDTO dto) {
		return productDAO.getProductList(dto);
	}

	@Override
	public ProductDTO getProduct(ProductDTO dto) {
		return productDAO.getProduct(dto);
	}

	@Override
	public int getCountProduct(ProductDTO dto) {
		return productDAO.getCountProduct(dto);
	}

}
