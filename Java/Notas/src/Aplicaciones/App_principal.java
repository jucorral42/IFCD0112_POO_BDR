package Aplicaciones;

import java.util.Scanner;

import Asignaturas.*;

public class App_principal {
	static double media(double nota1, double nota2, double nota3) {

		return (nota1 + nota2 + nota3) / 3;

	}

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		double mediaTotal;

		// Instanciaciones
		Mates asignatura1 = new Mates(0, 0, 0);
		Lengua asignatura2 = new Lengua(0, 0);
		Ingles asignatura3 = new Ingles(0, 0, 0, 0, 0);

		// Matematicas
		System.out.println("Introduzca la primera nota de Matematicas");
		asignatura1.setNota1(scan.nextDouble());

		System.out.println("Introduzca la segunda nota de Matematicas");

		asignatura1.setNota2(scan.nextDouble());
		System.out.println("Introduzca la tercera nota de Matematicas");

		// Lengua
		asignatura1.setNota3(scan.nextDouble());
		System.out.println("Introduzca la primera nota de Lengua");
		asignatura2.setNota1(scan.nextDouble());

		System.out.println("Introduzca la segunda nota de Lengua");
		asignatura2.setNota2(scan.nextDouble());

		// Ingles
		System.out.println("Introduzca la primera nota de Ingles");
		asignatura3.setNota1(scan.nextDouble());

		System.out.println("Introduzca la segunda nota de Ingles");
		asignatura3.setNota2(scan.nextDouble());

		System.out.println("Introduzca la tercera nota de Ingles");
		asignatura3.setNota3(scan.nextDouble());

		System.out.println("Introduzca la cuarta nota de Ingles");
		asignatura3.setNota4(scan.nextInt());

		System.out.println("Introduzca la quinta nota de Ingles");
		asignatura3.setNota5(scan.nextInt());
		
		//Invocamos los metodos de las clases con void
		asignatura1.matematicas();
		asignatura2.lengua();
		
		//imprimimos la clase que devuelve double
		System.out.printf("La nota media de ingles es : %.2f \n", asignatura3.ingles());

		mediaTotal = media((asignatura1.getNota1() * 0.3 + asignatura1.getNota2() * 0.3 + asignatura1.getNota3() * 0.4),
				(asignatura2.getNota1() * 0.5 + asignatura2.getNota2() * 0.5), asignatura3.ingles());

		System.out.printf("La media global es %.2f", mediaTotal);
		scan.close();

	}

}
