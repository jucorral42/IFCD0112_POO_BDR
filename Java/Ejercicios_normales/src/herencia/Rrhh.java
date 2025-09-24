package herencia;

public class Rrhh extends Empresa {

	int coddept;
	String nbdept;
	double comision;
	int totalemp;

	// 1 2 3 4 5 6
	// ------------ ----------- ---------- ----------- ------------ ---------
	public Rrhh(int empno, String Nb, int edad, String sex, double sal, int total) {
		super(empno, Nb, edad, sex, sal); // Constructor de Empresa
		this.totalemp = total;
		nbdept = "RRHH"; // Asignamos y fijamos
		coddept = 10; // Asignamos y fijamos
	}

	public int getCoddept() {
		return coddept;
	}

	public String getNbdept() {
		return nbdept;
	}

	public double getComision() {
		return comision;
	}

	public int getTotalemp() {
		return totalemp;
	}
	public double ipc_Sal_Rrhh
	(double sal) {
	return salario=sal*1.1;
	}
}
