package cls;

import singleton.SingletonClass;

public class HeClass {

	private String name;
	
	public HeClass(String name) {
		this.name = name;
		
		SingletonClass sc = SingletonClass.getInstance();
		sc.name = this.name;
	}
	
	
}






