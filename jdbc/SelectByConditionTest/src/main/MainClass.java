package main;

import java.util.ArrayList;
import dto.UserDto;
import jdbc.SelectByCondition;

public class MainClass {
// 회원을 5명까지 늘리고
// 리스트로 해서 20세 이상인 회원만 출력해보자
	
	public static void main(String[] args) {
		SelectByCondition sbc = new SelectByCondition();
		int age = 20;
		
		ArrayList<UserDto> list = sbc.getUserList(age);
		for (int i = 0; i < list.size(); i++) {
			if(list != null) {
			UserDto d = list.get(i);
			
			System.out.println(d.toString());
			}
		}
		
		
		
	}

}
