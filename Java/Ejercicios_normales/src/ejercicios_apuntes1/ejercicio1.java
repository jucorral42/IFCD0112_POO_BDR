package ejercicios_apuntes1;

import java.util.Scanner;

public class ejercicio1 {
	public static void main(String[] args) {
		String sexo;
		char primeraLetra;
		Scanner scanner = new Scanner (System.in);
		System.out.println("Introduzca el sexo del usuario");
		sexo = scanner.next();
		primeraLetra = sexo.charAt(0);
		System.out.println(primeraLetra);
		scanner.close();
		
	}

}
