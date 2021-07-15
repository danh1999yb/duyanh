package bai_tap;

import java.time.LocalDate;

import bai_tap.Position.PositionName;

public class Program {
	public static void main(String[] args) {

		// Department
		Department department1 = new Department();
		department1.id = 1;
		department1.name = "sale";

		Department department2 = new Department();
		department2.id = 2;
		department2.name = "tai_chinh";

		Department department3 = new Department();
		department3.id = 3;
		department3.name = "quet_rac";

		// postion
		Position Position1 = new Position();
		Position1.PositionID = 1;
		Position1.PositionName = PositionName.DEV;

		Position Position2 = new Position();
		Position2.PositionID = 2;
		Position2.PositionName = PositionName.PM;

		Position Position3 = new Position();
		Position3.PositionID = 3;
		Position3.PositionName = PositionName.SCRUM_MASTER;

		// Account
		Account account1 = new Account();
		account1.AccountID = 1;
		account1.Email = "daprovip";
		account1.Username = "duyanh";
		account1.FullName = "PhanDuyAnh";
		account1.Department = department1;
		account1.Position = Position1;
		account1.CreateDate = LocalDate.now();

		Account account2 = new Account();
		account2.AccountID = 2;
		account2.Email = "da123";
		account2.Username = "duyanhphan";
		account2.FullName = "NguyenPhanDuyAnh";
		account2.Department = department2;
		account2.Position = Position2;
		account2.CreateDate = LocalDate.now();

		Account account3 = new Account();
		account3.AccountID = 3;
		account3.Email = "duyanhdz";
		account3.Username = "duyanh";
		account3.FullName = "PhanDuyAnhD";
		account3.Department = department3;
		account3.Position = Position3;
		account3.CreateDate = LocalDate.now();

		// group
		Group group1 = new Group();
		group1.GroupID = 1;
		group1.GroupName = "fanclub";
		group1.Creator = account1;
		group1.CreateDate = LocalDate.now();
		Account[] Graccount = { account2, account3 };
		group1.accounts = Graccount;

		Group group2 = new Group();
		group2.GroupID = 2;
		group2.GroupName = "fanclub2";
		group2.Creator = account2;
		group2.CreateDate = LocalDate.now();
		Account[] Graccount2 = { account1, account3 };
		group2.accounts = Graccount2;

		Group group3 = new Group();
		group3.GroupID = 3;
		group3.GroupName = "fanclub3";
		group3.Creator = account3;
		group3.CreateDate = LocalDate.now();
		Account[] Graccount3 = { account2, account1 };
		group3.accounts = Graccount3;

		// GroupAccount
		GroupAccount GroupAccount1 = new GroupAccount();
		GroupAccount1.Group = group1;
		GroupAccount1.Account = account1;
		GroupAccount1.Date = LocalDate.now();

		GroupAccount GroupAccount2 = new GroupAccount();
		GroupAccount2.Group = group2;
		GroupAccount2.Account = account2;
		GroupAccount2.Date = LocalDate.now();

		GroupAccount GroupAccount3 = new GroupAccount();
		GroupAccount3.Group = group3;
		GroupAccount3.Account = account3;
		GroupAccount3.Date = LocalDate.now();

		// TypeQuestion
		TypeQuestion TypeQuestion1 = new TypeQuestion();
		TypeQuestion1.TypeID = 1;
		TypeQuestion1.TypeName = "daa";

		TypeQuestion TypeQuestion2 = new TypeQuestion();
		TypeQuestion2.TypeID = 2;
		TypeQuestion2.TypeName = "daha";

		TypeQuestion TypeQuestion3 = new TypeQuestion();
		TypeQuestion3.TypeID = 3;
		TypeQuestion3.TypeName = "da";

		// CategoryQuestion
		CategoryQuestion CategoryQuestion1 = new CategoryQuestion();
		CategoryQuestion1.CategoryID = 1;
		CategoryQuestion1.CategoryName = "da";

		CategoryQuestion CategoryQuestion2 = new CategoryQuestion();
		CategoryQuestion2.CategoryID = 2;
		CategoryQuestion2.CategoryName = "dad";

		CategoryQuestion CategoryQuestion3 = new CategoryQuestion();
		CategoryQuestion3.CategoryID = 3;
		CategoryQuestion3.CategoryName = "daa";

		// Question
		Question Question1 = new Question();
		Question1.QuestionID = 1;
		Question1.Content = "sieu_vip";
		Question1.Category = CategoryQuestion1;
		Question1.Type = TypeQuestion1;
		Question1.Creator = account1;
		Question1.CreateDate = LocalDate.now();

		Question Question2 = new Question();
		Question2.QuestionID = 2;
		Question2.Content = "sieu_vippro";
		Question2.Category = CategoryQuestion2;
		Question2.Type = TypeQuestion2;
		Question2.Creator = account2;
		Question2.CreateDate = LocalDate.now();

		Question Question3 = new Question();
		Question3.QuestionID = 3;
		Question3.Content = "sieu_vip1";
		Question3.Category = CategoryQuestion3;
		Question3.Type = TypeQuestion3;
		Question3.Creator = account3;
		Question3.CreateDate = LocalDate.now();

		// Answer
		Answer Answer1 = new Answer();
		Answer1.AnswerID = 1;
		Answer1.Content = "A_dung";
		Answer1.isCorrect = true;
		Answer1.Question = Question1;

		Answer Answer2 = new Answer();
		Answer2.AnswerID = 2;
		Answer2.Content = "b_dung";
		Answer2.isCorrect = true;
		Answer2.Question = Question2;

		Answer Answer3 = new Answer();
		Answer3.AnswerID = 3;
		Answer3.Content = "c_dung";
		Answer3.isCorrect = true;
		Answer3.Question = Question3;

		// Exam
		Exam Exam1 = new Exam();
		Exam1.ExamID = 1;
		Exam1.Code = "d001";
		Exam1.Title = "de thi";
		CategoryQuestion[] category12 = { CategoryQuestion1, CategoryQuestion2 };
		Exam1.Category = category12;
		Exam1.Duration = 60;
		Exam1.Creator = account1;
		Exam1.CreateDate = LocalDate.now();
		Question[] ques = { Question1, Question2 };
		Exam1.questions = ques;

		Exam Exam2 = new Exam();
		Exam2.ExamID = 2;
		Exam2.Code = "d001";
		Exam2.Title = "de toan";
		CategoryQuestion[] category123 = { CategoryQuestion1, CategoryQuestion3 };
		Exam2.Category = category12;
		Exam2.Duration = 60;
		Exam2.Creator = account1;
		Exam2.CreateDate = LocalDate.now();
		Question[] ques1 = { Question1, Question3 };
		Exam2.questions = ques;

		Exam Exam3 = new Exam();
		Exam3.ExamID = 3;
		Exam3.Code = "d001";
		Exam3.Title = "de kt";
		CategoryQuestion[] category1234 = { CategoryQuestion1, CategoryQuestion3 };
		Exam3.Category = category12;
		Exam3.Duration = 60;
		Exam3.Creator = account1;
		Exam3.CreateDate = LocalDate.now();
		Question[] ques2 = { Question3, Question2 };
		Exam3.questions = ques;

		// ExamQuestion
		ExamQuestion ExamQuestion1 = new ExamQuestion();
		ExamQuestion1.Exam = Exam1;
		ExamQuestion1.Question = Question1;

		ExamQuestion ExamQuestion2 = new ExamQuestion();
		ExamQuestion2.Exam = Exam2;
		ExamQuestion2.Question = Question2;

		ExamQuestion ExamQuestion3 = new ExamQuestion();
		ExamQuestion3.Exam = Exam3;
		ExamQuestion3.Question = Question3;

		
		// in ra department
		
		System.out.println("department 2 :");
		System.out.println("id:" + department2.id);
		System.out.println("Name:" + department2.name);
		System.out.println("\n");

		
		// in ra postion
		System.out.println("postion 1 :");
		System.out.println("PositionID:" + Position1.PositionID);
		System.out.println("PositionName:" + Position1.PositionName);
		System.out.println("\n");
		
		// in ra account 
		System.out.println("account 1 :");
		System.out.println("AccountID:" + account1.AccountID);
		System.out.println("Email:" + account1.Email);
		System.out.println("Username:" + account1.Username);
		System.out.println("FullName" + account1.FullName);
		System.out.println("Department:" + account1.Department.name);
		System.out.println("Position:" + account1.Position.PositionName);
		System.out.println("CreateDate:" + account1.CreateDate);
		System.out.println("groups:" + account1.groups);
		System.out.println("\n");
		
		

	}
}