package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import db.DBClose;
import db.DBConnection;
import dto.abandonedDogDto;
	
public class abandonedDogDao {
	
	private static abandonedDogDao dao = new abandonedDogDao();
	
	private abandonedDogDao() {
		DBConnection.initConnection();
		
	}
	
	
	
	public static abandonedDogDao getInstance() {
		return dao;
	}
	
	
	
	
	//관리자확인용 페이지 에서 제보글 목록을 볼수있도록 하는 메소드 + search + paging 
	public List<abandonedDogDto> getAbandonedDogPagingList(String choice, String search, int page){
		
		String sql = " SELECT SEQ, MYID, PHONENUM, ADDRESS, MYCONTENT, FILENAME, NEWFILENAME, DANGER, WDATE "
				+ " FROM ABANDONEDDOG ";
		
		String sWord ="";
		if(choice.equals("id")) {
			sWord = " WHERE MYID='" + search + "' ";
		} else if (choice.equals("ADDRESS")) {
			sWord = " WHERE ADDRESS LIKE '%" + search + "%' ";
		}
		sql = sql + sWord;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<abandonedDogDto> list = new ArrayList<abandonedDogDto>();
		
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("1/4 getAbandonedDogPagingList success");

			psmt = conn.prepareStatement(sql);

			System.out.println("2/4 getAbandonedDogPagingList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getAbandonedDogPagingList success");
			
			while (rs.next()) {
				abandonedDogDto dto = new abandonedDogDto(rs.getInt(1),
														rs.getString(2),
														rs.getInt(3),
														rs.getString(4),
														rs.getString(5),
														rs.getString(6),
														rs.getString(7),
														rs.getInt(8),
														rs.getString(9)	);
				list.add(dto);
				}
			System.out.println("4/4 getAbandonedDogPagingList success");

		} catch (SQLException e) {
			System.out.println("getAbandonedDogPagingList fail");

			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	}
	
	public int getAllReport(String choice, String search) {
		String sql = " SELECT COUNT(*) FROM ABANDONEDDOG ";
		
		String sWord = "";
		if(choice.equals("ADDRESS")) {
			sWord = " WHERE ADDRESS LIKE '%" + search + "%'";
		} else if (choice.equals("id")) {
			sWord = " WHERE MYID='" + search + "'";
		}
		sql = sql + sWord;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int len = 0;
	
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getAllReport success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getAllReport success");
			rs = psmt.executeQuery();
			System.out.println("3/4 getAllReport success");
			if(rs.next()) {
				len = rs.getInt(1);
			}
			System.out.println("4/4 getAllReport success");
		} catch (SQLException e) {
			System.out.println("getAllReport fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return len;
		
	}
	
	
	
	
	//제보자의 제보 디테일을 확인할수 있는 메소드 == 디테일
	public abandonedDogDto reportDetail(int seq) {
		String sql = " SELECT SEQ, MYID, PHONENUM, ADDRESS, MYCONTENT, FILENAME, NEWFILENAME, DANGER, WDATE "
				+ " FROM ABANDONEDDOG "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		abandonedDogDto dto = null;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 reportDetail success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 reportDetail success");
			
			rs=psmt.executeQuery();
			System.out.println("3/4 reportDetail success");

			while (rs.next()) {
				dto = new abandonedDogDto(	rs.getInt(1),
											rs.getString(2),
											rs.getInt(3),
											rs.getString(4),
											rs.getString(5),
											rs.getString(6),
											rs.getString(7),
											rs.getInt(8),
											rs.getString(9)	);
			}
			System.out.println("4/4 reportDetail success");

		} catch (SQLException e) {
			System.out.println("reportDetail fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return dto;
	}
	
	// 제보자가 제보를 위해 글을 작성하는 메소드
	public boolean writeReport(abandonedDogDto dto) {
		String sql = " INSERT INTO ABANDONEDDOG "
				+ " (SEQ, MYID, PHONENUM, ADDRESS, MYCONTENT, FILENAME, NEWFILENAME, DANGER, WDATE) "
				+ " VALUES( SEQ_ABANDONEDDOG.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, SYSDATE ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 writeReport success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 writeReport success");
			psmt.setString(1, dto.getMyid());
			psmt.setInt(2, dto.getPhonenum());
			psmt.setString(3, dto.getAddress());
			psmt.setString(4, dto.getMycontent());
			psmt.setString(5, dto.getFilename());
			psmt.setString(6, dto.getNewfilename());
			psmt.setInt(7, dto.getdanger());
			System.out.println("3/4 writeReport success");
			
			count = psmt.executeUpdate();
			System.out.println("4/4 writeReport success");


		} catch (SQLException e) {
			System.out.println("writeReport fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}

		return count>0?true:false;
	}
	
	//제보 수정 메소드
	public boolean updateReport(int seq, abandonedDogDto dto) {
		String sql = " UPDATE ABANDONEDDOG SET "
				+ " ADDRESS=?, PHONENUM=?, MYCONTENT=? WDATE=SYSDATE "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 updateReport success");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getAddress());
			psmt.setInt(2, dto.getPhonenum());
			psmt.setString(3, dto.getMycontent());
			psmt.setInt(4, seq);
			System.out.println("2/3 updateReport success");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 updateReport success");
		} catch (SQLException e) {
			System.out.println("updateReport fail");

			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}
	
	//수정을 위해 디테일내용 가져오는 메소드
		public abandonedDogDto getReport(int seq) {
			String sql = " SELECT SEQ, MYID, PHONENUM, ADDRESS, MYCONTENT, FILENAME, NEWFILENAME, DANGER, WDATE "
					+ " FROM ABANDONEDDOG "
					+ " WHERE SEQ = ? ";		
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			abandonedDogDto dto = null;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/4 getReport success");
				
				psmt = conn.prepareStatement(sql);
				System.out.println("2/4 getReport success");
				
				rs = psmt.executeQuery();
				System.out.println("3/4 getReport success");
				
				while (rs.next()) {
					dto = new abandonedDogDto(	rs.getInt(1),
												rs.getString(2),
												rs.getInt(3),
												rs.getString(4),
												rs.getString(5),
												rs.getString(6),
												rs.getString(7),
												rs.getInt(8),
												rs.getString(9)	);
					
					}
				System.out.println("4/4 getReport success");

			} catch (SQLException e) {
				System.out.println("getReport fail");

				e.printStackTrace();
			} finally {
				DBClose.close(conn, psmt, rs);
			}
			
			return dto;
		}
		
	
	
	
	
	
	
	
	
	
	
	
	
}
