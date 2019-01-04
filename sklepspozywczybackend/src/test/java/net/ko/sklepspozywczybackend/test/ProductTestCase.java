package net.ko.sklepspozywczybackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.ko.sklepspozywczybackend.dao.ProductDAO;
import net.ko.sklepspozywczybackend.dto.Product;

public class ProductTestCase {
	private static AnnotationConfigApplicationContext context;
	private static ProductDAO productDAO;
	private Product product;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.ko.sklepspozywczybackend");
		context.refresh();
		productDAO = (ProductDAO) context.getBean("productDAO");
	}
	
	@Test
	public void testCRUDProduct()
	{
		
		//dodanie do bd
		product = new Product();
		product.setName("Pomelo");
		product.setBrand("zielony las");
		product.setUnit("kg");
		product.setUnitPrice(2);
		product.setQuantity(100);
		product.setActive(true);
		product.setCategoryId(1);
		product.setSupplierId(1);
		
		
		assertEquals("nie udalo sie dodac kategorie do tabeli", true,productDAO.add(product));
		
	
		
		//pobranie i aktualizacja produktu
		product=productDAO.get(1);
		product.setName("jablko papierówka");
		assertEquals("nie udalo sie zaktualizowac kategorie", true,productDAO.update(product));
		
		//dezaktywowanie produktu
		assertEquals("nie udalo sie dezaktywowac kategorie", true,productDAO.delete(product));
		
		//lista produktów
		assertEquals("nie udalo sie pobrac liste kategorii", 7,productDAO.list().size());
		
		//lista aktywnych produktów
		assertEquals("nie udalo sie pobrac liste kategorii", 6,productDAO.listActiveProducts().size());
		
		//lista aktywnych produktów po kategorii
		assertEquals("nie udalo sie pobrac liste kategorii", 2,productDAO.listActiveProductsByCategory(2).size());
		
		//lista aktywnych produktów po kategorii
		assertEquals("nie udalo sie pobrac liste kategorii", 2,productDAO.getLatestActiveProducts(2).size());

	}

}
