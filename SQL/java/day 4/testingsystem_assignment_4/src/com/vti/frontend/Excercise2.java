package com.vti.frontend;

import com.vti.entity.Account;
import com.vti.entity.Department;
import com.vti.entity.Position;

public class Excercise2 {
	public void main(String[] args) {
		Account acc = new Account();
		Account acc1 = new Account(1, "da", "b", "a");
		Position a = new Position();
		Account acc2 = new Account(1, "da", "b", "a", a);
		
		
		
		System.out.println(acc2);
	}
}

