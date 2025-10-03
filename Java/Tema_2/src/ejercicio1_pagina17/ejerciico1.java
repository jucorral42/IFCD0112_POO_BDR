package ejercicio1_pagina17;

import java.util.Scanner;

public class ejerciico1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Introduzca el numero de Alumnos");
		int tamañoX = sc.nextInt();
		System.out.println("Introduzca el numero de columnas");
		int tamañoY = sc.nextInt();
		sc.nextLine();
		String nombre;
		String sexo;

		String matriz[][] = new String[tamañoX][tamañoY];

		for (int i = 0; i < tamañoX; i++) {

			tamañoY = 0;
			System.out.println("Introduzca el nombre del alumno");
			matriz[i][0] = sc.nextLine();
			System.out.println("Introduzca el  sexo");
			matriz[i][1] = sc.nextLine();

		}
		System.out.println("Nombre" + "\t" + "Apellido");
		for (int i = 0; i < tamañoX; i++) {
			System.out.println(matriz[i][0] + "\t" + matriz[i][1]);
			for (int j = 2; j < tamañoY; j++) {
				System.out.print("\t-");
				
			}
		           }
		       		}

	}


