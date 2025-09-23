package Salario;

import java.text.DecimalFormat;
import java.util.Scanner;

public class CalculadoraSalario {
	public static double modificador1(double salario) {

		return (salario*1.20);
	}
	public static double modificador2(double salario, double modificador) {
		
	return(salario * modificador);	
	}

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		DecimalFormat decimal = new DecimalFormat("#.00");
		double salario;
		String nombre;
		double modificador;
		
		System.out.println("Introduzca su nombre");
		nombre = scanner.next();
		System.out.println("Introduzca su salario");
		salario = scanner.nextDouble();
		
		
		System.out.println(nombre + " tiene un nuevo salario de " + decimal.format(modificador1(salario)));
		System.out.println("Escriba el modificador nuevo para el salario en porcentaje");
		modificador = scanner.nextDouble()/100;
		System.out.println(nombre + " tiene un nuevo salario de " + decimal.format(modificador2(salario,modificador)));
		
		
		scanner.close();
	}

}
