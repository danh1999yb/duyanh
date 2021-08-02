package backend;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import entity.Student3;

public class ex3 {
	public void question1() {
		Student3<Float> student3 = new Student3<Float>(1.0f, "da");
		Student3<Integer> student4 = new Student3<Integer>(1, "da");
		Student3<Double> student5 = new Student3<Double>(1.1, "da");

		System.out.println(student3);
		System.out.println(student4);
		System.out.println(student4);
		System.out.println("==============");
	}

	

	public void question4() {
		
		// float
		List<Float> student1 = new ArrayList<Float>();
		student1.add(1.1f);
		student1.add(1.2f);
		student1.add(1.3f);
		// int 
		List<Integer> student4 = new ArrayList<Integer>();
		student4.add(1);
		student4.add(2);
		student4.add(3);
		// double
		List<Double> student7 = new ArrayList<Double>();
		student7.add(1.1);
		student7.add(1.2);
		student7.add(1.3);
		// long
		List<Long> student10 = new ArrayList<Long>();
		student10.add(1L);
		student10.add(2L);
		student10.add(3L);
		printEle(student1);
		System.out.println("===");
		printEle(student4);
		System.out.println("===");
		printEle(student7);
		System.out.println("===");
		printEle(student10);
		
	}
    public <E> void printEle(List<E> list) {
        list.forEach(x -> System.out.println(x.toString()));
    }
    public void question5() {
    	// a 
    List<Integer> salaries = new ArrayList<Integer>();
    salaries.add(100);
    salaries.add(100);
    salaries.add(100);
    System.out.println(salaries);
    // b
    List<Float> salariesb = new ArrayList<Float>();
    salariesb.add(1.1f);
    salariesb.add(1.2f);
    salariesb.add(1.3f);
    System.out.println(salariesb);
    // c
    List<Double> salariesc = new ArrayList<Double>();
    salariesc.add(1.1);
    salariesc.add(1.2);
    salariesc.add(1.3);
    System.out.println(salariesc);
    }
    
}
