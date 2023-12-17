package com.botree.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.botree.model.Cart;
import com.botree.model.Product;
import com.botree.service.ProductService;
import com.botree.service.UserService;

@WebServlet(urlPatterns = "/")
public class AppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequests(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequests(request, response);
	}

	private void processRequests(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String path = request.getServletPath();
		System.out.println(path);
		switch (path) {
		case "/" -> home(request, response);
		case "/validate" -> login(request, response);
		case "/home" -> home(request, response);
		case "/logout" -> logout(request, response);
		case "/cart" -> cart(request, response);
		case "/order" -> order(request, response);
		case "/addToCart" -> addToCart(request, response);
		case "/removeCartItem" -> removeCartItem(request, response);
		default -> System.out.println("Wrong Path");
		}

	}

	private void order(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ArrayList<Cart> orderItems = (ArrayList<Cart>) request.getSession().getAttribute("CartItems");
		System.out.println(orderItems);
		String date = String.valueOf(java.time.LocalDate.now());
		request.getSession().setAttribute("orderDate", date);
		request.getSession().setAttribute("orderItems", orderItems);
		response.sendRedirect("order.jsp");
	}

	private void removeCartItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ArrayList<Cart> lists = (ArrayList<Cart>) request.getSession().getAttribute("CartItems");
		List<Cart> list = lists.stream().filter(x -> x.getId() != id).collect(Collectors.toList());
		System.out.println(list);
		request.getSession().setAttribute("CartItems", list);
		request.getSession().setAttribute("cartList", list);
		response.sendRedirect("cart.jsp");
	}

	private void cart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ProductService productService = new ProductService();
		double total = 0;
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");

		List<Cart> list = new ArrayList<Cart>();
		try {
			list = productService.getCartProducts(cartList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (list.size() > 0) {
			total = list.stream().map(x -> x.getPrice()).reduce(Double::sum).get();
		}
		System.out.println(total);
		session.setAttribute("total", total);
		session.setAttribute("CartItems", list);
		response.sendRedirect("cart.jsp");
	}

	private void home(HttpServletRequest request, HttpServletResponse response) throws IOException {

		ProductService productService = new ProductService();
		List<Product> list = new ArrayList<Product>();
		try {
			list = productService.getAllProducts();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("list", list);
		response.sendRedirect("index.jsp");
	}

	private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ArrayList<Cart> cartList = new ArrayList<>();
		int id = Integer.parseInt(request.getParameter("id"));
		Cart cm = new Cart();
		cm.setId(id);
		cm.setQuantity(1);
		HttpSession session = request.getSession();
		ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
		if (cart_list == null) {
			cartList.add(cm);
			session.setAttribute("cart-list", cartList);
			response.sendRedirect("index.jsp");
		} else {
			cartList = cart_list;

			boolean exist = false;
			for (Cart c : cart_list) {
				if (c.getId() == id) {
					exist = true;
					request.getSession().setAttribute("cart_item", "Product Already Added to Cart");
					response.sendRedirect("index.jsp");
				}
			}

			if (!exist) {
				cartList.add(cm);
				request.getSession().setAttribute("cartList", cartList);
				response.sendRedirect("index.jsp");
			}
		}
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().invalidate();
		response.sendRedirect("login.jsp");

	}

	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("login-email");
		String password = request.getParameter("login-password");

		UserService userService = new UserService();

		try {
			String name = userService.loginUser(email, password);
			request.getSession().setAttribute("auth", name);
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			request.getSession().setAttribute("error", "Invalid Username and Password");
			response.sendRedirect("login.jsp");
		}
	}

}
