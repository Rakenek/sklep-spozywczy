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
		category.setName("Napoje");
		category.setDescription("Napoje gazowane");
		category.setImageURL("cat4.png");
		
		assertEquals("nie udalo sie dodac kategorie do tabeli", true,categoryDAO.add(category));
		
		//pobranie i aktualizacja kategorii
		category=categoryDAO.get(3);
		category.setName("Bułki");
		assertEquals("nie udalo sie zaktualizowac kategorie", true,categoryDAO.update(category));
		
		//dezaktywowanie kategorii
		assertEquals("nie udalo sie dezaktywowac kategorie", true,categoryDAO.delete(category));
		
		//lista kategorii aktywnych
			assertEquals("nie udalo sie pobrac liste kategorii", 3,categoryDAO.list().size());

	}

}
