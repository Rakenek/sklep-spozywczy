package net.ko.sklepspozywczy.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import net.ko.sklepspozywczy.model.RegisterModel;
import net.ko.sklepspozywczybackend.dao.UserDAO;
import net.ko.sklepspozywczybackend.dto.Address;
import net.ko.sklepspozywczybackend.dto.Cart;
import net.ko.sklepspozywczybackend.dto.User;

@Component
public class RegisterHandler {
	
	
	@Autowired
	private UserDAO userDAO;
	public RegisterModel init() {
		
		
		return new RegisterModel();
		
		
	}
	
	public void addUser(RegisterModel registerModel,User user)
	{
		registerModel.setUser(user);
	}
	
	public void addBilling(RegisterModel registerModel,Address billing)
	{
		registerModel.setBilling(billing);
	}
	
	public String saveAll(RegisterModel model)
	{
		String transitionValue="success";
		
		User user=model.getUser();
		if(user.getRole().equals("USER"))
		{
			Cart cart=new Cart();
			cart.setUser(user);
			user.setCart(cart);
			
			userDAO.addUser(user);
			
			Address billing=model.getBilling();
			billing.setUser(user);
			billing.setBilling(true);
			
			userDAO.addAddress(billing);
			
		}
		
		return transitionValue;
	}
	

}
