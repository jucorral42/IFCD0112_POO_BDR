package repaso;

import java.util.Scanner;

public class Ejercicio14 {

	public static void main(String[] args) {
		int intentos;
		int almacen[];
		int numeroDeCeros = 0;
		int numeroDeUnos = 0;
		int numeroDePruebas = 0;
		double porcentajeUnos[];
		double porcentajeCeros[];
		int cantidadIterada[];
		int posicion = 0;

		Scanner sc = new Scanner(System.in);

		System.out.println("Introduzca el numero de pruebas que desa realizar ");
		numeroDePruebas = sc.nextInt();
		porcentajeUnos = new double[numeroDePruebas];
		porcentajeCeros = new double[numeroDePruebas];
		cantidadIterada = new int[numeroDePruebas];// Asignamos 3 arrays para almacenar los valores y poder luego
													// sacarlos todos

		while (numeroDePruebas > 0) { // Vamos a realizar un numero determinado de pruebas para ver como los valores
										// tienden a 50%

			System.out.println("Introduzca el numero de iteraciones que desea");
			intentos = sc.nextInt();
			almacen = new int[intentos];
			for (int i = 0; i < almacen.length; i++) { // Recorremos la array almacenamos 1 o 0 y vamos subiendo en los
														// contadores correspondientes
				almacen[i] = (int) Math.round(Math.random());
				if (almacen[i] == 0) {
					numeroDeCeros++;
				} else {
					numeroDeUnos++;
				}
			}
			// Alamacenamos los datos obtenidos en 3 arrays;
			porcentajeUnos[posicion] = numeroDeUnos * 100 / almacen.length;
			porcentajeCeros[posicion] = numeroDeCeros * 100 / almacen.length;
			cantidadIterada[posicion] = intentos;

			numeroDePruebas--; // Bajamos el numero de iteaciones restantes a probar;
			posicion++; // Subimos la posicon de la array de resultados
			numeroDeCeros = 0;// Reiniciamos los contadores de 0 y 1
			numeroDeUnos = 0;
		}
		sc.close();
		for (int j = 0; j < porcentajeCeros.length; j++) { // Imprimimos el resultado

			System.out.println("El % de 1 es :" + porcentajeUnos[j]);
			System.out.println("El % de 0 es :" + porcentajeCeros[j]);
			System.out.println("El numero de numero generados aleatoriamente fue " + cantidadIterada[j]);

		}

	}

}
