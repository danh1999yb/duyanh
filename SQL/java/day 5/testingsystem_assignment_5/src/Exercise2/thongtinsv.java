package Exercise2;

public class thongtinsv {
	private int id;
	private String name;
	private String address;
	private int priority;
	private khoithi khoithi;
	@Override
	public String toString() {
		return "thongtinsv [id=" + id + ", name=" + name + ", address=" + address + ", priority=" + priority
				+ ", khoithi=" + khoithi + "]";
	}
	public thongtinsv(int id, String name, String address, int priority, Exercise2.khoithi khoithi) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.priority = priority;
		this.khoithi = khoithi;
	}
	public thongtinsv(String name2, String address2, Exercise2.khoithi khoithi2) {
		// TODO Auto-generated constructor stub
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
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @return the priority
	 */
	public int getPriority() {
		return priority;
	}
	/**
	 * @param priority the priority to set
	 */
	public void setPriority(int priority) {
		this.priority = priority;
	}
	/**
	 * @return the khoithi
	 */
	public khoithi getKhoithi() {
		return khoithi;
	}
	/**
	 * @param khoithi the khoithi to set
	 */
	public void setKhoithi(khoithi khoithi) {
		this.khoithi = khoithi;
	}
	
	
}
