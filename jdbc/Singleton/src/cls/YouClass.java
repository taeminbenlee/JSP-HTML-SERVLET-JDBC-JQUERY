package cls;

import singleton.SingletonClass;

public class YouClass {

	private int num;
	
	/*
	public void setNum(int num) {
		this.num = num;
	}
	*/

	public void print() {
		SingletonClass sc = SingletonClass.getInstance();
		
		num = sc.sNumber;
		
		System.out.println("num:" + num);
	}
}




