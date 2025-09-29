package Ejercicio2;

import java.util.Scanner;

public class Ejercicio2_pag7 {

	public static void main(String[] args) {
		int numUs;
		int contador = 1;
		Scanner scan = new Scanner(System.in);
		System.out.println("Introduzca un numero natural para iniciar el bucle");
		numUs = scan.nextInt();
		while (numUs >= contador) {
			System.out.println("Numero " + contador);
			contador++;
		}
		
		scan.close();
	}

}
