package main;

import cls.HeClass;
import cls.MyClass;
import cls.YouClass;

public class MainClass {
	public static void main(String[] args) {
		/*
			Singleton : instance를 1개만 생성해서 데이터를 접근하기 위한 패턴
		*/
		MyClass mycls = new MyClass();
		YouClass youcls = new YouClass();
		
	//	int n = mycls.getNumber();
	//	youcls.setNum(n);
		
		youcls.print();
		
		HeClass hecls = new HeClass("성춘향");
		
		mycls.method();
		
	}
}




