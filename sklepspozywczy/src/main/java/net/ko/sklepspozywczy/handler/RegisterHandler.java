package net.ko.sklepspozywczy.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
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
	
	public String validateUser(User user,MessageContext error)
	{
		String transitionValue="success";
		
		if(!(user.getPassword().equals(user.getConfirmPassword())))
		{
			error.addMessage(new MessageBuilder().error().source("confirmPassword").defaultText("wpisane has�a nie s� takie same").build());
			transitionValue="failure";
		}
		
		if(userDAO.getByEmail(user.getEmail())!=null)
		{
			transitionValue="failure";
			error.addMessage(new MessageBuilder().error().source("email").defaultText("istnieje u�ytkownik o podanym adresie email").build());
			transitionValue="failure";
		}
		
		return transitionValue;
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
			
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			
			userDAO.addUser(user);
			
			Address billing=model.getBilling();
			billing.setUser(user);
			billing.setBilling(true);
			
			userDAO.addAddress(billing);
			
		}
		
		return transitionValue;
	}
	

}
