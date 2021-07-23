package com.vti.frontend;

import com.vti.entity.Account;
import com.vti.entity.Group;

public class Excercise3 {
	public static void main(String[] args) {
		
		Group abc = new Group();
		Account ab = new Account();
		Group abcd = new Group(1, "da",ab, "1999-03-03" );
		System.out.println(abcd);
	}
}
