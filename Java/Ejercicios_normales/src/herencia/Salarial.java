package herencia;

public class Salarial extends Rrhh {
	double codsubdept;
	String nbsubdept;

//1 2 3 4 5 6
//------------ ----------- ---------- ----------- ------------ ---------
	public Salarial(int empno, String Nb, int edad, String sex, double sal, int total) {
		super(empno, Nb, edad, sex, sal, total); // Constructor de Rrhh
		codsubdept = 10.10; // Asignamos y fijamos
		nbsubdept = "Salarial";
	}

	public double getCodsubdept() {
		return codsubdept;
	}

	public String getNbsubdept() {
		return nbsubdept;
	}

	@Override
	public String toString() {
		return ("Nombre Dpto: " + nbdept + "\nNombre Subdpt: " + nbsubdept + "\nCodigo Subdpt: " + codsubdept
				+ "\nNombre: " + nombre + "\n¿Es joven?: " + joven + "\nEdad: " + edad + "\nSexo: " + sexo
				+ "\nSalario: " + salario);

	}
	public String salida() {
		return (
		"Nombre Dpto: "+super.nbdept+"\nNombre Subdpt: "+this.nbsubdept+
		"\nCodigo Subdpt: "+this.codsubdept+"\nNombre: "+super.nombre
		);
		}
	public double ipc_Sal_Salarial
	(double sal) {
	return salario=sal*1.05;
	}
}
