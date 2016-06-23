package com.kitri.shopping.product;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	@Resource(name="productService")
	private ProductService service;
	
	
	@RequestMapping(value="/product/list.do")
	public ModelAndView product_list(){
		ModelAndView mav=new ModelAndView("/product/list");
		List<Product> list=service.getAllProduct();
		mav.addObject("list", list);
		return mav;
	}
}
