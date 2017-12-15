package com.spring.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnection {
	 
	public static Connection getDbCon() throws ClassNotFoundException, SQLException{
		
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uploadfile", "root", "root");
		
		return con;
		
	}

}
