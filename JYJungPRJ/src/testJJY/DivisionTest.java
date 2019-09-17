package testJJY;

import java.util.Scanner;
import java.util.ArrayList;
import java.util.List;

public class DivisionTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner division = new Scanner(System.in);
		System.out.println("분자를 입력하십시오 : ");
		double first = division.nextDouble();
		System.out.println("분모를 입력하십시시오 : ");
		double second = division.nextDouble();

		double result = first / second;

		double sum = 0;
		double tmp=result;
		
		int i = 1;
		
		ArrayList<Object> div = new ArrayList<Object>();
		while (sum != result) {

			if (tmp - (1 / i) >= 0) {
				sum = sum + (1 / i);
				div.add(i);
				tmp=tmp-(1/i);
				
			}
			i++;

		}

		System.out.print(first + "/" + second + "=");
		for (int k = 0; k < div.size(); k++) {
			System.out.print("1/" + div.get(k));
		}
	}

}
