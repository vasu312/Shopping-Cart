package com.botree.service;

import com.botree.dao.UserDao;
import com.botree.model.User;

public class UserService {

	UserDao userDao = new UserDao();

	public String loginUser(String email, String password) throws Exception {
		User user = userDao.userLogin(email, password);
		if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
			return user.getName();
		}
		throw new Exception("Either Invalid Email or Password");

	}

}
