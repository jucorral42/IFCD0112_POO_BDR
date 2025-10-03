package repaso;

import java.text.DecimalFormat;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Circunferencia {
	static double areaCircunferencia(double PI, double radio) {
		
		return(PI* Math.pow(radio, 2));
	}
	
	static double perimetroCircunferencia(double PI, double radio) {
		return (2*PI*radio);
	}
	
	public static void main(String[] args) {
		final double PI = Math.PI;
		double radio= 0;
		Scanner sc = new Scanner(System.in);
		Pattern p1 =  Pattern.compile("\\d\\.\\d");
		Matcher m1;
		String areaTruncada;
		String perimetroTruncado;
		DecimalFormat decimal1 = new DecimalFormat("#.0");
	do {
		System.out.println("Introduzca un valor para el radio con los argumentos 9.9");
		String stringRadio = sc.next();
		m1=p1.matcher(stringRadio);
		if(m1.matches()){
			radio = Double.parseDouble(stringRadio);
			sc.close();
			break;
		}
		
	} while (!m1.matches());
	
		areaTruncada = decimal1.format(areaCircunferencia(PI,radio));
		perimetroTruncado = decimal1.format(perimetroCircunferencia(PI,radio));
		System.out.printf("El Area de la circunferencia es: %.1f\n",areaCircunferencia(PI,radio));
		System.out.printf("El perimetro de la circunferencia es: %.1f\n",perimetroCircunferencia(PI,radio));
		System.out.println("El Area de la circunferencia es "+ areaTruncada);
		System.out.println("El permetro de la circunferencia es " + perimetroTruncado);
	}

}
