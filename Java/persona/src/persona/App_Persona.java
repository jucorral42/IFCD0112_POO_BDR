package persona;

public class App_Persona {

	public static void main(String[] args) {
		// Mujer(String nombre, int edad, double altura, boolean casado, int numembarazos, int numpartos)
		Mujer m1 = new Mujer ("Luisa",30,1.70, false, 0,0);
		
		System.out.println("mujer" + m1.toString()+  "persona "+ m1.toStringA());
		m1.setCasado(true);
		System.out.println("mujer" + m1.toString()+  "persona "+ m1.toStringA());

	}

}
