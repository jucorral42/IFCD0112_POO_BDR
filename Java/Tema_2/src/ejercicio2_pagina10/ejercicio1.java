package ejercicio2_pagina10;

import java.util.Scanner;

public class ejercicio1 {

	public static void main(String[] args) {
//		Scanner ent = new Scanner(System.in);
//		double num1, num2;
//		System.out.print("Introduce el primer número: ");
//		num1 = ent.nextDouble();
//		System.out.print("Introduce el segundo número: ");
//		num2 = ent.nextDouble();
//		int op;
//		double resul;
//		do {
//		System.out.println(" 1. Gallego");
//		System.out.println(" 2. Ingles");
//		System.out.println(" 3. Frances");
//		System.out.println(" 4. ");
//		System.out.println(" \n Selecciona la operación a realizar: ");
//		op=ent.nextInt();
//		}
//		while (op <1 || op >4); // Si no es un valor válido, muestra de nuevo el menú inicial
//		if (op==1)
//		{ resul=num1+num2;
//		System.out.println("Resultado suma: "+resul); }
//		else if (op==2)
//		{ resul=num1-num2;
//		System.out.println("Resultado resta: "+resul); }
//		else if (op==3)
//		{ resul=num1*num2;
//		System.out.println("Resultado multiplicación: "+resul); }
//		else if (op==4)
//		{ resul=num1/num2;
//		System.out.println("Resultado división: "+resul); }
//		else { System.out.println("Operación No Válida"); }
//		ent.close();
		
		double inicio = System.nanoTime();
		int [] nums = {4,6,10,15};
		for (int i=0; i <nums.length; i++) {
		System.out.println(nums[i]);
		}
		double fin = System.nanoTime();
		System.out.print("Tiempo empleado NORMAL: "+(fin-inicio)+" nanosegundos");
		double inicio1 = System.nanoTime();
		int [] nums1 = {4,6,10,15};
		for (int n:nums1) {
		System.out.println(n);
		}
		double fin1 = System.nanoTime();
		System.out.print("Tiempo empleado EACH: "+(fin1-inicio1)+" nanosegundos");
		
	}

}
