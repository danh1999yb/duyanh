package inheritance;

public class kysu extends canbo {

	private String training;

	public kysu(String name, int age, gender gender, String address, String training) {

		super(training, age, gender);
		this.training = training;
	}

	@Override
	public String toString() {
		return super.toString() + "Position: Engineer [specialized=" + training + "]";
	}
}
