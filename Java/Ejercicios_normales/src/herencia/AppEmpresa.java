package herencia;

import java.text.DecimalFormat;
import javax.swing.JOptionPane;

public class AppEmpresa {
	public static void main(String[] args) {
		DecimalFormat x = new DecimalFormat("#,###.##");

// empno, Nb, edad, sex, sal total
// 1 2 3 4 5 6
// ------- -------- ---- ---------- ------ -----
		Salarial Emp1 = new Salarial(7869, "Luisa", 25, "Mujer", 2000, 25);
		JOptionPane.showMessageDialog(null, Emp1);
		JOptionPane.showMessageDialog(null, Emp1.salida());
		JOptionPane.showMessageDialog(null, Emp1.joven); // Forma no correcta
		JOptionPane.showMessageDialog(null, Emp1.isJoven()); // Forma correcta
		Emp1.ipc_Sal_Salarial(Emp1.getSalario()); // Función de IPC de Salarial + 5%
		JOptionPane.showMessageDialog(null, "El salario actualizado de " + Emp1.getNombre() + " del Subdpto "
				+ Emp1.getNbsubdept() + " es de " + x.format(Emp1.getSalario()) + " €");
		Rrhh Emp2 = new Rrhh(7999, "Juan", 45, "Hombre", 1500, 25); // Constructor Rrhh
		Emp2.ipc_Sal_Rrhh(Emp2.getSalario()); // Función de IPC de Rrhh + 10%
		JOptionPane.showMessageDialog(null, "\nEl salario actualizado de " + Emp2.getNombre() + " del Dpto "
				+ Emp2.getNbdept() + " es de " + x.format(Emp2.getSalario()) + " €");
		Empresa Emp3 = new Empresa(500, "Marta", 59, "Mujer", 3500); //Constructor Empresa
		Emp3.ipc_Sal_Empresa(Emp3.getSalario()); // Función de IPC de Empresa - 10%
		JOptionPane.showMessageDialog(null, "\nEl salario actualizado de "+Emp3.getNombre()
		+" es de "+x.format(Emp3.getSalario())+" €");
	}
}