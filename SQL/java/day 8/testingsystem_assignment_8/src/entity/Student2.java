package entity;

import java.time.LocalDate;

public class Student2 {

	int id;
	String name;
	String ngaysinh;
	int poin;
	public Student2(int id, String name, String ngaysinh, int poin) {
		super();
		this.id = id;
		this.name = name;
		this.ngaysinh = ngaysinh;
		this.poin = poin;
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
	 * @return the ngaysinh
	 */
	public String getNgaysinh() {
		return ngaysinh;
	}
	/**
	 * @param ngaysinh the ngaysinh to set
	 */
	public void setNgaysinh(String ngaysinh) {
		this.ngaysinh = ngaysinh;
	}
	/**
	 * @return the poin
	 */
	public int getPoin() {
		return poin;
	}
	/**
	 * @param poin the poin to set
	 */
	public void setPoin(int poin) {
		this.poin = poin;
	}
	@Override
	public String toString() {
		return "Student2 [id=" + id + ", name=" + name + ", ngaysinh=" + ngaysinh + ", poin=" + poin + "]";
	}
	
	
	
}
