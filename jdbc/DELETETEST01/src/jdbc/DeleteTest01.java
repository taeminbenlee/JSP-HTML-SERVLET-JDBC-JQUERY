package jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBClose;
import db.DBConnection;

public class DeleteTest01 {

	public boolean Delete(String name) {
		//리턴값은 int대신 boolean으로도 많이 하낟
		
		String sql = " DELETE FROM USERTEST WHERE NAME = '" + name + "'";
		System.out.println(sql);
		
		Connection conn = DBConnection.getConnection();
		Statement stmt = null;
		//리턴값이 불린 이여도 변수는 있어야한다..
		int count = 0;
		
		try {
			stmt = conn.createStatement();
			
			count = stmt.executeUpdate(sql);
			System.out.println("정상적으로 삭제되었습니다.");
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBClose.close(conn, stmt, null);
		}
		
		return count > 0 ? true:false;
	}
	
}
