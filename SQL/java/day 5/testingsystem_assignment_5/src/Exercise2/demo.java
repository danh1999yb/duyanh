package Exercise2;

import java.util.Scanner;

public class demo {
	private tuyensinh tuyensinh;
	private Scanner sc;

	public demo() {
		sc = new Scanner(System.in);
		tuyensinh = new tuyensinh();
	}

	public void question2() {
		loadMenu();
	}

	private void loadMenu() {
	while (true) {
	System.out.println("=======================================================================");

	System.out.println("=================Lựa chọn chức năng bạn	muốn sử dụng===================");

	System.out.println("=== 1. Insert Contestant.===");

	System.out.println("=== 2. View Contestant	===");

	System.out.println("=== 3. Find by idNum Contestant . ===");

	System.out.println("=== 4. Exit.===");
	System.out.println("======================================================================");

	int menuChoose = sc.nextInt();
	switch (menuChoose) {
	case 1:
	tuyensinh.addContestant();
	break;
	case 2:
	tuyensinh.showInfothongtinsv();
	break;
	case 3:
	System.out.println("Nhập vào ID cần tìm kiếm: ");
	int id = sc.nextInt();
	tuyensinh.findById(id);
	break;
	case 4:
	return;
	default:

	System.out.println("Alarm: Lựa chọn đúng số trên menu");

	break;
	}
	}
	}
}
