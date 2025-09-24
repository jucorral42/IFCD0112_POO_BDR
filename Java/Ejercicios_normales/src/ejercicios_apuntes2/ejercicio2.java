package ejercicios_apuntes2;
import java.util.Scanner;

public class ejercicio2 {
	public static void main(String[] args) {
		int peso;
		double pesoModificado;
		Scanner scanner = new Scanner (System.in);
		System.out.println("Introduzca su peso valor entero");
		peso = scanner.nextInt();
		pesoModificado = peso*0.97;
		System.out.printf("Su peso ideal es de %.2f",peso );
		scanner.close();
	}

}
