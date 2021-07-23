package com.vti.entity;

import java.time.LocalDate;

public class Account {
	int AccountID;
	String Email;
	String Username;
	String FullName;
	Department Department;
	Position Position;
	LocalDate CreateDate;
	Group[] groups;

	public Account(int id, String email, String userName, String fullName) {
		this.AccountID = id;
		this.Email = email;
		this.Username = userName;
		this.FullName = fullName;
	}

	public Account(int id, String email, String userName, String fullName, Position position) {

		this.AccountID = id;
		this.Email = email;
		this.Username = userName;
		this.FullName = fullName;
		this.Position = position;
		this.CreateDate = LocalDate.now();
	}

	public Account(int id, String email, String userName, String fullName, Position position, LocalDate createDate) {
		this.AccountID = id;
		this.Email = email;
		this.Username = userName;
		this.FullName = fullName;
		this.Position = position;
		this.CreateDate = createDate;
	}

	public Account() {
		// TODO Auto-generated constructor stub
	}

	public int getAccountID() {
		return AccountID;
	}

	public void setAccountID(int accountID) {
		AccountID = accountID;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getFullName() {
		return FullName;
	}

	public void setFullName(String fullName) {
		FullName = fullName;
	}

	public Department getDepartment() {
		return Department;
	}

	public void setDepartment(Department department) {
		Department = department;
	}

	public Position getPosition() {
		return Position;
	}

	public void setPosition(Position position) {
		Position = position;
	}

	public LocalDate getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate(LocalDate createDate) {
		CreateDate = createDate;
	}

	public Group[] getGroups() {
		return groups;
	}

	public void setGroups(Group[] groups) {
		this.groups = groups;
	}
}
