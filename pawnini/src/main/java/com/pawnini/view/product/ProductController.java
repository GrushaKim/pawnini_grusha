package com.pawnini.view.product;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.pawnini.model.product.ProductDTO;
import com.pawnini.model.product.ProductService;
import com.pawnini.utils.UploadFileUtils;

@Controller
@SessionAttributes("product")
public class ProductController {

	@Autowired
	private ProductService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//관리자 상품등록 페이지 이동
	@RequestMapping(value="/goInsertProduct.do")
	public String goInsertProduct() {
		return "admin/product/insertProduct";
	}
	
	//상품등록 기능처리
	@RequestMapping(value="/insertProduct.do")
	public String insertProduct(ProductDTO dto, MultipartFile file) throws Exception{
		
		System.out.println("이미지 패스 설정 실행 전");
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setProduct_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setProduct_thumb_img(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		System.out.println("이미지 패스 설정 실행 완료");
		
		service.insertProduct(dto);
		return "redirect:getProductList.do";
	}
	
	// 상품관리 리스트
	@RequestMapping(value="/getProductList.do")
	public String getProductList(ProductDTO dto, Model model) {
		model.addAttribute("productList", service.getProductList(dto));
		return "admin/product/getProductList";
	}
	
	// 삭제
	@RequestMapping(value="/deleteProduct.do")
	public String deleteProduct(ProductDTO dto) {
		service.deleteProduct(dto);
		return "redirect:getProductList.do";
	}
	
}











