package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.MyDto;

public class MyDao {
	private static MyDao dao = new MyDao();
	
	public MyDao() {
		DBConnection.initConnection();
	}
	public static MyDao getInstance() {		
		return dao;
	}
	
public boolean addMember(MyDto dto) {
		
		String sql = " INSERT INTO MEMBER(NAME, EMAIL, PWD) "
					+ " VALUES(?, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 addMember success");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("2/3 addMember success");
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getEmail());
			psmt.setString(3, dto.getPwd());
			
			
			count = psmt.executeUpdate();
			System.out.println("3/3 addMember success");
			
		} catch (SQLException e) {			
			e.printStackTrace();
			System.out.println("addMember fail");
		} finally {
			DBClose.close(conn, psmt, null);			
		}
		
		return count>0?true:false;
	
	
}
}