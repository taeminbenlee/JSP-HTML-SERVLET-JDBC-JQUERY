package main;

import jdbc.DeleteTest;

public class MainClass {

	public static void main(String[] args) {
		DeleteTest dt = new DeleteTest();
		String name = "김길동";
		
		int count = dt.Delete(name);
		if(count == 1) {
			System.out.println("정상적으로 삭제됨");
		} 
		

	}

}
