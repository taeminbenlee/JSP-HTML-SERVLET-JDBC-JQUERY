package main;

import jdbc.InsertTest;

public class MainClass {

	public static void main(String[] args) {
		/*
			JDBC : Java Database Connectivity
		 */
		
		
		InsertTest it = new InsertTest();
		//리턴값이 있으니 카운트로 받자
		int count = it.insertData("acc", "관우", 57);
		if(count == 1) {
			System.out.println("데이터가 " + count + "개 추가되었습니다");
		} else {
			System.out.println("데이터가 추가되지 않았습니다.");
		}
		
		

	}

}
