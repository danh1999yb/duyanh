package entity;

public class Employee<T> {
	int id;
	String name;
	T salaries;
	public Employee(int id, String name, T salaries) {
		super();
		this.id = id;
		this.name = name;
		this.salaries = salaries;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
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
	/**
	 * @return the salaries
	 */
	public T getSalaries() {
		return salaries;
	}
	/**
	 * @param salaries the salaries to set
	 */
	public void setSalaries(T salaries) {
		this.salaries = salaries;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", salaries=" + salaries + "]";
	}

	
	public void print1() {
		System.out.println(id);
		System.out.println(name);
		System.out.println(salaries);
	
		
	}		
	public void print2() {
		System.out.println(salaries);
	}
}
