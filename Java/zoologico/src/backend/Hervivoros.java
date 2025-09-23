package backend;



public class Hervivoros extends Animal {
	private enum Alimento { pollo, cerdo, vaca}
	Alimento comida;
	


	public Alimento getComida() {
		return comida;
	}

	public void setComida(Alimento comida) {
		this.comida = comida;
	}


	@Override
	public String comer () {
		comida = this.comida;
		if (comida == Alimento.pollo) {
			return("El animal se alimenta de pollo");
		}
		if (comida == Alimento.cerdo){
			return("El animal se alimenta de cerdo");
		}
		else 
			return ("El animal se alimenta de vaca");
		}

	public Hervivoros(String nombre, String especie, int edad, double peso, String sexo, boolean esDiurno,
			String habitat, Alimento comida) {
		super(nombre, especie, edad, peso, sexo, esDiurno, habitat);
		this.comida = comida;
	}
	
}
