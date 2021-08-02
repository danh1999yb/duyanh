package backend;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import entity.Student2;

public class ex2 {
public void question1() {
	List<Student2> student2 = new ArrayList<>();
	student2.add(new Student2(1, "danh2", "2/2/1999", 5));
	student2.add(new Student2(2, "danh3", "2/2/1999", 5));
	student2.add(new Student2(3, "danh4", "2/2/1999", 5));
	student2.add(new Student2(4, "danh5", "2/2/1999", 5));
	student2.add(new Student2(4, "danh6", "2/2/1999", 5));
	
	System.out.println(student2);
	System.out.println("==================");
	
	for (Student2 student22 : student2) {
		System.out.println(student22);
	}
//	Question 1: Comparable
//	In ra học sinh sắp xếp theo name
	
	

	
	
//	Question 2: Comparator
//	In ra học sinh sắp xếp theo name, nếu tên trùng nhau thì sẽ sắp xếp
//	theo ngày sinh, nếu ngày sinh trùng nhau thì sẽ sắp xếp theo điểm
}
}
