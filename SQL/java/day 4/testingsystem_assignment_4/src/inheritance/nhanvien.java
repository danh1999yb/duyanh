package inheritance;

public class nhanvien extends canbo {

	private String Work;

	public nhanvien(String name, int age, gender gender, String address, String Work) {

		super(Work, age, gender);
		this.Work = Work;
	}

	@Override
	public String toString() {
		return super.toString() + "Position: Employee [task=" + Work + "]";
	}
}
