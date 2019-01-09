package net.ko.sklepspozywczybackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.ko.sklepspozywczybackend.dao.UserDAO;
import net.ko.sklepspozywczybackend.dto.Address;
import net.ko.sklepspozywczybackend.dto.Cart;
import net.ko.sklepspozywczybackend.dto.User;

public class UserTestCase {
	
	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user=null;
	private Cart cart=null;
	private Address address=null;
	
	@BeforeClass
	public static void init()
	{
		context=new AnnotationConfigApplicationContext();
		context.scan("net.ko.sklepspozywczybackend");
		context.refresh();
		
		userDAO=(UserDAO) context.getBean("userDAO");
	}
	
/*	@Test
	public void testAdd()
	{
		user=new User();
		user.setFirstName("Sławomir");
		user.setLastName("Złoty");
		user.setEmail("so@gmail.com");
		user.setContactNumber("823940923");
		user.setRole("USER");
		user.setPassword("uzytkownik");
		
		assertEquals("nie udalo sie stworzyc uzytkownika!",true,userDAO.addUser(user));
		
		address=new Address();
		address.setAdressLineOne("Daleszyce");
		address.setAdressLineOne("Brzechów 62");
		address.setCity("Kielce");
		address.setState("Świętokrzyskie");
		address.setCountry("Polska");
		address.setPostalCode("26-021");
		address.setBilling(true);
		address.setUserId(user.getId());
		
		assertEquals("nie udalo sie utworzyc adresu!",true,userDAO.addAddress(address));
		
		if(user.getRole().equals("USER"))
		{
			cart= new Cart();
			cart.setUser(user);
			
			assertEquals("nie udalo sie stworzyc koszyka",true,userDAO.addCart(cart));
			
			address=new Address();
			address.setAdressLineOne("Daleszyce");
			address.setAdressLineOne("Brzechów 63");
			address.setCity("Kielce");
			address.setState("Świętokrzyskie");
			address.setCountry("Polska");
			address.setPostalCode("26-021");
			address.setShipping(true);
			
			address.setUserId(user.getId());
			assertEquals("nie udalo sie dodac adresu dostawy",true,userDAO.addAddress(address));
		}	
	}*/
	
/*	@Test
	public void testAdd()
	{
		user=new User();
		user.setFirstName("Sławomir");
		user.setLastName("Złoty");
		user.setEmail("so@gmail.com");
		user.setContactNumber("823940923");
		user.setRole("USER");
		user.setPassword("user");
		
		if(user.getRole().equals("USER"))
		{
			cart= new Cart();
			cart.setUser(user);
			
			user.setCart(cart);		
		}	
		
		assertEquals("nie udalo sie stworzyc uzytkownika!",true,userDAO.addUser(user));
		

		
		
	}*/
	
	@Test
	public void testUpdateCart() {
		user=userDAO.getByEmail("so@gmail.com");
		
		cart=user.getCart();
		cart.setGrandTotal(700.00);
		cart.setCartLines(2);
		
		assertEquals("nie udalo sie zaktualizowac koszyka", true, userDAO.updateCart(cart));
		
	}
	
	

}
