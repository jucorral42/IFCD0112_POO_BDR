package persona;

public class Persona {
	private String nombre;
	private int edad;
	private double altura;
	private boolean casado;
	public String getNombre() {
		return nombre;
	}
	 void setNombre(String nombre) {
		this.nombre = nombre;
	}
	 int getEdad() {
		return edad;
	}
	 void setEdad(int edad) {
		this.edad = edad;
	}
	 double getAltura() {
		return altura;
	}
	 void setAltura(double altura) {
		this.altura = altura;
	}
	 boolean isCasado() {
		return casado;
	}
	 void setCasado(boolean casado) {
		this.casado = casado;
	}
	Persona(String nombre, int edad, double altura, boolean casado) {
		super();
		this.nombre = nombre;
		this.edad = edad;
		this.altura = altura;
		this.casado = casado;
	}
	
	String toStringA() {
		return "Persona [nombre=" + nombre + ", edad=" + edad + ", altura=" + altura + ", casado=" + casado + "]";
	}
	
	

}
