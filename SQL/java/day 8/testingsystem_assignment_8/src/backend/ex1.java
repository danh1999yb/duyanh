package backend;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Scanner;
import java.util.Set;
import java.util.Stack;

import entity.Student;

public class ex1 {
	public void question1() {
// a In ra tổng số phần tử của students
		List<Student> studentList = new ArrayList<>();
		studentList.add(new Student("da"));
		studentList.add(new Student("da"));
		studentList.add(new Student("da"));
		studentList.add(new Student("dw"));

		for (Student student : studentList) {
			System.out.println(student);
		}
// b Lấy phần tử thứ 4 của students
		System.out.println("=================");
		System.out.println(studentList.get(3));

// c In ra phần tử đầu và phần tử cuối của students
		System.out.println("=================");
		System.out.println(studentList.get(0));
		System.out.println(studentList.size() - 1);
//	d) Thêm 1 phần tử vào vị trí đầu của students
		studentList.add(0, new Student("d"));
		System.out.println(studentList.get(0));
//	e) Thêm 1 phần tử vào vị trí cuối của students
		studentList.add(studentList.size(), new Student("d"));
		System.out.println(studentList.size());

//	f) Đảo ngược vị trí của students
//	g) Tạo 1 method tìm kiếm student theo id

//	h) Tạo 1 method tìm kiếm student theo name
//	i) Tạo 1 method để in ra các student có trùng tên
//	j) Xóa name của student có id = 2;
		Student remove = studentList.remove(3);
		System.out.println("các phần tử còn lại");
		for (Student student1 : studentList) {
			System.out.println(student1);

		}
//	k) Delete student có id = 5;
		Student remove1 = studentList.remove(4);
		System.out.println("các phần tử còn lại");
		for (Student student1 : studentList) {
			System.out.println(student1);
//	l) Tạo 1 ArrayList tên là studentCopies và add tất cả students vào
//	studentCopies
		}
	}

	public void question2() {
		// a
		Stack<Student> newstack = new Stack<>();
		newstack.push(new Student("Nguyễn Văn Nam"));
		newstack.push(new Student("Nguyễn Văn Huyên"));
		newstack.push(new Student("Trần Văn Nam"));
		newstack.push(new Student("Nguyễn Văn A"));
		System.out.println(newstack);
		// b
		Queue<Student> newqueue = new LinkedList<>();
		newqueue.add(new Student("Nguyễn Văn Nam"));
		newqueue.add(new Student("Nguyễn Văn Huyên"));
		newqueue.add(new Student("Trần Văn Nam"));
		newqueue.add(new Student("Nguyễn Văn A"));

		System.out.println(newqueue);

	}

	public void question3() {
		Set<Student> setstudent = new HashSet<>();
		setstudent.add(new Student("Student1"));
		setstudent.add(new Student("Student2"));
		setstudent.add(new Student("Student3"));
		setstudent.add(new Student("Student4"));
		System.out.println(setstudent);
	}

	public void question4() {
		Set<Student> setstudent = new HashSet<>();
		setstudent.add(new Student("aStudent1"));
		setstudent.add(new Student("bStudent2"));
		setstudent.add(new Student("dStudent3"));
		setstudent.add(new Student("cStudent4"));
		System.out.println(setstudent);

	}
}