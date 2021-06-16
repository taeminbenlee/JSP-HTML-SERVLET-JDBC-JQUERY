package main;

import java.util.List;

import dto.UserDto;
import jdbc.SelectTest;

public class MainClass {

	public static void main(String[] args) {
		//=======================================================================================//
		SelectTest st = new SelectTest();
		
		String id = "aba";
		
		UserDto dto = st.search(id);
		
		
		if(dto != null) {
			System.out.println(dto.toString());
		}
		else {
			System.out.println("데이터를 찾을수 없습니다.");
		}
		
		
		//=======================================================================================//
		
		id = "abc";
		
		UserDto user = st.select(id);
		if(user != null) {
			System.out.println(user.toString());
		}
		else {
			System.out.println("데이터를 찾을수 없습니다.");
		}
		
		//=======================================================================================//
		System.out.println("======================================================================");
		List<UserDto> list = st.getUserList(); //db에서 꺼낸 데이터
		for (int i = 0; i < list.size(); i++) {
			UserDto u = list.get(i);
			System.out.println(u.toString());
		}
		
		
	}

}
