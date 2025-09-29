package Asignaturas;

public class Lengua {
	private double nota1;
	private double nota2;
	
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
	

 public Lengua(double nota1, double nota2) {
		super();
		this.nota1 = nota1;
		this.nota2 = nota2;
	}

public void lengua() {
	System.out.printf("La nota media de lengua es %.2f \n",(nota1+nota2)/2);
}
}
