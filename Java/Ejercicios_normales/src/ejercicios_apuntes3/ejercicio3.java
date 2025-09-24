package ejercicios_apuntes3;

import java.util.Scanner;

public class ejercicio3 {

	public static void main(String[] args) {
		int peso;
		double altura;
		double imc;
		Scanner scanner = new Scanner(System.in);
		System.out.println("Introduzca su altura puede incluir decimales");
		altura = scanner.nextDouble();
		System.out.println("Introduzca su peso como valor entero");
		peso = scanner.nextInt();
		imc = (peso / (altura * altura));

		System.out.printf("Su IMC es : %.2f %n", imc,((imc < 25) ? " su IMC es alto" : " su IMC es bajo"));

		
		
		if (imc<18.5) {
			System.out.println("Su peso es bajo");
		} 
		if (imc >=18.5 && imc<=24.9)
		{
			System.out.println("Su peso esta en un rango normal");
		}
		if (imc <= 25 && imc <=29.9) {
			System.out.println("Tiene sobre peso");
		}
		else 
		{System.out.println("Tiene obesidad");
		}
		
		scanner.close();
	}
}
