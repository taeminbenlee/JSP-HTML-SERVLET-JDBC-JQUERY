package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteTest {
	//생엉자 생성
	public DeleteTest() {
	//오라클 드라이버에 클래스가 있는지만 확인
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			System.out.println("Driver Loading Success");
		} catch (ClassNotFoundException e) {
			
			System.out.println("Driver가 없습니다.");

		}
	}
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.230:1521:xe", "hr", "hr");
			System.out.println("Oracle Connection Success");
		} catch (SQLException e) {
			System.out.println("DB를 연결하지 못했습니다.");
		}
		return conn;
	}
	public int Delete(String name) {
		
		//1. query
		String sql = " DELETE FROM USERTEST WHERE NAME = '" + name + "'";
		System.out.println(sql);
		Connection conn = getConnection();
		Statement stmt = null;
		
		int count = 0;
		//2. db connect
		try {
			stmt = conn.createStatement();
		//3. db processing	
			count = stmt.executeUpdate(sql);
			System.out.println("성공적으로 실행됨");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
		//4. db close	
			try {
				if(stmt != null) {
						stmt.close();
				} 
				if(conn != null) {
					conn.close();
				}
				
				} catch (SQLException e) {
						
						e.printStackTrace();
				}
		}
		return count;
	}
	
	
	
	
}
