package com.vti.entity;

import java.time.LocalDate;

public class Group {
	int GroupID;
	String GroupName;
	Account Creator;
	LocalDate CreateDate;
	Account[] accounts;
	
	
	public Group(int id, String name, Account creator, LocalDate createDate, Account[] accounts) {
			this.GroupID = id;
			this.GroupName = name;
			this.Creator = creator;
			this.CreateDate = createDate;
			this.accounts = accounts;
			}


	public Group() {
		// TODO Auto-generated constructor stub
	}


	public Group(int i, String string, Account ab, String string2) {
		// TODO Auto-generated constructor stub
	}


	
	
	
}
