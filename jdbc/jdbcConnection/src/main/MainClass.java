package main;

import jdbc.JdbcConnect;

public class MainClass {

	public static void main(String[] args) {
		/*
			JDBC : Java Database Connectivity
		 */
		
		
		JdbcConnect jc = new JdbcConnect();
		
		jc.getConnection();
		

	}

}
