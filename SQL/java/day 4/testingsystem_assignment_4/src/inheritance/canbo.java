package inheritance;

public class canbo {
	private String name;
	private int age;
	private String hometown;
	public gender gender;

	public enum gender {
		MALE, FEMALE, UNKNOWN
	};

	public canbo(String name, int age, gender gender) {
		this.name = name;
		this.age = age;
		this.hometown = hometown;
		this.gender = gender;
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

	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public gender getGender() {
		return gender;
	}

	public void setGender(gender gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "canbo [name=" + name + ", age=" + age + ", hometown=" + hometown + ", gender=" + gender + "]";
	}

}
