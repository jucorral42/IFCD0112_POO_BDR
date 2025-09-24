package herencia;

public class Empresa {
	String nombre;
	int edad;
	double altura; // No lo usaremos
	boolean joven; // Lo fijamos en los dos constructores a valores distintos
	String sexo;
	double salario;
	int codemp;

	// 1 2 3 4 5
	// ------------ ----------- ---------- ------------ ------------
	public Empresa(int empno, String Nb, int edad, String sex, double sal) {
		joven = true; // Lo asignamos y por herencia no se podrá cambiar
		this.sexo = sex;
		this.codemp = empno;
		this.nombre = Nb;
		this.edad = edad;
		this.salario = sal;
	}

	// 1 2
	// -------------- ------------------

	public Empresa(int CodEmp, double Salario) { // Constructor absurdo
		joven = false;
		sexo = "Hombre";
	}

	public Empresa() {
	} // Constructor nulo

	public String getNombre() {
		return nombre;
	}

	public int getEdad() {
		return edad;
	}

	public double getAltura() {
		return altura;
	}

	public boolean isJoven() {
		return joven;
	}

	public String getSexo() {
		return sexo;
	}

	public double getSalario() {
		return salario;
	}

	public int getCodemp() {
		return codemp;
	}

	public double ipc_Sal_Empresa(double sal) {
		return salario = sal * 0.9;
	}
	
}
