package dto;

import java.io.Serializable;
import java.util.Arrays;

public class userDto implements Serializable {
	private String name;
	private String age;
	private String pwd;
	private String[] hobbies;
	private String memo;
	
	public userDto() {
		
	}

	public userDto(String name, String age, String pwd, String[] hobbies, String memo) {
		super();
		this.name = name;
		this.age = age;
		this.pwd = pwd;
		this.hobbies = hobbies;
		this.memo = memo;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String[] getHobbies() {
		return hobbies;
	}

	public void setHobbies(String[] hobbies) {
		this.hobbies = hobbies;
	}

	@Override
	public String toString() {
		return "userDto [name=" + name + ", age=" + age + ", pwd=" + pwd + ", hobbies=" + Arrays.toString(hobbies)
				+ ", memo=" + memo + "]";
	}
	
}
