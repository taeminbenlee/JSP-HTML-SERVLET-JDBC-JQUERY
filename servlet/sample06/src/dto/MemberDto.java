package dto;

import java.io.Serializable;
import java.util.Arrays;

public class MemberDto implements Serializable{
	private String name;
	private String age;
	private String selectedvalue;
	

	public MemberDto() {
		
	}
	
	public MemberDto(String name, String age, String selectedvalue) {
		super();
		this.name = name;
		this.age = age;
		this.selectedvalue = selectedvalue;
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

	public String getSelectedvalue() {
		return selectedvalue;
	}

	public void setSelectedvalue(String selectedvalue) {
		this.selectedvalue = selectedvalue;
	}

	@Override
	public String toString() {
		return "MemberDto [name=" + name + ", age=" + age + ", selectedvalue=" + selectedvalue + "]";
	}

	

	


	


	
	
}
