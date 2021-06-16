package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateTest {
	
	public UpdateTest() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			System.out.println("Driver Loading Success");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver가 없습니다.");
		}
	}
	public Connection getConnection() {
		//1.1 리턴 변수 설정
		Connection conn = null;
		//1.2 conn = DriverManager.getConnection으로 우리가 접속할 db의 값을 넣어준다, 이때 젤처음 string url은 ip주소
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.230:1521:xe", "hr", "hr");
			System.out.println("Oracle Connection Success");
		} catch (SQLException e) {
			System.out.println("DB를 연결하지 못했습니다.");
		}
		return conn;
	}
	
	public int Update(String id, int age) {
		//1. query 생성
		String sql = " UPDATE USERTEST "
						+ " SET AGE = " + age + " "
						+ " WHERE ID = '" + id + "'";
		System.out.println(sql);
		
		Connection conn = getConnection();
		Statement stmt = null;
		
		int count = 0;
		
		//2. db connect
		try {
			stmt = conn.createStatement();
		//3. db process	
			count = stmt.executeUpdate(sql);
			
			System.out.println("성공적으로 수정됨");
			
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
