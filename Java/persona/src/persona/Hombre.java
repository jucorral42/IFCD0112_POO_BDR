package persona;

public class Hombre extends Persona {

	int longpene;
	int numtesticulos;
	int getLongpene() {
		return longpene;
	}
	void setLongpene(int longpene) {
		this.longpene = longpene;
	}
	int getNumtesticulos() {
		return numtesticulos;
	}
	void setNumtesticulos(int numtesticulos) {
		this.numtesticulos = numtesticulos;
	}
	Hombre(String nombre, int edad, double altura, boolean casado, int longpene, int numtesticulos) {
		super(nombre, edad, altura, casado);
		this.longpene = longpene;
		this.numtesticulos = numtesticulos;
	}
	
	public String toString() {
		return "Hombre [longpene=" + longpene + ", numtesticulos=" + numtesticulos + "]";
	}
	



}
