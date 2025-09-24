package persona;

public class Mujer extends Persona {
	int numembarazos;
	int numpartos;
	
	 int getNumembarazos() {
		return numembarazos;
	}

	 void setNumembarazos(int numembarazos) {
		this.numembarazos = numembarazos;
	}

	 int getNumpartos() {
		return numpartos;
	}

	void setNumpartos(int numpartos) {
		this.numpartos = numpartos;
	}

	Mujer(String nombre, int edad, double altura, boolean casado, int numembarazos, int numpartos) {
		super(nombre, edad, altura, casado);
		this.numembarazos = numembarazos;
		this.numpartos = numpartos;
	}

	@Override
	public String toString() {
		return "Mujer [numembarazos=" + numembarazos + ", numpartos=" + numpartos + "]";
	}
	
}
