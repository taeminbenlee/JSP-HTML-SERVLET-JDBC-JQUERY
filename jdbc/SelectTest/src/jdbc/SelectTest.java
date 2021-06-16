package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.UserDto;

public class SelectTest {
//============================================================================================================//
	// 1. 1개의 데이터를 취득
	//하나의 데이터를 취득하니깐 어잿든 UserDto를 리턴
	public UserDto search(String id) {
	//1. query작업
		String sql = " SELECT ID, NAME, AGE, JOINDATE "
				+ " FROM USERTEST "
				+ " WHERE ID = '" + id + "' ";
		
		
		System.out.println(sql); // 확인용 으로 직어놓자
	//2 데이터 연결	
		Connection conn = DBConnection.getConnection();
		Statement stmt = null;
		ResultSet rs = null; //db로부터 결과를 return받는 값
		
		UserDto dto = null;
	//2.1 데이터 프로세스 stmt = conn.createStatement(); 에 try catch	
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) { 	//true일경우 데이터가 있는경우
	//2.2 데이터를 받아오는 절차
				String userid = rs.getString("id"); //db로부터 넘어온 데이터를 스트링으로 변환하여 id라는 컬럼값을 받는다
				String username = rs.getString("name"); 
				int userage = rs.getInt("age");
				String userjoindate = rs.getString("joindate");
	//2.3 받아온 데이터를 dto에 넣어준다
				dto = new UserDto(userid, username, userage, userjoindate); 
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	//3. close db
		} finally {
			DBClose.close(conn, stmt, rs);
		}
		return dto;
		
	}
//============================================================================================================//
	
	//다른방법 실무에선 이방법을 많이 쓴다. PreparedStatement활용
	public UserDto select(String id) {
		//1.1 query작업
				String sql = " SELECT ID, NAME, AGE, JOINDATE "
						+ " FROM USERTEST "
						+ " WHERE ID = ? "; //?을 넣어준다.. 이것은 우리가 넣는다는뜻?
				
				System.out.println(sql); // 확인용 으로 직어놓자
		//2. 데이터 연결
			Connection conn = DBConnection.getConnection();
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			UserDto dto = null;
		//3. 데이터 받아오기	
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id); //?표시중 1번째 ?표에 뒤에 id값을 넣어라 라는것 만약 물음표가 ??두개라면 (2, id)
				
				rs = psmt.executeQuery(); //preparedstatement에서는 쿼리 안에 아무것도 안넣는다
				
				if(rs.next()) {
					String userid = rs.getString("id");
					String username = rs.getString("name");
					int userage = rs.getInt("age");
					String userjoindate = rs.getString("joindate");
					
					dto = new UserDto(userid, username, userage, userjoindate);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		//4. db종료
			} finally {
				DBClose.close(conn, psmt, rs);
			}
		
			return dto;
		
	}
//============================================================================================================//	
	
	//다수의 데이터를 취급
	public List<UserDto> getUserList() {
		//1. 쿼리작성
		String sql = " SELECT * "
				+ " FROM USERTEST ";
		//컬럼을 다 가져올땐 * 만 해도 된다
		
		//2. 데이터 연결 
		Connection conn = DBConnection.getConnection(); //연결
		PreparedStatement psmt = null; //연결된값을 셋팅
		ResultSet rs = null; //결과 도출용
		
		//2.1 리턴값인 리스트생성
		List<UserDto> list = new ArrayList<UserDto>();
		//3. 데이터 가져오기
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
		//3.1 여러개의 데이터를 취득하기 위해서 while로 돌리기
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String joindate = rs.getString("joindate");
		//3.2 dto생성		
				UserDto dto = new UserDto(id, name, age, joindate);
		//3.3 리스트에 dto담기		
				list.add(dto);
				
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		//4. close
		} finally {
			DBClose.close(conn, psmt, rs);
			
		}
		
		return list;
		
		
		
		
	}
	
	
	
}
