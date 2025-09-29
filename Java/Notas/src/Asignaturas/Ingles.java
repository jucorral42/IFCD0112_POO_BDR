package Asignaturas;

public class Ingles {
	private double nota1;
	private double nota2;
	private double nota3;
	private int nota4;
	private int nota5;

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

	public int getNota4() {
		return nota4;
	}

	public void setNota4(int nota4) {
		this.nota4 = nota4;
	}

	public int getNota5() {
		return nota5;
	}

	public void setNota5(int nota5) {
		this.nota5 = nota5;
	}

	public Ingles(double nota1, double nota2, double nota3, int nota4, int nota5) {
		super();
		this.nota1 = nota1;
		this.nota2 = nota2;
		this.nota3 = nota3;
		this.nota4 = nota4;
		this.nota5 = nota5;
	}

	public double ingles() {
		double notaFinal;
		notaFinal = (nota1 * 0.1) + (nota2 * 0.1) + (nota3 * 0.1) + (nota4 * 0.3) + (nota4 * 0.4);
		return notaFinal;
	}

}
