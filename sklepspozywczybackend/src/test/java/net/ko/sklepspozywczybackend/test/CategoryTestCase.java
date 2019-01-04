package net.ko.sklepspozywczybackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.ko.sklepspozywczybackend.dao.CategoryDAO;
import net.ko.sklepspozywczybackend.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;

	private static CategoryDAO categoryDAO;

	private Category category;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.ko.sklepspozywczybackend");
		context.refresh();
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
	}
	
	
	@Test
	public void testCRUDCategory()
	{
		
		//dodanie do bd
		category = new Category();
		category.setName("Owoce");
		category.setDescription("Owoce z polskich sadów");
		category.setImageURL("cat1.png");
		
		assertEquals("udalo sie dodac kategorie do tabeli", true,categoryDAO.add(category));
		
		category = new Category();
		category.setName("Warzywa");
		category.setDescription("Warzywa z polskich ogrodów");
		category.setImageURL("cat2.png");
		
		assertEquals("udalo sie dodac kategorie do tabeli", true,categoryDAO.add(category));
		
		category = new Category();
		category.setName("Pieczywo");
		category.setDescription("Świeże pieczywo");
		category.setImageURL("cat3.png");
		
		assertEquals("udalo sie dodac kategorie do tabeli", true,categoryDAO.add(category));
		
		//pobranie i aktualizacja kategorii
		category=categoryDAO.get(3);
		category.setName("Napoje");
		assertEquals("udalo sie zaktualizowac kategorie", true,categoryDAO.update(category));
		
		//dezaktywowanie kategorii
		assertEquals("udalo sie dezaktywowac kategorie", true,categoryDAO.delete(category));
		
		//lista kategorii aktywnych
			assertEquals("udalo sie pobrac liste kategorii", 2,categoryDAO.list().size());

	}

}
