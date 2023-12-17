package com.botree.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.botree.model.User;
import com.botree.utility.DbUtility;

public class UserDao {

	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;

	public User userLogin(String email, String password) {

		User user = null;
		try {
			con = DbUtility.getConnection();
			String query = "select * from users where email=? and password=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return user;
	}
}