package singleton;

public class SingletonClass {
	
	private static SingletonClass sc = null;
	
	public int sNumber;
	public String name;	
	
	private SingletonClass() {
	}
	
	public static SingletonClass getInstance() {
		if(sc == null) {	// 한번만 실행됨
			sc = new SingletonClass();
		}
		return sc;
	}
}




