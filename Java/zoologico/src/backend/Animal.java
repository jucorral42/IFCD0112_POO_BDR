package backend;



public abstract class Animal {
	
	String nombre;
	String especie;
	int edad;
	double peso;
	String sexo;
	boolean esDiurno;
	String habitat;
	
	

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getEspecie() {
		return especie;
	}
	public void setEspecie(String especie) {
		this.especie = especie;
	}
	public int getEdad() {
		return edad;
	}
	public void setEdad(int edad) {
		this.edad = edad;
	}
	public double getPeso() {
		return peso;
	}
	public void setPeso(double peso) {
		this.peso = peso;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public boolean isEsDiurno() {
		return esDiurno;
	}
	public void setEsDiurno(boolean esDiurno) {
		this.esDiurno = esDiurno;
	}
	public String getHabitat() {
		return habitat;
	}
	public void setHabitat(String habitat) {
		this.habitat = habitat;
	}
	
	public abstract String comer();
	
	
	int dormir (int horasSueño) {
		return (horasSueño);
	}
	void moverse () {
		
	}
	void sonido() {}
	
	public Animal(String nombre, String especie, int edad, double peso, String sexo, boolean esDiurno, String habitat) {
		this.nombre = nombre;
		this.especie = especie;
		this.edad = edad;
		this.peso = peso;
		this.sexo = sexo;
		this.esDiurno = esDiurno;
		this.habitat = habitat;
	}
	
	
	@Override
	public String toString() {
		return "animal [nombre=" + nombre + ", especie=" + especie + ", edad=" + edad + ", peso=" + peso + ", sexo="
				+ sexo + ", esDiurno=" + esDiurno + ", habitat=" + habitat + "]";
	}

	
	

	

}
