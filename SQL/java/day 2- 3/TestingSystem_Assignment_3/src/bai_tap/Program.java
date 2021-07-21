package bai_tap;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Locale;
import java.util.Random;
import java.util.Scanner;

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
		Position1.PositionName = PositionName.PM;

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

		// Question 1:
		// Kiểm tra account thứ 2
		// Nếu không có phòng ban (tức là department == null) thì sẽ in ra text
		// "Nhân viên này chưa có phòng ban"
		// Nếu không thì sẽ in ra text "Phòng ban của nhân viên này là ..."

		if (account2.Department == null) {
			System.out.println("Nhân viên này chưa có phòng ban");
		} else {
			System.out.println("Phòng ban của nhân viên này là" + account2.Department.name);
		}
		System.out.println("\n");

		// Question 2:
		// Kiểm tra account thứ 2
		// Nếu không có group thì sẽ in ra text "Nhân viên này chưa có group"
		// Nếu có mặt trong 1 hoặc 2 group thì sẽ in ra text "Group của nhân viên
		// này là Java Fresher, C# Fresher"
		// Nếu có mặt trong 3 Group thì sẽ in ra text "Nhân viên này là người
		// quan trọng, tham gia nhiều group"
		// Nếu có mặt trong 4 group trở lên thì sẽ in ra text "Nhân viên này là
		// người hóng chuyện, tham gia tất cả các group"
		if (account2.groups == null) {
			System.out.println("Nhân viên này chưa có phòng ban");
		} else {
			int da = account2.groups.length;
			if (da == 1 || da == 2) {
				System.out.println("Nhân viên này chưa có phòng ban");
			}
			if (da == 3) {
				System.out.println("Nhân viên này chưa có phòng ban");
			}
			if (da == 4) {
				System.out.println("Nhân viên này chưa có phòng ban");
			}
		}
		System.out.println("\n");
		// Question 3:
		// Sử dụng toán tử ternary để làm Question 1
		System.out.println(account2 == null ? "Nhân viên này chưa có phòng ban"
				: "Nhân viên này chưa có phòng ban" + account2.Department.name);

		// Question 4:
		// Sử dụng toán tử ternary để làm yêu cầu sau:
		// Kiểm tra Position của account thứ 1
		// Nếu Position = Dev thì in ra text "Đây là Developer"
		// Nếu không phải thì in ra text "Người này không phải là Developer"

		System.out.println(
				account1.Position.PositionName.toString() == "DEV" ? "Đây là Developer" : "Đây k là Developer");
		System.out.println("\n");
		// Question 5:
		// Lấy ra số lượng account trong nhóm thứ 1 và in ra theo format sau:
		// Nếu số lượng account = 1 thì in ra "Nhóm có một thành viên"
		// Nếu số lượng account = 2 thì in ra "Nhóm có hai thành viên"
		// Nếu số lượng account = 3 thì in ra "Nhóm có ba thành viên"
		// Còn lại in ra "Nhóm có nhiều thành viên"
		if (group1.accounts == null) {
			System.out.println("Nhóm k có thành viên");
		} else {
			int da = group1.accounts.length;
			if (da == 1) {
				System.out.println("Nhóm có 1 thành viên");
			}
			if (da == 2) {
				System.out.println("Nhóm có hai thành viên");
			}
			if (da == 3) {
				System.out.println("Nhóm có 3 thành viên");
			}
			if (da == 4) {
				System.out.println("Nhóm có 4 thành viên");
			}
		}
		System.out.println("\n");
		// Question 6:
		// Sử dụng switch case để làm lại Question 2
		if (account2.groups == null) {
			System.out.println("Nhân viên này chưa có group");
		} else {
			switch (account2.groups.length) {
			case 1:
				System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
				break;
			case 2:
				System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
				break;
			case 3:
				System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
				break;
			default:
				System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
				break;
			}
		}
		System.out.println("\n");
// Question 7:
// Sử dụng switch case để làm lại Question 4
// FOREACH
		String positionName = account1.Position.PositionName.toString();
		switch (positionName) {
		case "DEV":
			System.out.println("Đây là Developer");
			break;
		default:
			System.out.println("Người này không phải là Developer");
			break;
		}
		System.out.println("\n");
// Question 8:
// In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của
// họ
		Account[] accounth = { account1, account2, account3 };
		for (int i = 0; i < accounth.length; i++) {
			System.out.println("Thong tin account thu" + (i + 1) + "la :");
			System.out.println("email:" + accounth[i].Email);
			System.out.println("name:" + accounth[i].FullName);
		}
		System.out.println("\n");
// Question 9:
// In ra thông tin các phòng ban bao gồm: id và name
// FOR
		Department[] departmenta = { department1, department2, department3 };
		for (int i = 0; i < departmenta.length; i++) {
			System.out.println("Thông tin account thứ " + (i + 1) + "là:");

			System.out.println("id: " + departmenta[i].id);
			System.out.println("name: " + departmenta[i].name);

		}
		System.out.println("\n");
// Question 10:
// In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của
// họ theo định dạng như sau:
// Thông tin account thứ 1 là:
// Email: NguyenVanA@gmail.com
// Full name: Nguyễn Văn A
// Phòng ban: Sale
// Thông tin account thứ 2 là:
// Email: NguyenVanB@gmail.com
// Full name: Nguyễn Văn B
// Phòng ban: Marketting
		Account[] a = { account1, account2 };
		for (int i = 0; i < a.length; i++) {
			System.out.println("Thông tin account thứ " + (i + 1) + "là:");

			System.out.println("Email: " + a[i].Email);
			System.out.println("Full name: " + a[i].FullName);
			System.out.println("Phòng ban: " + a[i].Department.name);
		}
		System.out.println("\n");
// Question 11:
// In ra thông tin các phòng ban bao gồm: id và name theo định dạng sau:
// Thông tin department thứ 1 là:
// Id: 1
// Name: Sale
// Thông tin department thứ 2 là:
// Id: 2
// Name: Marketing

		Department[] d = { department1, department2, department3 };
		for (int id = 0; id < d.length; id++) {
			System.out.println("Thông tin department thứ " + (id + 1) + "là:");

			System.out.println("Id: " + d[id].id);
			System.out.println("Name: " + d[id].name);
		}
		System.out.println("\n");
// Question 12:
// Chỉ in ra thông tin 2 department đầu tiên theo định dạng như Question 10
		// In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của
		// họ theo định dạng như sau:
		// Thông tin account thứ 1 là:
		// Email: NguyenVanA@gmail.com
		// Full name: Nguyễn Văn A
		// Phòng ban: Sale
		// Thông tin account thứ 2 là:
		// Email: NguyenVanB@gmail.com
		// Full name: Nguyễn Văn B
		// Phòng ban: Marketting
		Department[] ab = { department1, department2 };
		for (int i = 0; i < a.length; i++) {
			System.out.println("THong tin department thứ :" + (i + 1) + "la");
			System.out.println("id :" + ab[i].id);
			System.out.println("name :" + ab[i].name);
		}
		System.out.println("\n");
		// Question 13:
		// In ra thông tin tất cả các account ngoại trừ account thứ 2
		Account[] accArray2 = { account1, account2, account3 };
		for (int ia = 0; ia < accArray2.length; ia++) {
			if (ia != 1) {
				System.out.println("Thông tin account thứ " + (ia + 1) + " là:");

				System.out.println("Email: " + accArray2[ia].Email);
				System.out.println("Full name: " + accArray2[ia].FullName);

				System.out.println("Phòng ban: " + accArray2[ia].Department.name);

			}
		}
		System.out.println("\n");
		// Question 14:
		// In ra thông tin tất cả các account có id < 4
		Account[] accArray3 = { account1, account2, account3 };
		for (int ja = 0; ja < accArray3.length; ja++) {
			if (accArray3[ja].AccountID < 4) {
				System.out.println("Thông tin account thứ " + (ja + 1) + " là:");

				System.out.println("Email: " + accArray3[ja].Email);
				System.out.println("Full name: " + accArray3[ja].FullName);

				System.out.println("Phòng ban: " + accArray3[ja].Department.name);

			}
		}
		System.out.println("\n");
//		// Question 15:
//		// In ra các số chẵn nhỏ hơn hoặc bằng 20
//
		for (int ia = 1; ia <= 20; ia++) {
			if (ia % 2 == 0) {
				System.out.print(ia + " ");
			}
		}
		System.out.println("\n");
// Exercise 2 (Optional): System out printf
// Question 1:
// Khai báo 1 số nguyên = 5 và sử dụng lệnh System out printf để in ra số
// nguyên đó

		int abc = 5;
		System.out.printf("%d%n", abc);

		System.out.println("\n");
//// Question 2:
// Khai báo 1 số nguyên = 100 000 000 và sử dụng lệnh System out printf để in
// ra số nguyên đó thành định dạng như sau: 100,000,000
		int songuyen = 100000000;
		System.out.printf("%,d%n", songuyen);
		System.out.println("\n");
// Question 3:
// Khai báo 1 số thực = 5,567098 và sử dụng lệnh System out printf để in ra số
// thực đó chỉ bao gồm 4 số đằng sau
		float aa = 5.567098f;
		System.out.printf("%5.4f%n ", aa);
// Question 4:
// Khai báo Họ và tên của 1 học sinh và in ra họ và tên học sinh đó theo định
// dạng như sau:
// Họ và tên: "Nguyễn Văn A" thì sẽ in ra trên console như sau:
// Tên tôi là "Nguyễn Văn A" và tôi đang độc thân.
		String cau4 = "Nguyen Van A";
		System.out.printf(" Tên tôi là :" + cau4 + " Và tôi đang độc thân");
		System.out.println("\n");

// Question 5:
// Lấy thời gian bây giờ và in ra theo định dạng sau:
// 24/04/2020 11h:16p:20s

		System.out.println(new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(Calendar.getInstance().getTime()));
		System.out.println("\n");

// Question 6:
// In ra thông tin account (như Question 8 phần FOREACH) theo định dạng
// table (giống trong Database)
//In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của
//họ
//
// Exercise 3 (Optional): Date Format
// Question 1:
// In ra thông tin Exam thứ 1 và property create date sẽ được format theo định
// dạng vietnamese

// Question 2:
// In ra thông tin: Exam đã tạo ngày nào theo định dạng
// Năm – tháng – ngày – giờ – phút – giây
// Question 3:
// Chỉ in ra năm của create date property trong Question 2
//
// 4
//
// Question 4:
// Chỉ in ra tháng và năm của create date property trong Question 2
// Question 5:
// Chỉ in ra "MM-DD" của create date trong Question 2
//
// Exercise 4 (Optional): Random Number
// Question 1:
// In ngẫu nhiên ra 1 số nguyên
		Random ramdom = new Random();
		int x = ramdom.nextInt();
		System.out.println(x);
		System.out.println("\n");
// Question 2:
// In ngẫu nhiên ra 1 số thực
		Random ramdom2 = new Random();
		float xx = ramdom2.nextFloat();
		System.out.println(xx);
		System.out.println("\n");
// Question 3:
// Khai báo 1 array bao gồm các tên của các bạn trong lớp, sau đó in ngẫu nhiên
// ra tên của 1 bạn
		String[] aaa = { "da", "db", "dc" };
		int q = ramdom.nextInt(aaa.length);
		System.out.println("tên:" + aaa[q]);
		System.out.println("\n");

// Question 4:
// Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 24-07-1995 tới ngày 20-12-
// 1995
		Random random4 = new Random();
		int minDay = (int) LocalDate.of(1995, 7, 24).toEpochDay();
		int maxDay = (int) LocalDate.of(1995, 12, 20).toEpochDay();
		long randomDay = minDay + random4.nextInt(maxDay - minDay);

		LocalDate randomBirthDate = LocalDate.ofEpochDay(randomDay);

		System.out.println(randomBirthDate);
		System.out.println("\n");

// Question 5:
// Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 1 năm trở lại đây
		Random random5 = new Random();
		int now = (int) LocalDate.now().toEpochDay();

		int aaaa = now - random5.nextInt(365);
		LocalDate date = LocalDate.ofEpochDay(aaaa);
		System.out.println("Ngày ngẫu nhiên là: " + date);
		System.out.println("\n");

// Question 6:
// Lấy ngẫu nhiên 1 ngày trong quá khứ
		Random random6 = new Random();
		int now1 = (int) LocalDate.now().toEpochDay();

		long cau6 = random6.nextInt(now1);
		LocalDate dateee = LocalDate.ofEpochDay(cau6);
		System.out.println("Ngày ngẫu nhiên là: " + dateee);
		System.out.println("\n");

// Question 7:
// Lấy ngẫu nhiên 1 số có 3 chữ số
		Random random7 = new Random();
		int so = random7.nextInt(999);
		System.out.println(so);
		System.out.println("\n");
// Exercise 5: Input from console
// Question 1:
// Viết lệnh cho phép người dùng nhập 3 số nguyên vào chương trình
		Scanner scanner = new Scanner(System.in);
		System.out.println("nhap vao so nguyen ");
		if (scanner.hasNextInt()) {
			int xa = scanner.nextInt();
			System.out.println("Ban vua nhap " + xa);
			int xab = scanner.nextInt();
			System.out.println("Ban vua nhap " + xab);
			int xac = scanner.nextInt();
			System.out.println("Ban vua nhap " + xac);
		}

// Question 2:
// Viết lệnh cho phép người dùng nhập 2 số thực vào chương trình
		Scanner scanner2 = new Scanner(System.in);
		System.out.println("nhap vao so thực ");
		if (scanner2.hasNextFloat()) {
			float xa = scanner2.nextFloat();
			System.out.println("Ban vua nhap " + xa);
			float xab = scanner2.nextFloat();
			System.out.println("Ban vua nhap " + xab);
		}
// Question 3:
// Viết lệnh cho phép người dùng nhập họ và tên
		Scanner scanner3 = new Scanner(System.in);
		System.out.println("nhap vao họ tên ");
		String da = scanner3.next();
		System.out.println("Ban vua nhap " + da);
// Question 4:
// Viết lệnh cho phép người dùng nhập vào ngày sinh nhật của họ
		Scanner scanner4 = new Scanner(System.in);
		System.out.println("nhap vao ngay sinh ");
		String daa = scanner4.next();
		System.out.println("Ban vua nhap " + daa);
// Question 5:
// Viết lệnh cho phép người dùng tạo account (viết thành method)
// Đối với property Position, Người dùng nhập vào 1 2 3 4 5 và vào
// chương trình sẽ chuyển thành Position.Dev, Position.Test,
// Position.ScrumMaster, Position.PM

// Question 6:
// Viết lệnh cho phép người dùng tạo department (viết thành method)

		Scanner scanner5 = new Scanner(System.in);
		System.out.println("tao department");
		Department dep = new Department();
		System.out.println("nhap id:");
		dep.id = scanner5.nextInt();
		System.out.println("nhap name:");
		dep.name = scanner5.next();
		System.out.println("thông tin ID:" + dep.id + " " + " thong tin name:" + dep.name);
// Question 7:
// Nhập số chẵn từ console
//		Scanner sc = new Scanner(System.in);
//		while (true) {
//			System.out.println("Hãy nhập vào 1 số chẵn: ");
//			int aq = sc.nextInt();
//			if (aq % 2 == 0) {
//				System.out.println("Bạm vừa nhập vào:" + aq);
//				return;
//			} else {
//				System.out.println("Nhập sai, đây không phải là số chẵn");
//
//			}
//		}
	
// Question 8:
// Viết chương trình thực hiện theo flow sau:
// Bước 1:
// Chương trình in ra text "mời bạn nhập vào chức năng muốn sử
// dụng"
// Bước 2:
// Nếu người dùng nhập vào 1 thì sẽ thực hiện tạo account
// Nếu người dùng nhập vào 2 thì sẽ thực hiện chức năng tạo
// department
// Nếu người dùng nhập vào số khác thì in ra text "Mời bạn nhập
// lại" và quay trở lại bước 1
//
// Question 9:
// Viết method cho phép người dùng thêm group vào account theo flow sau:
// Bước 1:
// In ra tên các usernames của user cho người dùng xem
// Bước 2:
// Yêu cầu người dùng nhập vào username của account
// Bước 3:
// In ra tên các group cho người dùng xem
// Bước 4:
// Yêu cầu người dùng nhập vào tên của group
// Bước 5:
// Dựa vào username và tên của group người dùng vừa chọn, hãy
// thêm account vào group đó .
// Question 10: Tiếp tục Question 8 và Question 9
// Bổ sung thêm vào bước 2 của Question 8 như sau:
// Nếu người dùng nhập vào 3 thì sẽ thực hiện chức năng thêm group vào
// account
// Bổ sung thêm Bước 3 của Question 8 như sau:
// Sau khi người dùng thực hiện xong chức năng ở bước 2 thì in ra dòng
// text để hỏi người dùng "Bạn có muốn thực hiện chức năng khác
// không?". Nếu người dùng chọn "Có" thì quay lại bước 1, nếu người
// dùng chọn "Không" thì kết thúc chương trình (sử dụng lệnh return để
// kết thúc chương trình)
// Question 11: Tiếp tục Question 10
// Bổ sung thêm vào bước 2 của Question 8 như sau:
// Nếu người dùng nhập vào 4 thì sẽ thực hiện chức năng thêm account
// vào 1 nhóm ngẫu nhiên, chức năng sẽ được cài đặt như sau:
// Bước 1:
// In ra tên các usernames của user cho người dùng xem
//
// 6
//
// Bước 2:
// Yêu cầu người dùng nhập vào username của account
// Bước 3:
// Sau đó chương trình sẽ chọn ngẫu nhiên 1 group
// Bước 4:
// Thêm account vào group chương trình vừa chọn ngẫu
// nhiên
//
// Exercise 6 (Optional): Method
// Question 1:
// Tạo method để in ra các số chẵn nguyên dương nhỏ hơn 10
// Question 2:
// Tạo method để in thông tin các account
// Question 3:
// Tạo method để in ra các số nguyên dương nhỏ hơn 10

		
		
								// bai 3
//		Question 1:
//			Khai báo 2 số lương có kiểu dữ liệu là float.
//			Khởi tạo Lương của Account 1 là 5240.5 $
//			Khởi tạo Lương của Account 2 là 10970.055$
//			Khai báo 1 số int để làm tròn Lương của Account 1 và in số int đó ra
//			Khai báo 1 số int để làm tròn Lương của Account 2 và in số int đó ra
		short luong1;
		short luong2;

		luong1 = (int) 5240.5;
		luong2 = (int) 10970.055;
		System.out.println("so luong la: " + luong1 + "|| luong2:" + luong2);
		int tinhluong1 = (int) luong1;
		int tinhluong2 = (int) luong2;
		System.out.println("tinhluong1: " + tinhluong1 + " || tinhluong2: " + tinhluong2);
//			Question 2:
//			Lấy ngẫu nhiên 1 số có 5 chữ số (những số dưới 5 chữ số thì sẽ thêm
//			có số 0 ở đầu cho đủ 5 chữ số)
		int min = 0;
		int max = 99999;
		int aw = (int) (Math.random() * max) + min;
		while (aw < 10000) {
		aw = aw * 10;
		}
		System.out.println("Số ngẫu nhiên: " + aw);
//			Question 3:
//			Lấy 2 số cuối của số ở Question 2 và in ra.
//			Gợi ý:
//			Cách 1: convert số có 5 chữ số ra String, sau đó lấy 2 số cuối
//			Cách 2: chia lấy dư số đó cho 100

		int min1 = 0;
		int max2 = 99999;
		int ae = (int) (Math.random() * max) + min;
		while (ae < 10000) {
		ae = ae * 10;
		}
		System.out.printf("===Question2======\n");
		System.out.println("Số ngẫu nhiên: " + a);
		System.out.println("======Question3=======");
		String b = String.valueOf(a);
		System.out.println("Hai số cuối: " + b.substring(3));
		
//			Question 4:
//			Viết 1 method nhập vào 2 số nguyên a và b và trả về thương của chúng
//
//			Exercise 2 (Optional): Default value
//			Question 1:
//			Không sử dụng data đã insert từ bài trước, tạo 1 array Account và khởi
//			tạo 5 phần tử theo cú pháp (sử dụng vòng for để khởi tạo):
//			 Email: "Email 1"
//			 Username: "User name 1"
//			 FullName: "Full name 1"
//			 CreateDate: now
//
//			Exercise 3(Optional): Boxing & Unboxing
//			Question 1:
//			Khởi tạo lương có datatype là Integer có giá trị bằng 5000.
//			Sau đó convert lương ra float và hiển thị lương lên màn hình (với số
//			float có 2 số sau dấu thập phân)
//
//			2
//
//			Question 2:
//			Khai báo 1 String có value = "1234567"
//			Hãy convert String đó ra số int
//			Question 3:
//			Khởi tạo 1 số Integer có value là chữ "1234567"
//			Sau đó convert số trên thành datatype int
//
//			Exercise 4: String
//			Question 1:
//			Nhập một xâu kí tự, đếm số lượng các từ trong xâu kí tự đó (các từ có
//			thể cách nhau bằng nhiều khoảng trắng );
//			Question 2:
//			Nhập hai xâu kí tự s1, s2 nối xâu kí tự s2 vào sau xâu s1;
//			Question 3:
//			Viết chương trình để người dùng nhập vào tên và kiểm tra, nếu tên chư
//			viết hoa chữ cái đầu thì viết hoa lên
//			Question 4:
//			Viết chương trình để người dùng nhập vào tên in từng ký tự trong tên
//			của người dùng ra
//			VD:
//			Người dùng nhập vào "Nam", hệ thống sẽ in ra
//			"Ký tự thứ 1 là: N"
//			"Ký tự thứ 1 là: A"
//			"Ký tự thứ 1 là: M"
//
//			Question 5:
//			Viết chương trình để người dùng nhập vào họ, sau đó yêu cầu người
//			dùng nhập vào tên và hệ thống sẽ in ra họ và tên đầy đủ
//			Question 6:
//			Viết chương trình yêu cầu người dùng nhập vào họ và tên đầy đủ và
//			sau đó hệ thống sẽ tách ra họ, tên , tên đệm
//			VD:
//			Người dùng nhập vào "Nguyễn Văn Nam"
//			Hệ thống sẽ in ra
//			"Họ là: Nguyễn"
//			"Tên đệm là: Văn"
//			"Tên là: Nam"
//
//			Question 7:
//			Viết chương trình yêu cầu người dùng nhập vào họ và tên đầy đủ và
//			chuẩn hóa họ và tên của họ như sau:
//			a) Xóa dấu cách ở đầu và cuối và giữa của chuỗi người dùng nhập
//			vào
//
//			3
//
//			VD: Nếu người dùng nhập vào " nguyễn văn nam " thì sẽ
//			chuẩn hóa thành "nguyễn văn nam"
//			b) Viết hoa chữ cái mỗi từ của người dùng
//			VD: Nếu người dùng nhập vào " nguyễn văn nam " thì sẽ
//			chuẩn hóa thành "Nguyễn Văn Nam"
//
//			Question 8:
//			In ra tất cả các group có chứa chữ "Java"
//			Question 9:
//			In ra tất cả các group "Java"
//			Question 10 (Optional):
//			Kiểm tra 2 chuỗi có là đảo ngược của nhau hay không.
//			Nếu có xuất ra “OK” ngược lại “KO”.
//			Ví dụ “word” và “drow” là 2 chuỗi đảo ngược nhau.
//			Question 11 (Optional): Count special Character
//			Tìm số lần xuất hiện ký tự "a" trong chuỗi
//			Question 12 (Optional): Reverse String
//			Đảo ngược chuỗi sử dụng vòng lặp
//			Question 13 (Optional): String not contains digit
//			Kiểm tra một chuỗi có chứa chữ số hay không, nếu có in ra false ngược
//			lại true.
//			Ví dụ:
//			"abc" => true
//			"1abc", "abc1", "123", "a1bc", null => false
//
//			Question 14 (Optional): Replace character
//			Cho một chuỗi str, chuyển các ký tự được chỉ định sang một ký tự khác
//			cho trước.
//			Ví dụ:
//			"VTI Academy" chuyển ký tự 'e' sang '*' kết quả " VTI Acad*my"
//			Question 15 (Optional): Revert string by word
//			Đảo ngược các ký tự của chuỗi cách nhau bởi dấu cách mà không dùng
//			thư viện.
//			Ví dụ: " I am developer " => "developer am I".
//			Các ký tự bên trong chỉ cách nhau đúng một dấu khoảng cách.
//			Gợi ý: Các bạn cần loại bỏ dấu cách ở đầu và cuối câu, thao tác cắt
//			chuỗi theo dấu cách
//			Question 16 (Optional):
//
//			4
//
//			Cho một chuỗi str và số nguyên n >= 0. Chia chuỗi str ra làm các phần
//			bằng nhau với n ký tự. Nếu chuỗi không chia được thì xuất ra màn
//			hình “KO”.
//
//			Exercise 5: Object’s Method
//			Question 1:
//			In ra thông tin của phòng ban thứ 1 (sử dụng toString())
//			Question 2:
//			In ra thông tin của tất cả phòng ban (sử dụng toString())
//			Question 3:
//			In ra địa chỉ của phòng ban thứ 1
//			Question 4: Kiểm tra xem phòng ban thứ 1 có tên là "Phòng A" không?
//			Question 5: So sánh 2 phòng ban thứ 1 và phòng ban thứ 2 xem có bằng nhau
//			không (bằng nhau khi tên của 2 phòng ban đó bằng nhau)
//			Question 6: Khởi tạo 1 array phòng ban gồm 5 phòng ban, sau đó in ra danh
//			sách phòng ban theo thứ tự tăng dần theo tên (sắp xếp theo vần ABCD)
//			VD:
//			Accounting
//			Boss of director
//			Marketing
//			Sale
//			Waiting room
//			Question 7: Khởi tạo 1 array học sinh gồm 5 Phòng ban, sau đó in ra danh
//			sách phòng ban được sắp xếp theo tên
//			VD:
//			Accounting
//			Boss of director
//			Marketing
//			waiting room
//			Sale		
		

	}
}