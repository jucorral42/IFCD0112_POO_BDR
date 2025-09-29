package ejercicio3_pag7;

import java.util.Scanner;

public class Ejercicio3_pag7 {
	public static void main(String[] args) {
		int numUs;

		Scanner scan = new Scanner(System.in);
		System.out.println("Introduzca un numero natural para iniciar el bucle");
		numUs = scan.nextInt();
		while ( numUs != 1) {
			if (numUs ==1)
			numUs--;
			System.out.println("Numero " + numUs);
			
		}
		
		scan.close();
	}

}
