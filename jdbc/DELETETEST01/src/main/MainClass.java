package main;

import db.DBConnection;
import jdbc.DeleteTest01;

public class MainClass {

	public static void main(String[] args) {
		DBConnection.initConnection();
		
		DeleteTest01 dt = new DeleteTest01();
		
		String name = "홍길동";
		boolean b = dt.Delete(name);
		if(b == true) {
			System.out.println("정상 처리");
		}

	}

}
