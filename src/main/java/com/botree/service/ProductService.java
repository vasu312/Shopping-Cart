package com.botree.service;

import java.util.ArrayList;
import java.util.List;

import com.botree.dao.ProductDao;
import com.botree.model.Cart;
import com.botree.model.Product;

public class ProductService {

	ProductDao productDao = new ProductDao();

	public List<Product> getAllProducts() {
		return productDao.getAllProducts();
	}

	public Product getSingleProduct(int id) {
		return productDao.getSingleProduct(id);
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		return productDao.getTotalCartPrice(cartList);
	}

	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		return productDao.getCartProducts(cartList);
	}

}
