package entity;

public class Student3<T> {
	private T id;
	String name;
	public Student3(T id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	/**
	 * @return the id
	 */
	public T getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(T id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Student3 [id=" + id + ", name=" + name + "]";
	}
	
	
	
	
}
