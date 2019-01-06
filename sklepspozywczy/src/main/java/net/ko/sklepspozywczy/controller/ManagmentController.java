package net.ko.sklepspozywczy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.ko.sklepspozywczy.util.FileUploadUtility;
import net.ko.sklepspozywczy.validator.ProductValidator;
import net.ko.sklepspozywczybackend.dao.CategoryDAO;
import net.ko.sklepspozywczybackend.dao.ProductDAO;
import net.ko.sklepspozywczybackend.dto.Category;
import net.ko.sklepspozywczybackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagmentController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	private static final Logger logger=LoggerFactory.getLogger(ManagmentController.class);

	@RequestMapping(value="/products", method=RequestMethod.GET)
	public ModelAndView showManageProducts(@RequestParam(name="operation", required=false) String operation)
	{
		ModelAndView mv=new ModelAndView("page");
		
		if(operation!=null)
		{
			if(operation.equals("product")) {
				mv.addObject("message","Produkt dodany poprawnie!");
			}
		}
		
		
		mv.addObject("userClickManageProducts",true);
		mv.addObject("title","Zarz¹dzenie Produktem");
		
		Product nProduct=new Product();
		
		nProduct.setSupplierId(1);
		nProduct.setActive(true);
		
		mv.addObject("product",nProduct);
		
		return mv;
	}
	
	@RequestMapping(value="/products", method=RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product mProduct, BindingResult results, Model model, HttpServletRequest request) {
		
		if(mProduct.getId()==0)
		{
			new ProductValidator().validate(mProduct,results);
		}
		else
		{
			if(!mProduct.getFile().getOriginalFilename().equals(""))
			{
				new ProductValidator().validate(mProduct, results);
			}
		}
		
		if(results.hasErrors())
		{
			model.addAttribute("userClickManageProducts",true);
			model.addAttribute("title","Zarz¹dzenie Produktem");
			model.addAttribute("message","Nie uda³o siê dodaæ produktu, uzupe³nij prawid³owo dane");
			return "page";
		}
		
		logger.info(mProduct.toString());
		
		if(mProduct.getId()==0) {
			productDAO.add(mProduct);
		}
		else {
			productDAO.update(mProduct);
		}
		
		
		if(!mProduct.getFile().getOriginalFilename().equals("")) {
			FileUploadUtility.uploadFile(request,mProduct.getFile(),mProduct.getCode());
		}
		
		return "redirect:/manage/products?operation=product";
	}
	
	@RequestMapping(value="/product/{id}/activation",method=RequestMethod.POST)
	@ResponseBody
	public String handleProductActivation(@PathVariable int id)
	{
		Product product=productDAO.get(id);
		
		boolean isActive=product.isActive();
		product.setActive(!product.isActive());
		productDAO.update(product);
		
		return (isActive)?"Udalo ci sie deaktywowac produkt "+product.getName()+" o id = "+product.getId():"Udalo ci sie aktywowac produkt "+product.getName()+" o id = "+product.getId();
	}
	
	@ModelAttribute("categories")
	public List<Category>getCategories(){
		return categoryDAO.list();
	}
	
	
	@RequestMapping(value="/{id}/product",method=RequestMethod.GET)
	public ModelAndView showEditProduct(@PathVariable int id)
	{
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("userClickManageProducts",true);
		mv.addObject("title","Zarz¹dzenie Produktem");
		
		Product nProduct=productDAO.get(id);
		mv.addObject("product",nProduct);
		
		return mv;
	}
	
}
