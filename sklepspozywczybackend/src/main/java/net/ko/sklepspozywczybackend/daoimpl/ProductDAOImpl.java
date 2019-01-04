package net.ko.sklepspozywczybackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.ko.sklepspozywczybackend.dao.ProductDAO;
import net.ko.sklepspozywczybackend.dto.Category;
import net.ko.sklepspozywczybackend.dto.Product;

@Repository("productDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	// lista produktów
	@Override
	public List<Product> list() {

		String selectActiveCategory = "FROM Product";

		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory, Product.class);

		return query.getResultList();
	}

	// pobieranie pojedynczego produktu po id
	@Override
	public Product get(int id) {

		try {
			return sessionFactory.getCurrentSession().get(Product.class, Integer.valueOf(id));
		} catch (Exception ex) {
			ex.printStackTrace();

		}

		return null;

	}

	@Override
	public boolean add(Product product) {
		try {

			sessionFactory.getCurrentSession().persist(product);

			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}

	}

	// aktualizacja pojedynczego produktu
	@Override
	public boolean update(Product product) {
		try {

			sessionFactory.getCurrentSession().update(product);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	// dezaktywowanie produktu
	@Override
	public boolean delete(Product product) {

		product.setActive(false);
		try {

			sessionFactory.getCurrentSession().update(product);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Product> listActiveProducts() {
		String selectActiveProducts = "FROM Product WHERE active=:active";

		return sessionFactory.getCurrentSession().createQuery(selectActiveProducts, Product.class)
				.setParameter("active", true).getResultList();
	}

	@Override
	public List<Product> listActiveProductsByCategory(int categoryId) {
		String selectActiveProductsByCategory = "FROM Product WHERE active=:active AND categoryId=:categoryId";

		return sessionFactory.getCurrentSession().createQuery(selectActiveProductsByCategory, Product.class)
				.setParameter("active", true).setParameter("categoryId", categoryId).getResultList();

	}

	@Override
	public List<Product> getLatestActiveProducts(int count) {
		String selectLastestActiveProducts = "FROM Product WHERE active=:active ORDER BY id";

		return sessionFactory.getCurrentSession().createQuery(selectLastestActiveProducts, Product.class)
				.setParameter("active", true).setFirstResult(0).setMaxResults(count).getResultList();

	}

}
