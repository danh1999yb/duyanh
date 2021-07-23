package Optional;

public class Circle {
	private double radius;
	private String color;

	public Circle() {
	}

	public Circle(Double radius) {
		this.radius = radius;
	}

	public Circle(Double radius, String color) {
		this.radius = radius;
		this.color = color;
	}

	public double getRadius() {
		return radius;
	}

	public void setRadius(double radius) {
		this.radius = radius;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

}
