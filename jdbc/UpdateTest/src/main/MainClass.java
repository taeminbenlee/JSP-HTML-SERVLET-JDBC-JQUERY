package main;

import jdbc.UpdateTest;

public class MainClass {

	public static void main(String[] args) {
		
		UpdateTest ut = new UpdateTest();
		String id = "abc";
		int age = 22;
		
		int count = ut.Update(id, age);
		if(count == 1) {
			System.out.println("정상적으로 수정됨");
		} 
		
		
		
		
		
	}
}
