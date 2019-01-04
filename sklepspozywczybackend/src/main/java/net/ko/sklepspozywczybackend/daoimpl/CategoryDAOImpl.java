package net.ko.sklepspozywczybackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import net.ko.sklepspozywczybackend.dao.CategoryDAO;
import net.ko.sklepspozywczybackend.dto.Category;

@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {
	
	private static List<Category> categories=new ArrayList<>();
	
	static {

		Category category=new Category();
		category.setId(1);
		category.setName("telewizja");
		category.setDescription("This is some description tv");
		category.setImageURL("cat1.png");
		categories.add(category);
		
		category=new Category();
		category.setId(2);
		category.setName("telefon");
		category.setDescription("This is some description telefon");
		category.setImageURL("cat2.png");
		categories.add(category);
		
		category=new Category();
		category.setId(3);
		category.setName("klawiatura");
		category.setDescription("This is some description klawiatura");
		category.setImageURL("cat3.png");
		categories.add(category);
		
		
		
	}
	
	
	@Override
	public List<Category> list()
	{
		return categories;
	}


	@Override
	public Category get(int id) {
		
		for(Category cat:categories)
		{
			if(cat.getId()==id)
			return cat;
		}
		return null;		
	}

}
