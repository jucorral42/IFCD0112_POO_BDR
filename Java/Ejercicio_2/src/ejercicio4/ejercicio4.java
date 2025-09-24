package ejercicio4;

import java.util.Arrays;
import java.util.Scanner;

public class ejercicio4 {

	public static void main(String[] args) {
		
		
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("introduzca tamaño de la lista");
		int [] numeros = new int [scanner.nextInt()] ;
		for (int x= 0; x < numeros.length; x++) {
			System.out.println("inserte numeros");
			numeros[x]=scanner.nextInt();	
		}
		Arrays.sort(numeros);
		System.out.println(numeros[numeros.length -1]);
	}

}
