package net.ko.sklepspozywczybackend.dao;

import java.util.List;

import net.ko.sklepspozywczybackend.dto.Category;

public interface CategoryDAO {
	
	List<Category>list();
	Category get(int id);

}
