package com.example.view.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.project.board.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	/*
	 * @Autowired private ProductService productService;
	 */
	
	@GetMapping(value = "/index")
	public String home(Model model) {
		
		/*
		 * List<ProductVO> newProdList = productService.getNewProductList();
		 * model.addAttribute("newProductList", newProdList);
		 * 
		 * List<ProductVO> bestProdList = productService.getBestProductList();
		 * model.addAttribute("bestProductList", bestProdList);
		 */		
		return "index";
	}
	
}
