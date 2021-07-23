package student;

public class student {
	private int id;
	private String name;
	private String hometown;
	private int diemhocluc;

	private student(int id, String name, String hometown, int diemhocluc) {
		this.id = id;
		this.name = name;
		this.hometown = hometown;
		this.diemhocluc = 0;

	}

	public void setDiemhocluc(int diemhocluc) {
		this.diemhocluc = diemhocluc;
	}

	public void aDiemhocluc(int diemhocluc) {
		this.diemhocluc = this.diemhocluc + diemhocluc;
	}

	public String a() {
		String rank = null;
		if (this.diemhocluc < 4.0) {
			rank = "Yếu";
		} else if (this.diemhocluc < 6.0) {
			rank = "Trung Bình";
		} else if (this.diemhocluc < 8.0) {
			rank = "Khá";
		} else {
			rank = "Giỏi";
		}
		return "Student [id=" + id + ", name=" + name + ", hometown=" +

				hometown + ", score=" + diemhocluc + ", Xếp loại=" + rank + "]";
	}
}
