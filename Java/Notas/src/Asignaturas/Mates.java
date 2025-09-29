package Asignaturas;

public class Mates {
	private double nota1;
	private double nota2;
	private double nota3;

	public double getNota1() {
		return nota1;
	}

	public void setNota1(double nota1) {
		this.nota1 = nota1;
	}

	public double getNota2() {
		return nota2;
	}

	public void setNota2(double nota2) {
		this.nota2 = nota2;
	}

	public double getNota3() {
		return nota3;
	}

	public void setNota3(double nota3) {
		this.nota3 = nota3;
	}

	public Mates(double nota1, double nota2, double nota3) {
		super();
		this.nota1 = nota1;
		this.nota2 = nota2;
		this.nota3 = nota3;
	}

	public Mates() {
	}

	public void matematicas() {
		double media = (nota1 * 0.3) + (nota2 * 0.3) + (nota3 * 0.4);
		System.out.printf("La nota media de matematicas es %.2f \n", media);

	}
}
