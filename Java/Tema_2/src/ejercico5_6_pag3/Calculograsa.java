package ejercico5_6_pag3;

import java.util.Scanner;

public class Calculograsa {

	static int calculoHombre(int cintura, int altura, int edad) {
		double calculo = 106.5 * (cintura / altura) - 28.36;
		if (edad >= 20 && edad <= 39) {
			if (calculo >= 8 && calculo <= 19) {
				return 1;
			}

		}
		if (edad >= 40 && edad <= 59) {
			if (calculo >=11 && calculo <=21) {
				return 1;
			}
		}
		if (edad >= 60 && edad <= 79) {
			if (calculo >=13 && calculo <= 23) {
				return 1;
			}
		}

		return 0;
	}

	static int calculoMujer(int cintura, int altura, int edad) {
		double calculo = 89.73 * (cintura / altura) - 15.14;
		if (edad >= 20 && edad <= 39) {
			if (calculo >= 21 && calculo <= 32) {
				return 1;
			}

		}
		if (edad >= 40 && edad <= 59) {
			if (calculo >=23 && calculo <=33) {
				return 1;
			}
		}
		if (edad >= 60 && edad <= 79) {
			if (calculo >=24 && calculo <= 35) {
				return 1;
			}
		}

		return 0;
	}

	public static void main(String[] args) {
		int cintura;
		int altura;
		int edad;
		String sexo;

		Scanner scan = new Scanner(System.in);
		System.out.println("Introduzca perimetro cintura en cm");
		cintura = scan.nextInt();
		System.out.println("Introduzca altura en cm");
		altura = scan.nextInt();
		System.out.println("Introduca sexo V = Varon M = Muje");
		sexo = scan.next();
		System.out.println("Introduzca su edad");
		edad = scan.nextInt();

		switch (sexo) {
		case "V":
				if(calculoHombre(cintura,altura,edad) == 1) {
				System.out.println("Esta Sano");
				break;
				}
				else {
				System.out.println("No esta sano");
				break;
				}

		case "M":
			if(calculoMujer(cintura,altura,edad) == 1) {
			System.out.println("Esta Sano");
			break;
			}
			else {
			System.out.println("No esta sano");
			break;
			}
		default:
			System.out.println("Algo no ha ido bien");
			break;

		}
		scan.close();

	}
}
