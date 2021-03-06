package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertTest {
	//생엉자 생성
	public InsertTest() {
	//오라클 드라이버에 클래스가 있는지만 확인
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
		//1.2 conn = DriverManager.getConnection으로 우리가 접속할 db의 값을 넣어준다, 이때 젤처음 string url은 DB development에서 new oracle->properties->
		// driver properties -> url로 확인 가능 그이후 내가 접속할 데이터 네임과 패스워드를 넣어준다.
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.230:1521:xe", "hr", "hr");
			System.out.println("Oracle Connection Success");
		} catch (SQLException e) {
			System.out.println("DB를 연결하지 못했습니다.");
		}
		return conn;
	}
	public int insertData(String id, String name, int age) {
		
		//1. Query(String으로) 준비
		String sql = " INSERT INTO USERTEST(ID, NAME, AGE, JOINDATE) "
				+ " VALUES('"+ id + "','" + name + "'," + age + ", SYSDATE )";
		System.out.println(sql);
		//2. DB Connection
		Connection conn = getConnection();
		//2.1 Statement(java.sql)
		Statement state = null;
		//2.2 리턴값 integer 변수추가
		int count = 0;
		//3. DB Processing
		//3.1 state = conn.createStatement(); 에서 try and catch
		try {
			state = conn.createStatement();
		//3.1.1 state.executeUpdate(sql)을 통해 String sql이 실행되도록한다
			count = state.executeUpdate(sql);
			
			System.out.println("성공적으로 추가되었습니다.");
		} catch (SQLException e) {
			
			e.printStackTrace();
		//3.2 종료를 위해 finally
		} finally {
		//4. DB Close
			try {
			if(state != null) {
					state.close();
			} 
			if(conn != null) {
				conn.close();
			}
			
			} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			}
		}
		return count;
		
	}
	
	
	
	
	
	
	
}
