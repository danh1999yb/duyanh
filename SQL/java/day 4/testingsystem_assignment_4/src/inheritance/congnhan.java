package inheritance;

import inheritance.canbo.gender;

public class congnhan {

	private int rank;

	public congnhan() {
		
	}
	
	
	
	public congnhan(String name, int age, gender gender, int rank) {

		super();
		this.rank = rank;
	}

	@Override
	public String toString() {
		return super.toString() + "Position: Worker [rank=" + rank + "]";
	}
}