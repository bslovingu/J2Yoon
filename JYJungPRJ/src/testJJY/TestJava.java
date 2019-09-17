package testJJY;

import java.util.Scanner;
import java.lang.Math;

public class TestJava {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scan = new Scanner(System.in);
		
		System.out.println("제곱수의 합을 어디까지 구하실건가요?");
		int R = scan.nextInt();

		int i;
		int j = 0;

		for (i = 1; i <= R; i++) {
			double K = Math.sqrt(i);
			int a = 0;
			int b = a + (int) K;
			if (K - b == 0) {
				j = j + i;
			}

		}

		System.out.println("1~"+R+"까지의 제곱수의 합은 " + j);

	}

}
