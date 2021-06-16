package dto;

public class UserDto {

	private String id;
	private String name;
	private int age;
	private String joindate;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}

	public UserDto(String id, String name, int age, String joindate) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.joindate = joindate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	@Override
	public String toString() {
		return "회원정보 [아이디=" + id + ", 이름=" + name + ", 나이=" + age + ", 가입일자=" + joindate + "]";
	}
	
}
