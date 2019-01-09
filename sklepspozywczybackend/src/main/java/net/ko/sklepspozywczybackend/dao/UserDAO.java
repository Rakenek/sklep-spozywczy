package net.ko.sklepspozywczybackend.dao;

import java.util.List;

import net.ko.sklepspozywczybackend.dto.Address;
import net.ko.sklepspozywczybackend.dto.Cart;
import net.ko.sklepspozywczybackend.dto.User;

public interface UserDAO {
	
	boolean addUser(User user);
	User getByEmail(String email);
	
	boolean addAddress(Address address);
	Address getBillingAddress(User user);
	List<Address> listShippingAddresses(User user);
	
	boolean updateCart(Cart cart);

}
