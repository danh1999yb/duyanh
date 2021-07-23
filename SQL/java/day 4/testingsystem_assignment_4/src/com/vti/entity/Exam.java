package com.vti.entity;

import java.time.LocalDate;

public class Exam {
	int ExamID;
	String Code;
	String Title;
	CategoryQuestion[] Category;
	int Duration;
	Account Creator;
	LocalDate CreateDate;
	Question[] questions;
	
}
