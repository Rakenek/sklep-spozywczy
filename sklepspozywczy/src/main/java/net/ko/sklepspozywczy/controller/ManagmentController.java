package net.ko.sklepspozywczy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manage")
public class ManagmentController {

	@RequestMapping(value="/products", method=RequestMethod.GET)
	public ModelAndView showManageProducts()
	{
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("userClickManageProducts",true);
		mv.addObject("title","Zarz�dzenie Produktem");
		
		return mv;
	}
	
}
