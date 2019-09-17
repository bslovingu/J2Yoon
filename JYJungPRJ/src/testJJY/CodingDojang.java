package testJJY;

import java.util.Scanner;
import java.lang.Math;

public class CodingDojang {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scan = new Scanner(System.in);
		System.out.println("insert (final number + 1) : ");
		int N = scan.nextInt();

		int a, b, c, d, result, sum = 0;
		boolean[] generated = new boolean[N];

		for (int generator = 1; generator < N; generator++) {
			a = generator / 1000;
			b = (generator / 100) % 10;
			c = (generator / 10) % 10;
			d = (generator) % 10;

			result = a + b + c + d + generator;

			if ((result >= 1) && (result < N)) {
				generated[result] = true;
			}

		}
		for (int i = 1; i < N; i++) {
			if (generated[i] == false) {
				sum = sum + i;
			}
		}

		System.out.println("sum of Self-Number is " + sum);
	}

}
