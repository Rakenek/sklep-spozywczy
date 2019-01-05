package net.ko.sklepspozywczy.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalDefaultExceptionHandler {
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handlerNoHandlerFoundException()
	{
		ModelAndView mv=new ModelAndView("error");
		
		mv.addObject("errorTitle","Strona nie jest zbudowana!");
		mv.addObject("errorDescription","Strona kt�rej szukasz nie jest dost�pna teraz!");
		mv.addObject("title", "404 Error");
		
		return mv;
	}
	
	@ExceptionHandler(ProductNotFoundException.class)
	public ModelAndView handlerProductNotFoundException()
	{
		ModelAndView mv=new ModelAndView("error");
		
		mv.addObject("errorTitle","Produkt niedost�pny!");
		mv.addObject("errorDescription","Produkt kt�rego szukasz nie jest dost�pny teraz!");
		mv.addObject("title", "Produkt niedost�pny");
		
		return mv;
	}

	@ExceptionHandler(Exception.class)
	public ModelAndView handlerException(Exception ex)
	{
		ModelAndView mv=new ModelAndView("error");
		
		mv.addObject("errorTitle","Skontaktuj sie z administratorem!");
		StringWriter sw=new StringWriter();
		PrintWriter pw=new PrintWriter(sw);
		ex.printStackTrace(pw);
		
		mv.addObject("errorDescription",sw.toString());
		mv.addObject("title", "Error");
		
		return mv;
	}

}
