package dto;

import java.io.Serializable;
import java.util.Arrays;

public class MemberDto implements Serializable {
	private String name;
	private String age;
	private String gender;
	private String[] hobbies;
	
	
	public MemberDto() {
	
	}


	public MemberDto(String name, String age, String gender, String[] hobbies) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.hobbies = hobbies;
	}


	

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String[] getHobbies() {
		return hobbies;
	}


	public void setHobbies(String[] hobbies) {
		this.hobbies = hobbies;
	}


	@Override
	public String toString() {
		return "출력결과 [이름=" + name + ", 연령대=" + age + ", 성별=" + gender + ", 취미="
				+ Arrays.toString(hobbies) + "]";
	}
	
}
