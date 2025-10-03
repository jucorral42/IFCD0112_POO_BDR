package ejercicio1_pagina9;

import java.util.Scanner;

public class ejerccicio1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

//		for (int i = 10; i < 15; i++) {
//			System.out.println("El numero es " + i);
//			
//		}

//		System.out.println("Introduzca un numero");
//		int numero = sc.nextInt();
//		
//		for (int i = 0; i <= numero; i++) {
//			System.out.println("Numero natural:" + i);
//			
//		}
		System.out.println("Cuantos candidatos van a participar");
		int numCandidatos = sc.nextInt();
		boolean[] esvalido = new boolean[numCandidatos];

		for (int i = 0; i <=numCandidatos ; i++) {
			System.out.println("Introduzca altura del participante " + (i + 1));
			int altura = sc.nextInt();
			System.out.println("Introduzca edad del participante " + (i + 1));
			int edad = sc.nextInt();
			System.out.println("Introduzca peso del participante " + (i + 1));
			int peso = sc.nextInt();

			if (altura > 180 && edad < 15 && peso < 100) {
				esvalido[i] = true;
			} else {
				esvalido[i] = false;
			}

		}
		int i = 0;
		for (boolean b : esvalido) {
			i++;
			System.out.println(b ? "Esta citado usted el dia 10 de septiembre a las 19 participante " + i
					: "Gracias por participar participante " + i);
		}
		sc.close();
	}

}
