package Exercise2;

import java.util.ArrayList;
import java.util.Scanner;

public class tuyensinh implements Ituyensinh {
	private ArrayList<thongtinsv> listthongtinsv;
	private Scanner sc;

	public tuyensinh() {
		listthongtinsv = new ArrayList<thongtinsv>();
		sc = new Scanner(System.in);
	}

	public void addContestant() {
		System.out.println("Nhập vào tên thí sinh:");
		String name = sc.next();
		System.out.println("Nhập vào địa chỉ thí sinh:");
		String address = sc.next();
		System.out.println("Nhập vào khối thí sinh chọn các khối A, B, C:");

		String khoithi = sc.next();
		thongtinsv thongtinsv = new thongtinsv(name, address, new khoithi(khoithi));

		listthongtinsv.add(thongtinsv);
	}

	@Override
	public void findById(int id) {
		for (thongtinsv thongtinsv : listthongtinsv) {
			if (thongtinsv.getId() == id) {
				System.out.println(thongtinsv);
			}
		}
	}

	@Override
	public void showInfothongtinsv() {
		for (thongtinsv thongtinsv : listthongtinsv) {
			System.out.println(thongtinsv);
		}
	}

	public void addthongtinsv() {
		// TODO Auto-generated method stub

	}



}