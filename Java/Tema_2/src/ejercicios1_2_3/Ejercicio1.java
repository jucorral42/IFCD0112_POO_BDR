package ejercicios1_2_3;

import java.util.Scanner;

public class Ejercicio1 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("Introduzca su edad");
		int edad = scan.nextInt();

		while (edad < 18) {
			if (edad < 18) {
				System.out.println("Es usted menor de edad");
				System.out.println("Introduzca de nuevo su edad, se repetira hasta que se mayor de edad");
				edad = scan.nextInt();

			} else {
				break;
			}
		}
		System.out.println("Es usted mayor de edad");
		scan.close();
	}

}
