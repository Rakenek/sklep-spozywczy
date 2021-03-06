package net.ko.sklepspozywczy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.ko.sklepspozywczy.exception.ProductNotFoundException;
import net.ko.sklepspozywczybackend.dao.CategoryDAO;
import net.ko.sklepspozywczybackend.dao.ProductDAO;
import net.ko.sklepspozywczybackend.dto.Category;
import net.ko.sklepspozywczybackend.dto.Product;

@Controller
public class PageController {

	private static final Logger logger = LoggerFactory.getLogger(PageController.class);

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private ProductDAO productDAO;
	


	@RequestMapping(value = {"/","/home", "/index" })
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Strona domowa");

		logger.info("w page controllerze index -INFO");
		logger.debug("w page controllerze index -INFO");

		// przekazywanie listy kategorii
		mv.addObject("categories", categoryDAO.list());
		mv.addObject("products", productDAO.list());

		mv.addObject("userClickHome", true);
		return mv;
	}

	@RequestMapping(value = { "/about" })
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "O nas");
		mv.addObject("userClickAbout", true);
		return mv;
	}

	@RequestMapping(value = { "/contact" })
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Kontakt");
		mv.addObject("userClickContact", true);
		return mv;
	}

	@RequestMapping(value = { "/show/all/products" })
	public ModelAndView showAllProducts() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Wszystkie produkty");

		// przekazywanie listy kategorii
		mv.addObject("categories", categoryDAO.list());

		mv.addObject("userClickAllProducts", true);
		return mv;
	}

	@RequestMapping(value = { "/show/category/{id}/products" })
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("page");

		Category category = null;
		category = categoryDAO.get(id);

		mv.addObject("title", category.getName());

		// przekazywanie listy kategorii
		mv.addObject("categories", categoryDAO.list());

		// przekazywanie pojedynczej kategorii
		mv.addObject("category", category);

		mv.addObject("userClickCategoryProducts", true);
		return mv;
	}

	@RequestMapping(value = "/show/{id}/product")
	public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {
		ModelAndView mv = new ModelAndView("page");

		Product product = productDAO.get(id);

		if (product == null)
			throw new ProductNotFoundException();

		product.setViews(product.getViews() + 1);
		productDAO.update(product);

		mv.addObject("title", product.getName());
		mv.addObject("product", product);
		mv.addObject("userClickShowProduct", true);

		return mv;
	}

	/* logowanie */

	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam(name="error",required=false) String error) {
		ModelAndView mv = new ModelAndView("login");
		
		if(error!=null)
		{
			mv.addObject("message","Niepoprawny login i has�o");
		}
		
		mv.addObject("title", "Login");
		return mv;
	}
	
	@RequestMapping(value = "/access-denied")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("error");
		
		mv.addObject("title", "403 - Odmowa dost�pu");
		mv.addObject("errorTitle", "Aha! Mamy ci�!");
		mv.addObject("errorDescription", "Nie masz autoryzacji �eby przegl�da� t� strone");
		return mv;
	}

}
