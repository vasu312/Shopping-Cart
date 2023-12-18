package com.botree.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtility {

	public static Connection getConnection() {

		String url = "jdbc:mysql://localhost:3306/shopping";
		String username = "DB_USERNAME";
		String password = "DB_PASSWORD";
		Connection connection = null;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

}
