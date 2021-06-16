package cls;

import singleton.SingletonClass;

public class MyClass {

	private int number;
	
	private String name;
		
	public MyClass() {
		number = 123;
		
		SingletonClass s = SingletonClass.getInstance();
		s.sNumber = number;
	}

	/*
	public int getNumber() {
		return number;
	}
	*/
	
	
	public void method() {
		SingletonClass sc = SingletonClass.getInstance();
		this.name = sc.name;
		
		System.out.println("name:" + name);
	}
	
	
	
}
